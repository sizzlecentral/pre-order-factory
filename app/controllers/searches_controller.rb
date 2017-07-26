class SearchesController < ShopifyApp::AuthenticatedController
  def results




    @products =
      ShopifyAPI::Product.all.select do |product|


        product.attributes["title"].downcase[params["q"].downcase]
  

      end
  end
end
