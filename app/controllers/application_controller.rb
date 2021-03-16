class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token

    def welcome
        render json: {message: "Welcome To Flight Planner"}, status: 200
    end
end
