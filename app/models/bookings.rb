# Add validation for available seats
validate :seats_availability

private
def seats_availability
  return if number_of_tickets <= showtime.available_seats
  
  errors.add(:base, "Not enough available seats")
end

# Add counter cache for seats (requires migration)
belongs_to :showtime, counter_cache: :booked_seats
