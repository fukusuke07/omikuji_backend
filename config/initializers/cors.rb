Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins /localhost\:\d+/, /omikuji-frontend\.vercel\.com/
  
      resource "*",
        headers: :any,
        expose: ["access-token", "expiry", "token-type", "uid", "client","authorization"], # 追記
        methods: [:get, :post, :put, :patch, :delete, :options, :head]
    end
  end
