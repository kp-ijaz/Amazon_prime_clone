class Movie {
  final int? id;
  final String? movieName;
  final String? backdrop;
  final String? poster;
  final double? averageRating;
  final String? overview;

  Movie({
    this.id,
    this.movieName,
    this.backdrop,
    this.poster,
    this.averageRating,
    this.overview,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    String fname = json['name'] ?? json['title'];
    Movie movie = Movie(
        id: json['id'] as int,
        movieName: fname,
        backdrop: json['backdrop_path'],
        poster: json['poster_path'],
        averageRating: json['vote_average'] == null
            ? 0.toDouble()
            : json['vote_average'].toDouble(),
        overview: json['overview']);
    return movie;
  }
}
