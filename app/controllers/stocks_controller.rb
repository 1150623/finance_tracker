class StocksController < ApplicationController

  def search
   
    if params[:stock].blank?
      flash.now[:danger] = "You can't leave stock ticker symbol emtpy!"
    else  
      @stock = Stock.new_from_lookup(params[:stock])
      flash.now[:danger] = "You Entered An Incorrect Symbol!" unless @stock
    end
    
    respond_to do |format|
      format.js { render partial: 'users/result' }
    end
  
  end



end