class Show < ApplicationRecord
  belongs_to :movie
  has_many :tickets, dependent: :destroy
  validates :ticket_price, numericality: { greater_than_or_equal_to: 0, message: "must be a positive number" }
  validates :seats_available, numericality: { only_integer: true, greater_than_or_equal_to: 0, message: "must be a non-negative integer" }
  validates :movie_id, presence: true
  validates :date, :time, presence: true
  def movie_title
    movie.title
  end
end
