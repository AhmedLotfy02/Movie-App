class Movie {
  late  num  id;
  late String title;
  late num  voteAverage;
  late  String releaseDate;
  late String overview;
  late String posterPath;
  Movie(this.id, this.title, this.voteAverage, this.releaseDate, this.overview,
      this.posterPath);
  Movie.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.title = json['title'];
    this.voteAverage = json['vote_average'];
    this.releaseDate = json['release_date'];
    this.overview = json['overview'];
    this.posterPath = json['poster_path'];
  }
}
