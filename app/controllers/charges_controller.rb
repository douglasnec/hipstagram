class ChargesController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
  end

  def create
    @amount = 1000
    @post = Post.find(params[:post_id])

    customer = Stripe::Customer.create(
      :email => current_user.email
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => "Print of" + @post.title
      :currency    => 'gbp'
    )

    flash[:alert] = "Thanks for you support!"
    redirect_to post_path(@post)
    # Order.create(:user => current_user, :amount => @amount)


  rescue Stripe::CardError => e
    flash[:error] = "Something went wrong with your payment"
    redirect_to post_path(@post)
  end
end
