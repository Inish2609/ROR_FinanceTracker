class UserStocksController < ApplicationController
    def create
        # byebug
        @stock = Stock.where(ticker:params[:stock]).first
        if !@stock
            @stock = Stock.new_lookup(params[:stock])
        end
        @stock.save
        current_user.stocks << @stock
    end
end
