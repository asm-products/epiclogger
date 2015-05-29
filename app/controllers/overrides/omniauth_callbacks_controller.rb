module Overrides
  class OmniauthCallbacksController < DeviseTokenAuth::OmniauthCallbacksController

    def omniauth_success
      # find or create user by criteria defined in resource_identification_hash
      @resource = resource_class.where(resource_identification_hash).first_or_initialize

      # sync user info with provider, update/generate auth token
      assign_provider_attrs(@resource, auth_hash)

      # assign any additional (whitelisted) attributes
      extra_params = whitelisted_params
      @resource.assign_attributes(extra_params) if extra_params

      # create token info
      @client_id = SecureRandom.urlsafe_base64(nil, false)
      @token     = SecureRandom.urlsafe_base64(nil, false)
      @expiry    = (Time.now + DeviseTokenAuth.token_lifespan).to_i

      @auth_origin_url = generate_url(omniauth_params['auth_origin_url'], {
        token:     @token,
        client_id: @client_id,
        uid:       @resource.uid,
        expiry:    @expiry
      })

      # set crazy password for new oauth users. this is only used to prevent
      # access via email sign-in.
      if @resource.new_record?
        p = SecureRandom.urlsafe_base64(nil, false)
        @resource.password = p
        @resource.password_confirmation = p
      end

      @resource.tokens[@client_id] = {
        token: BCrypt::Password.create(@token),
        expiry: @expiry
      }

      if resource_class.devise_modules.include?(:confirmable)
        # don't send confirmation email!!!
        @resource.skip_confirmation!
      end

      sign_in(:user, @resource, store: false, bypass: false)

      @resource.save!

      # render user info to javascript postMessage communication window
      render :layout => "layouts/omniauth_response", :template => "devise_token_auth/omniauth_success"
    end

    # This is the criteria used to map the user defined by the auth_hash to
    # the users in our DB.
    # Example:
    #
    # If we want to map a facebook user with one that registered previously
    # with email/password we could override this method with a hash like this:
    #   { email: auth_hash['info']['email'] }
    def resource_identification_hash
      { email: auth_hash['info']['email'] }
    end

  end
end