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
    @orders = ShopifyAPI::Order.find(:all)

    @products.each do |product|
      if @batch.product_id == product.id
        @product = product
      end
    end

  end

  def batchedit
    @batch = Batch.find(params[:id])
    @product = ShopifyAPI::Product.find(@batch.product_id)
  end

  def batchupdate
    @batch = Batch.find(params[:id])
    @product = ShopifyAPI::Product.find(params[:id])
    if @batch.update(params.permit(:start_date, :end_date, :min_quantity, :active))
      flash[:alert] = "The batch has been updated"
      redirect_to home_path
    else
      redirect_back_or_to @batch
    end
  end

end
