# Preview all emails at http://localhost:3000/rails/mailers/room_booking_mailer
class RoomBookingMailerPreview < ActionMailer::Preview

  def new_booking_notification
    RoomBookingMailer.new_booking_notification(Booking.first , "test@gmail.com")
  end

  def booking_confirmation
    RoomBookingMailer.booking_confirmation(Booking.first)
  end

  def booking_approved
    RoomBookingMailer.booking_approved(Booking.last)
  end
end
