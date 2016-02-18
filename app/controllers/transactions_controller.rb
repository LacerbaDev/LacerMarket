class TransactionsController < ApplicationController

	def create
		content = Content.find_by!(slug: params[:slug])
		sale = content.sales.create(
			amount: (content.price * 100).floor,
			email_acquirente: current_user.email,
			email_venditore: content.user.email,
			stripe_token: params[:stripeToken])
		sale.running!

		if sale.completed?
			redirect_to pickup_url(guid: sale.guid)
		else
			redirect_to content_path(content), notice: @error
		end
	end

	def pickup
		@sale = Sale.find_by!(guid: params[:guid])
		@content = @sale.content
	end

end