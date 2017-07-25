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
    @batch = Batch.new
  end

  def batchshow
    @batch = Batch.find(params[:id])
    @products = ShopifyAPI::Product.find(:all)

    @products.each do |product|
      if @batch.product_id == product.id 
        @product = product
      end
    end

    @orders = ShopifyAPI::Order.find(:all)
  end

end
