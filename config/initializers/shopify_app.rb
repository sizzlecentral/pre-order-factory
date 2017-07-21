ShopifyApp.configure do |config|
  config.application_name = "My Shopify App"
  config.api_key = '627c435a06c69e6094eaae3ece3e91d1'
  config.secret = '59a79473b29239eaf0c3bb7fe985fbbf'
  config.scope = "read_orders, read_products, read_customers, read_themes, write_themes"
  config.embedded_app = true
end
