import '../model/movie_model.dart';

class BookingData {
  static List<Booking> _bookings = [];

  static List<Booking> getBookings() {
    return List.from(_bookings);
  }

  static void addBooking(Booking booking) {
    _bookings.add(booking);
  }

  static void removeBooking(String bookingId) {
    _bookings.removeWhere((booking) => booking.id == bookingId);
  }

  static Booking? getBookingById(String bookingId) {
    try {
      return _bookings.firstWhere((booking) => booking.id == bookingId);
    } catch (e) {
      return null;
    }
  }

  static List<Booking> getBookingsByMovieId(String movieId) {
    return _bookings.where((booking) => booking.movieId == movieId).toList();
  }

  static void clearAllBookings() {
    _bookings.clear();
  }
}
