#Note that we place the set_cart() method in a CurrentCart module
#and place that module in the app/controllers/concerns directory.
#This treatment allows us to share common code (even as little as
#a single method!) among controllers. Additionally, we mark the method
# as private, which prevents Rails from evermaking it available as
# an action on the controller.P137
module CurrentCart
  private
    def set_cart
      @cart = Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
end
