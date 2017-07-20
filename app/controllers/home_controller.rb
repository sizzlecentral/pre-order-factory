class HomeController < ShopifyApp::AuthenticatedController
  def index
    @products = ShopifyAPI::Product.find(:all)
    @orders = ShopifyAPI::Order.find(:all)
    @batches = Batch.all
  end
end
