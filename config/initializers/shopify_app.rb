ShopifyApp.configure do |config|
  config.application_name = "My Shopify App"
  config.api_key = ENV["SHOPIFY_API_KEY"]
  config.secret = ENV["SHOPIFY_SECRET"]
  config.scope = "read_orders, read_products, read_customers, read_themes, write_themes"
  config.embedded_app = true
  config.webhooks = [
    {topic: 'orders/create', address: 'https://pre-order-factory.herokuapp.com/webhooks/orders_create', format: 'json'},
  ]
end
