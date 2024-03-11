class UserStocksController < ApplicationController
    def create
        # byebug
        @stock = Stock.where(ticker:params[:stock]).first
        if !@stock
            @stock = Stock.new_lookup(params[:stock])
            @stock.save
        end
        current_user.stocks << @stock
        redirect_to my_stock_path
    end

    def destroy
        @stock = current_user.stocks.where(id:params[:id]).first
        if @stock.destroy
            redirect_to my_stock_path
        else
            flash[:notice] = "Not Deleted"
        end
    end
end
