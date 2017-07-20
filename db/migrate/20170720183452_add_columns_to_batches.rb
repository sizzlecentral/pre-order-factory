class AddColumnsToBatches < ActiveRecord::Migration[5.1]
  def change
    remove_column :batches, :title, :string
    add_column :batches, :product_id, :bigint
    add_column :batches, :start_date, :date
    add_column :batches, :end_date, :date
    add_column :batches, :min_quantity, :integer
    add_column :batches, :num_sold, :integer
    add_column :batches, :active, :boolean
  end
end
