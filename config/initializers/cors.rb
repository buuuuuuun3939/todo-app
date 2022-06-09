# config/initializers/cors.rb

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'localhost:3000/', 'localhost:3030'
    resource '*',
      headers: :any, 
      methods: [:get, :post, :patch, :put, :options, :delete, :head],
      credentials: true
  end
end