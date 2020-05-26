class Movie {
  static List<Movie> getMovies() => [
        Movie(
            'Avatar',
            '2009',
            'PG-13',
            '18 Dec 2009',
            '162 min',
            'Action, Adventure, Fantasy',
            'James Cameron',
            'James Cameron',
            'Sam Worthington, Zoe Saldana, Sigourney Weaver',
            'A paraplegic marine dispatched to the moon Pandora on a unique mission becomes torn',
            'English, Spanish',
            'USA, UK',
            'Won 3 Oscars',
            'https://xdesktopwallpapers.com/wp-content/uploads/2011/04/Avatar-Movie-Poster.jpg',
            '83',
            '7.9',
            '890,617',
            'tt0499549',
            'movie',
            'True', [
          'https://images-na.ssl-images-amazon.com/images/S/sgp-catalog-images/region_US/20th_century_fox-030776-Full-Image_GalleryBackground-en-US-1484000109520._SX1080_.jpg',
          'https://cdn.onebauer.media/one/empire-tmdb/films/19995/images/5XPPB44RQGfkBrbJxmtdndKz05n.jpg?quality=50&width=1800&ratio=16-9&resizeStyle=aspectfill&format=jpg'
        ]),
        Movie(
            'Avatar 2',
            '2009',
            'PG-13',
            '18 Dec 2009',
            '162 min',
            'Action, Adventure, Fantasy',
            'James Cameron',
            'James Cameron',
            'Sam Worthington, Zoe Saldana, Sigourney Weaver',
            'A paraplegic marine dispatched to the moon Pandora on a unique mission becomes torn',
            'English, Spanish',
            'USA, UK',
            'Won 3 Oscars',
            'https://xdesktopwallpapers.com/wp-content/uploads/2011/04/Avatar-Movie-Poster.jpg',
            '83',
            '7.9',
            '890,617',
            'tt0499549',
            'movie',
            'True', [
          'https://images-na.ssl-images-amazon.com/images/S/sgp-catalog-images/region_US/20th_century_fox-030776-Full-Image_GalleryBackground-en-US-1484000109520._SX1080_.jpg',
          'https://cdn.onebauer.media/one/empire-tmdb/films/19995/images/5XPPB44RQGfkBrbJxmtdndKz05n.jpg?quality=50&width=1800&ratio=16-9&resizeStyle=aspectfill&format=jpg'
        ])
      ];

  String title;
  String year;
  String rated;
  String released;
  String runtime;
  String genre;
  String director;
  String writer;
  String actors;
  String plot;
  String language;
  String country;
  String awards;
  String poster;
  String metascore;
  String imdbRating;
  String imdbVotes;
  String imdbID;
  String type;
  String response;
  List<String> images;

  Movie(
      this.title,
      this.year,
      this.rated,
      this.released,
      this.runtime,
      this.genre,
      this.director,
      this.writer,
      this.actors,
      this.plot,
      this.language,
      this.country,
      this.awards,
      this.poster,
      this.metascore,
      this.imdbRating,
      this.imdbVotes,
      this.imdbID,
      this.type,
      this.response,
      this.images);
}
