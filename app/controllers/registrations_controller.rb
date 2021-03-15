class RegistrationsController < ApplicationController
    def create
        user = User.create!(
            username: params['username'],
            password: params['password'],
            password_confirmation: params['password_confirmation'],
        )

        if user
            session[:user_id] = user.id
            session[:is_admin] = user.is_admin
            render json: {
                status: :created,
                user: user
            }
        else
            render json: { status: 500 }
        end
    end
end