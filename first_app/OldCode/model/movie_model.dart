class Movie {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String genre;
  final String duration;
  final double rating;
  final String director;
  final List<String> cast;
  final String releaseDate;
  final double price;
  final List<String> showTimes;
  final String ageRating;

  Movie({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.genre,
    required this.duration,
    required this.rating,
    required this.director,
    required this.cast,
    required this.releaseDate,
    required this.price,
    required this.showTimes,
    required this.ageRating,
  });
}

class Booking {
  final String id;
  final String movieId;
  final String movieTitle;
  final String showTime;
  final List<String> seats;
  final double totalPrice;
  final DateTime bookingDate;
  final String status;

  Booking({
    required this.id,
    required this.movieId,
    required this.movieTitle,
    required this.showTime,
    required this.seats,
    required this.totalPrice,
    required this.bookingDate,
    required this.status,
  });
}
