# Class: Style
#
# Creates new style objects/records for styles table in beer wiki database.
# 
# Attributes:
# @id         - Integer: the primary key identifier for each style.
# @type       - String: the style name. 
# @color      - String: the color range.
# @bitterness - String: the bitterness range.
# @alcohol    - String: the alcohol range.
# @flavor     - String: a short description of the style flavor.
# @related    - String: related beer styles.
#
# Public Methods:
# None
#
# Private Methods:
# #initialize

class User < ActiveRecord::Base
  
  include BCrypt
  
  def create
    @user = User.new(params[:user])
    @user.password = params[:password]
    @user.save!
  end
  
end
  