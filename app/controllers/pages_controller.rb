class PagesController < ApplicationController
	before_action :authenticate_user!, only: [:dashboard]
  
  def home
  end

  def about
  end

  def dashboard
  	@content = current_user.contents
  	@sales = Sale.where(email_venditore: current_user.email)
  	@purchased = Sale.where(email_acquirente: current_user.email)
  end

end
