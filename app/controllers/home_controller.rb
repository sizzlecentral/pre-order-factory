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
    @id = batch_params[:product_id]
    @product = ShopifyAPI::Product.find(@id)
    if @batch.update(batch_params)
      flash[:alert] = "The batch has been updated"
      redirect_to home_path(id: @id)
    else
      render 'home/batchedit'
    end
  end

  def batchcreate
    @batch = Batch.new(batch_params)
    @batch.active = true
    @id = batch_params[:product_id]
    @new_batch_id = @batch.id
    if @batch.save
      Batch.where(product_id: @id).each do |batch|
        batch.update(active:false)
      end
      Batch.where(product_id: @id).last.update(active: true)
      flash[:alert] = "The batch has been created"
      redirect_to home_path(id: params[:batch][:product_id])
    else
      @product = ShopifyAPI::Product.find(@id)
      @batches = Batch.where(product_id: @id)
      return render 'home/show'
    end
  end

  private

  def batch_params
    params.require(:batch).permit(:product_id, :start_date, :end_date, :min_quantity, :num_sold, :active)
  end

end
