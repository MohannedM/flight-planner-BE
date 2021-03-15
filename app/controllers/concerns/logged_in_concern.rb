module LoggedInConcern
    extend ActiveSupport::Concern

    included do
        before_action :check_logged_in
    end

    def check_logged_in
        if !@current_user
            return render json: { message: "Unauthorized" }, status: 401
        end
    end
end