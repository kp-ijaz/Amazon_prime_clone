class Store {
  final int? id;
  final String? posterName;
  final String? backdrop;
  final String? poster;
  final double? averageRating;
  final String? overview;

  Store({
    this.id,
    this.posterName,
    this.backdrop,
    this.poster,
    this.averageRating,
    this.overview,
  });

  factory Store.fromJson(Map<String, dynamic> json) {
    String fname = json['name'] ?? json['title'];
    Store movie = Store(
        id: json['id'] as int,
        posterName: fname,
        backdrop: json['backdrop_path'],
        poster: json['poster_path'],
        averageRating: json['vote_average'] == null
            ? 0.toDouble()
            : json['vote_average'].toDouble(),
        overview: json['overview']);
    return movie;
  }
}
