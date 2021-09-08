
class AuthenticateUser
    prepend SimpleCommand
    attr_reader :user, :email, :password
  
    def initialize(email, password)
      @email = email
      @password = password
    end
  
    def call
      JsonWebToken.encode(user_id: user.id) if user
    end
  
    private
  
    # attr_accessor :email, :password
  
  
    def authorize
      @user = User.find_by_email(email)
      return @user if @user && @user.authenticate(password)
      head(:unauthorized)
    end
  
   
  
  end