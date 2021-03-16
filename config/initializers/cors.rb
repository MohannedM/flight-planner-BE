Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
        origins "http://localhost:3000"
        resource "*", headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true, expose: ['Set-Cookie']
    end

    allow do
        origins "https://flight-planner-fe.herokuapp.com/"
        resource "*", headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true, expose: ['Set-Cookie']
    end
end