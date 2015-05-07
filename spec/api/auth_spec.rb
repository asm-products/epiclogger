require 'rails_helper'

describe "Auth API" do

  it 'can login with valid credentials' do
    member = create(:member, password: "hello123", password_confirmation: "hello123")
    post '/api/v1/auth/sign_in', {email: member.email, password: "hello123"}
    expect(response).to be_success
  end

  it 'fails to login with invalid credentials' do
    member = create(:member, password: "hello123", password_confirmation: "hello123")
    post '/api/v1/auth/sign_in', {email: member.email, password: "123456"}
    expect(response).to have_http_status(:unauthorized)
  end

  it 'has access once logged in' do
    member = create(:member, password: "hello123", password_confirmation: "hello123")
    post '/api/v1/auth/sign_in', {email: member.email, password: "hello123"}
    expect(response).to be_success


    get '/api/v1/errors',{}, {"client" => response.headers["client"], "uid" => response.headers["uid"], "access-token"=> response.headers["access-token"], "expiry" => response.headers["expiry"], "token-type" => response.headers["token-type"]}
    expect(response).to be_success

    json = JSON.parse(response.body)
    expect(json).to eq({})
  end

end