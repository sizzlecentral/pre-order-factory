class BatchesController < ShopifyApp::AuthenticatedController

def index
  # @productId = params[:id]
  @product = ShopifyAPI::Product.find(params[:id])
  @batches = Batch.where(product_id: params[:id])
  @batch = Batch.new
end
end
