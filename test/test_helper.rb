ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

#統合テストで扱うヘルパーはActionDispatch::IntegrationTestクラスの中で定義
class ActionDispatch::IntegrationTest
 
  # テストユーザーとしてログインする
  #def log_in_as(user, password: 'password')
  #  user = FactoryBot.create(:user)
  #  post auth_path, params: { session: { email: user.email,
  #                                       password: password,
  #                                      } }
  #end
end