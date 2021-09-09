
class AuthenticateUser
  prepend SimpleCommand
  attr_reader :user, :email, :password, :token
  def initialize(email, password)
    @email = email
    @password = password
  end
  def call
    @token = JWT.encode(user, "MY_SECRET_KEY") if authorize
  end
  private
  def authorize
    @user = User.find_by_email(email)
    return @user if @user && @user.authenticate(password)
     # head(:unauthorized)
  end
end