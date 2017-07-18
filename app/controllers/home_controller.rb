class HomeController < ShopifyApp::AuthenticatedController
  def index
    @products = ShopifyAPI::Product.find(:all)
    @product = ShopifyAPI::Product.find(:id)
    @orders = ShopifyAPI::Order.find(:all)
  end
end
