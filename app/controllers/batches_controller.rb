class BatchesController < ApplicationController

  def index
    @batches = Batch.all

    respond_to do |format|
      format.json {render json: @batches}
    end

  end

  def create
    @batch = Batch.new(batch_params)
    @id = batch_params[:product_id]
    if @batch.save
      redirect_to home_path(id: @id)
    else
      # render :new
    end
  end

  def edit
    @batch = Batch.find(params[:id])
  end

  def update
    @batch = Batch.find(params[:id])
    if @batch.update(batch_params)
      flash[:alert] = "The batch has been updated"
      redirect_to home_path(id: @id)
    else
      redirect_back_or_to @batch
    end
  end

  private

  def batch_params
    params.require(:batch).permit(:product_id, :start_date, :end_date, :min_quantity, :num_sold, :active)
  end

end
