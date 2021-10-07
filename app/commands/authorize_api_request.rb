class AuthorizeApiRequest
  prepend SimpleCommand

  def initialize(headers = {})
    @headers = headers
  end

  def call
    api_request
  end

  private

  attr_reader :headers

  def api_request
    @user ||= decoded_auth_token if decoded_auth_token
    @user || (errors.add(:token, 'Invalid token') && nil)
  end

  def decoded_auth_token
    JWT.decode(http_auth_header.to_s, 'MY_SECRET_KEY')
  end

  def http_auth_header
    return headers['Authorization'].split.last if headers['Authorization'].present?

    errors.add(:token, 'Missing token')
    nil
  end
end
