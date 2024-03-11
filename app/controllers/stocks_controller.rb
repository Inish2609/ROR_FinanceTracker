class StocksController < ApplicationController
    def search
        # byebug
        if params[:stock].present?
            @stock = Stock.new_lookup(params[:stock])
            if @stock
                respond_to do |format|
                    format.js { render partial: 'pages/result'}
                end
            else
                respond_to do |format|
                    flash.now[:alert] = "Please Enter The Correct Symbol"
                    format.js { render partial:'pages/result'}
                end
            end
        else
            respond_to do |format|
                flash.now[:alert] = "Please Enter The Symbol"
                format.js { render partial:'pages/result'}
            end
        end
    end
end
