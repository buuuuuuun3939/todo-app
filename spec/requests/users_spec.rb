require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/users", type: :request do
  
  # ok
  #describe "GET #index" do
  #  example "200が返却される" do
  #    expect {
  #      get users_path
  #      response.to be_successful
  #      response.to have_http_status 200
  #    }
  #  end
  #end

  # ok
  #describe "GET #show" do
  #  let(:id) {1}
  #  example "200が返却される" do
  #    expect {
  #      get users_path(id)
  #      response.to be_successful
  #      response.to have_http_status 200
  #    }
  #  end
  #end

  describe "POST #create" do
    # ok
    context "with valid parameters" do
      it "creates a new User" do
        
        # ちゃんとFactoryBotで書きたい
        request_body = {display_name: "fuga4342", email: "fuga434@gmail.com", password: "1passworD", password_confirmation: "1passworD"}
        #binding.pry
        expect {
          post users_path params: (request_body), as: :json, headers: { 'Content-Type' => 'application/json' }
        }.to change(User, :count).by(1)
        #expect {
        #  response.to be_successful
        #  response.to have_http_status 201
        #  session[:user_id].not_to eq nil #本来ならここでsession_idが返ってきているはず
          #print(session[:user_id])
        #}
      end
    end
    #context "with invalid parameters" do
    #  it "does not create a new User" do
        # ちゃんとFactoryBotで書きたい
        # passwordが違うからアカウントは作成できないはず
    #    request_body = {display_name: "hoge", email: "hoge@gmail.com", password: "password", password_confirmation: "password1010"}
    #    expect {
    #       post users_path, params: (request_body), as: :json, headers: { 'Content-Type' => 'application/json' }
    #    }.to change(User, :count).by(0)
    #    expect {
    #      response.not_to be_successful
    #      response.to have_http_status 400
    #    }
    #  end
    #end
  end

  #describe "PATCH /update" do
  #  context "with valid parameters" do
  #    before do
  #      old_info = '{ 
  #                    display_name: "hoge",
  #                    email: "hoge@gmail.com",
  #                    password: "password", 
  #                    password_confirmation: "password"
  #                  }'

  #                        display_name: "hoge",
  #                        email: "hoge@gmail.com",
  #                        old_password: "password", 
  #                        password: 1234567890,
  #                        password_confirmation: 1234567890
  #                      }'
  #      post users_path, params: old_info, as: :json, headers: { 'Content-Type' => 'application/json' }
  #    end

  #    it "updates the requested user" do
  #      expect {
  #        patch users_path/1, params: update_info, as: :json, headers: { 'Content-Type' => 'application/json' } 
  #        user.reload
  #      }
  #    end
  #  end

  #end
end
