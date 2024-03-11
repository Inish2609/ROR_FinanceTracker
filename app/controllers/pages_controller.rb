class PagesController < ApplicationController
  
  def home

  end

  def about
  
  end
  
  def my_stock
    @traked_stocks = current_user.stocks
  end

  def my_friends
    @friends = current_user.friends
  end

  def delete_friends
    # byebug
    @friend = Friendship.find_by(user_id:current_user,friend_id:params[:id])
    if @friend.destroy
      redirect_to my_friends_path
    end
  end

  def search_friends
    if params[:friend].present?
      @friend = User.where("first_name LIKE ? AND id != ? ","%#{params[:friend]}%",current_user.id).all
      # @friend = current_user.reject_current(@friend)
      if @friend
        respond_to do |format|
          format.js { render partial: 'pages/friend'}
      end
      else
        flash.now[:alert] = "Enter The Valid Users"
        respond_to do |format|
          format.js { render partial: 'pages/friend'}
        end
      end
    else
      flash.now[:alert] = "Enter The User Name"
      respond_to do |format|
        format.js { render partial: 'pages/friend'}
      end
    end
  end

  def add_friend
    # byebug
    current_user.friends << User.find(params[:id])
    redirect_to my_friends_path
  end

end
