class HomeController < ShopifyApp::AuthenticatedController

  def index
    @products = ShopifyAPI::Product.find(:all)
    @orders = ShopifyAPI::Order.find(:all)
    @themes = ShopifyAPI::Theme.find(:all)
    @batches = Batch.all
    @batch = Batch.new
  end

  def show
    @product = ShopifyAPI::Product.find(params[:id])
    @batches = Batch.where(product_id: params[:id])
    # @batches = Batch.all
    @batch = Batch.new
  end

end
