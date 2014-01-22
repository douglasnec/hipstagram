class ChargesController < ApplicationController

  def new
    # @post = Post.find(params[:post_id])
  end

  def create
    @amount = 1000

    customer = Stripe::Customer.create(
      :email => 'example@stripe.com', #@post.user.email, adduserif
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'gbp'
    )

  rescue Stripe::CardError => e
    flash[:error] = "Something went wrong with your payment"
    redirect_to post_path(@post)
  end
end
