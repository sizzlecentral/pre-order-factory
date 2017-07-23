class BatchesController < ApplicationController

  def index
    @batches = Batch.all
    @batch = Batch.new
  end

  def create
    @batch = Batch.new(batch_params)
    if @batch.save
      redirect_to root
    else
      render :new
    end
  end

  private

  def batch_params
    params.require(:batch).permit(:product_id, :start_date, :end_date, :min_quantity, :num_sold, :active)
  end

end
