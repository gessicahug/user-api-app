class UserCreator
  include JsonWebToken
  def initialize(params)
    @params = params
  end

  def create_user
    user = User.new(
      name: @params['name'],
      email: @params['email'],
      password: @params['password']
    )
    token = jwt_encode(user_id: user.id)
    user.token = token
    user.save
    user
  end
end
