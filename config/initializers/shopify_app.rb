ShopifyApp.configure do |config|
  config.application_name = "My Shopify App"
  config.api_key = "4ceb689b522b40e9e0fb46776d88bc31"
  config.secret = "704e0912cca4db9769937536ab21c968"
  config.scope = "read_orders, read_products"
  config.embedded_app = true
end
