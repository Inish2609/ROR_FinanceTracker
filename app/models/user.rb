class User < ApplicationRecord
  has_many:user_stocks
  has_many:stocks,through: :user_stocks
  has_many:friendships
  has_many:friends,through: :friendships
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def reject_current(users)
    users.reject{ |user| user.id == self.id}
    return users
  end

end
