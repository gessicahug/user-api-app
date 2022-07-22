module User
  class UpdateUser < ApplicationService
    def initialize(params, user)
      @params = params
      @user = user
    end

    def call
      update_user
    end

    private

    def update_user
      @user = User.update(
        name: @params['name'],
        email: @params['email']
      )
    end
  end
end
