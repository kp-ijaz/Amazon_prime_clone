class SearchResultData {
  String? backdropPath;

  int? id;

  String? originalTitle;

  String? posterPath;
  String? overview;

  SearchResultData(
      {this.backdropPath,
      this.id,
      this.originalTitle,
      this.posterPath,
      this.overview});

  factory SearchResultData.fromJson(Map<String, dynamic> json) {
    String fname = json['name'] ?? json['title'];
    return SearchResultData(
        backdropPath: json['backdrop_path'] != null
            ? 'https://image.tmdb.org/t/p/w500${json['backdrop_path']}'
            : '',
        id: json['id'] ?? 0,
        originalTitle: fname,
        posterPath: json['poster_path'] != null
            ? 'https://image.tmdb.org/t/p/w500${json['poster_path']}'
            : '',
        overview: json['overview']);
  }

  Map<String, dynamic> toJson() => {
        'backdrop_path': backdropPath,
        'id': id,
        'original_title': originalTitle,
        'poster_path': posterPath,
        'overview': overview,
      };
}
