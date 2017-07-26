ShopifyApp.configure do |config|
  config.application_name = "My Shopify App"
  config.api_key = "f1af31633f1e1c7fdaf9d830d25bb393"
  config.secret = "b23497b13ee5d914aee71b31e46d2855"
  config.scope = "read_orders, read_products, read_customers, read_themes, write_themes"
  config.embedded_app = true
  config.webhooks = [
    {topic: 'orders/create', address: 'https://e4abde2a.ngrok.io/webhooks/orders_create', format: 'json'},
  ]
end
