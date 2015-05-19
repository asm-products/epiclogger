require 'rails_helper'

describe "Auth API" do
  let!(:member) { FactoryGirl.create(:member) }
  let!(:website) { FactoryGirl.create(:website, member_id: member.id) }

  it 'can login with valid credentials' do
    post '/api/v1/auth/sign_in', {email: member.email, password: "hello123"}
    expect(response).to be_success
  end

  it 'fails to login with invalid credentials' do
    post '/api/v1/auth/sign_in', {email: member.email, password: "123456"}
    expect(response).to have_http_status(:unauthorized)
  end

  it 'has access once logged in' do
    post '/api/v1/auth/sign_in', {email: member.email, password: "hello123"}
    expect(response).to be_success


    get '/api/v1/errors',{website_id: website.id}, {"client" => response.headers["client"], "uid" => response.headers["uid"], "access-token"=> response.headers["access-token"], "expiry" => response.headers["expiry"], "token-type" => response.headers["token-type"]}
    expect(response).to be_success

    json = JSON.parse(response.body)
    expect(json).to eq({'errors'=> []})
  end

end