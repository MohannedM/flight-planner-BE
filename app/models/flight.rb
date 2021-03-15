class Flight < ApplicationRecord
    validates_presence_of :origin
    validates_presence_of :destination
    validates_presence_of :seat_count
    validates_presence_of :flight_date

    has_and_belongs_to_many :users
end
