class Message < ApplicationRecord
  belongs_to :user
  belongs_to :booking
  validates :content, presence: true

  after_save_commit :broadcast_message

  private

  def broadcast_message
    # Broadcast the new message HTML
    # to everyone one subscribed in the radio frequency
    broadcast_append_to(
      "bookings_#{self.booking.id}_messages", # frequency
      partial: 'messages/message', # What shgould we broadcast
      locals: { message: self }
    )
  end
end
