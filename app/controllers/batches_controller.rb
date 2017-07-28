class BatchesController < ApplicationController

  def index
   @batches = Batch.all
   render json: @batches
  end

  def show
    @productbatches = Batch.where(product_id: params[:id])
    render json: @productbatches
  end
  private

  def batch_params
    params.require(:batch).permit(:product_id, :start_date, :end_date, :min_quantity, :num_sold, :active)
  end

end
