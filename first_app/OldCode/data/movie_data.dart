import '../model/movie_model.dart';

class MovieData {
  static List<Movie> getMovies() {
    return [
      Movie(
        id: '1',
        title: 'Avatar: The Way of Water',
        description:
            'Set more than a decade after the events of the first film, Avatar: The Way of Water begins to tell the story of the Sully family, the trouble that follows them, the lengths they go to keep each other safe, the battles they fight to stay alive, and the tragedies they endure.',
        imageUrl:
            'https://image.tmdb.org/t/p/w500/t6HIqrRAclMCA60NsSmeqe9RmNV.jpg',
        genre: 'Sci-Fi, Adventure',
        duration: '192 min',
        rating: 7.8,
        director: 'James Cameron',
        cast: ['Sam Worthington', 'Zoe Saldana', 'Sigourney Weaver'],
        releaseDate: '2022-12-16',
        price: 12.99,
        showTimes: ['10:00 AM', '2:00 PM', '6:00 PM', '10:00 PM'],
        ageRating: 'PG-13',
      ),
      Movie(
        id: '2',
        title: 'Black Panther: Wakanda Forever',
        description:
            'Queen Ramonda, Shuri, M\'Baku, Okoye and the Dora Milaje fight to protect their nation from intervening world powers in the wake of King T\'Challa\'s death.',
        imageUrl:
            'https://image.tmdb.org/t/p/w500/sv1xJUazXeYqALzczzi3W0M6xW9.jpg',
        genre: 'Action, Adventure',
        duration: '161 min',
        rating: 7.3,
        director: 'Ryan Coogler',
        cast: ['Letitia Wright', 'Angela Bassett', 'Lupita Nyong\'o'],
        releaseDate: '2022-11-11',
        price: 11.99,
        showTimes: ['11:00 AM', '3:00 PM', '7:00 PM', '11:00 PM'],
        ageRating: 'PG-13',
      ),
      Movie(
        id: '3',
        title: 'Top Gun: Maverick',
        description:
            'After thirty years, Maverick is still pushing the envelope as a top naval aviator, but must confront ghosts of his past when he leads TOP GUN\'s elite graduates on a mission that demands the ultimate sacrifice from those chosen to fly it.',
        imageUrl:
            'https://image.tmdb.org/t/p/w500/62HCnUTziyWcpDaBO2i1DX17ljH.jpg',
        genre: 'Action, Drama',
        duration: '131 min',
        rating: 8.3,
        director: 'Joseph Kosinski',
        cast: ['Tom Cruise', 'Miles Teller', 'Jennifer Connelly'],
        releaseDate: '2022-05-27',
        price: 13.99,
        showTimes: ['12:00 PM', '4:00 PM', '8:00 PM'],
        ageRating: 'PG-13',
      ),
      Movie(
        id: '4',
        title: 'Spider-Man: No Way Home',
        description:
            'Peter Parker\'s secret identity is revealed to the entire world. Desperate for help, Peter turns to Doctor Strange to make the world forget that he is Spider-Man.',
        imageUrl:
            'https://image.tmdb.org/t/p/w500/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg',
        genre: 'Action, Adventure',
        duration: '148 min',
        rating: 8.2,
        director: 'Jon Watts',
        cast: ['Tom Holland', 'Zendaya', 'Benedict Cumberbatch'],
        releaseDate: '2021-12-17',
        price: 10.99,
        showTimes: ['1:00 PM', '5:00 PM', '9:00 PM'],
        ageRating: 'PG-13',
      ),
      Movie(
        id: '5',
        title: 'The Batman',
        description:
            'When a sadistic serial killer begins murdering key political figures in Gotham, Batman is forced to investigate the city\'s hidden corruption and question his family\'s involvement.',
        imageUrl:
            'https://image.tmdb.org/t/p/w500/b0PlSFdDwbyK0cf5RxwDpaOJQvQ.jpg',
        genre: 'Action, Crime',
        duration: '176 min',
        rating: 7.8,
        director: 'Matt Reeves',
        cast: ['Robert Pattinson', 'Zoë Kravitz', 'Paul Dano'],
        releaseDate: '2022-03-04',
        price: 12.99,
        showTimes: ['2:00 PM', '6:00 PM', '10:00 PM'],
        ageRating: 'PG-13',
      ),
      Movie(
        id: '6',
        title: 'Dune',
        description:
            'Paul Atreides, a brilliant and gifted young man born into a great destiny beyond his understanding, must travel to the most dangerous planet in the universe to ensure the future of his family and his people.',
        imageUrl:
            'https://image.tmdb.org/t/p/w500/d5NXSklXo0qyIYkgV94XAgMIckC.jpg',
        genre: 'Sci-Fi, Adventure',
        duration: '155 min',
        rating: 8.0,
        director: 'Denis Villeneuve',
        cast: ['Timothée Chalamet', 'Rebecca Ferguson', 'Oscar Isaac'],
        releaseDate: '2021-10-22',
        price: 11.99,
        showTimes: ['3:00 PM', '7:00 PM', '11:00 PM'],
        ageRating: 'PG-13',
      ),
    ];
  }
}
