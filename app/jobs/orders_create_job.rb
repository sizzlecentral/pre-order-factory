class OrdersCreateJob < ActiveJob::Base
  def perform(shop_domain:, webhook:)
    shop = Shop.find_by(shopify_domain: shop_domain)

    shop.with_shopify_session do
      line_items = webhook[:line_items]
      line_items.each do |item|
        product_id = item[:product_id]
        activeBatch = Batch.where(product_id: product_id, active: true)
        activeBatch.each do |batch|
          if batch.num_sold.nil?
            batch.update(num_sold: 1)
          else
            batch.update(num_sold: (batch.num_sold + 1))
          end
        end
      end
    end
  end

end
