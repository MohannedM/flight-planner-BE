class FlightsController < ApplicationController
    include CurrentUserConcern
    include LoggedInConcern

    def create
        if !@current_user.is_admin
            return render json: { message: "Unauthorized" }, status: 401
        end
        flight = Flight.create!(
            plane_type: params["plane_type"],
            origin: params["origin"],
            destination: params["destination"],
            seat_count: params["seat_count"],
            flight_date: params["flight_date"]
        )

        if flight
            render json: {
                flight: flight
            }, status: 201
        else
            render json: { status: 500 }
        end
    end

    def index
        flights = Flight.all()

        if flights
            render json: {
                flights: flights
            }, status: 200
        else
            render json: { status: 500 }
        end
    end

    def show
        flight = Flight.find(params[:id])

        if flight
            render json: {
                flight: flight
            }, status: 200
        else
            render json: { message: "Not found" }, status: 404
        end
    end

    def destroy
        if !@current_user.is_admin
            return render json: { message: "Unauthorized" }, status: 401
        end
        flight = Flight.find(params[:id])

        if flight
            flight.destroy
            render json: {
                flight: flight
            }, status: 200
        else
            render json: { message: "Not found" }, status: 404
        end
    end

    def book_flight
        flight = Flight.find(params[:id])

        if flight
            if flight.reserved_seats == flight.seat_count
                return render json: {
                    message: "Sorry, the plane is fully reserved"
                }, status: 400
            end
            @current_user.flights << flight
            reserved_seat_cont = flight.reserved_seats + 1
            flight.update(reserved_seats: reserved_seat_cont)
            flight.update(pnr: "#{flight.id}#{reserved_seat_cont}#{flight.origin[0..1]}#{flight.destination[0..1]}")
            render json: {
                flight: flight
            }, status: 200
        else
            render json: { message: "Not found" }, status: 404
        end
    end


    def booked_flights
        render json: {
            flights: @current_user.flights
        }, status: 200
    end
end
