# Add association and seat calculation
has_many :bookings
belongs_to :movie
belongs_to :theater

def available_seats
  seats - booked_seats
end
