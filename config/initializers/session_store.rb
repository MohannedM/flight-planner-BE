if Rails.env == "production"
    Rails.application.config.session_store :cookie_store, key: "_flight_planner", domain: "flight-planner-app-task.herokuapp.com"
else
    Rails.application.config.session_store :cookie_store, key: "_flight_planner"
end