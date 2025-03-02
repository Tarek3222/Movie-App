class MoviesGenre {
  final int id;
  final String name;
  final String image;

  const MoviesGenre(
      {required this.image, required this.id, required this.name});
}

List<MoviesGenre> moviesGenres = const [
  MoviesGenre(id: 28, name: "Action", image: "assets/images/action.jpg"),
  MoviesGenre(id: 12, name: "Adventure", image: "assets/images/Adventure.jpg"),
  MoviesGenre(id: 16, name: "Animation", image: "assets/images/Animation.jpg"),
  MoviesGenre(id: 35, name: "Comedy", image: "assets/images/Comedy.jpg"),
  MoviesGenre(id: 80, name: "Crime", image: "assets/images/Crime.jpg"),
  MoviesGenre(
      id: 99, name: "Documentary", image: "assets/images/Documentary.jpg"),
  MoviesGenre(id: 18, name: "Drama", image: "assets/images/Drama.jpg"),
  MoviesGenre(id: 10751, name: "Family", image: "assets/images/Family.jpg"),
  MoviesGenre(id: 14, name: "Fantasy", image: "assets/images/Fantasy.jpg"),
  MoviesGenre(id: 36, name: "History", image: "assets/images/History.jpg"),
  MoviesGenre(id: 27, name: "Horror", image: "assets/images/Horror.jpg"),
  MoviesGenre(id: 10402, name: "Music", image: "assets/images/Music.jpg"),
  MoviesGenre(id: 9648, name: "Mystery", image: "assets/images/Mystery.jpg"),
  MoviesGenre(id: 10749, name: "Romance", image: "assets/images/Romance.jpg"),
  MoviesGenre(
      id: 878,
      name: "Science Fiction",
      image: "assets/images/Science_Fiction.jpg"),
  MoviesGenre(id: 10770, name: "TV Movie", image: "assets/images/TV_Movie.jpg"),
  MoviesGenre(id: 53, name: "Thriller", image: "assets/images/Thriller.jpg"),
  MoviesGenre(id: 10752, name: "War", image: "assets/images/War.jpg"),
  MoviesGenre(id: 37, name: "Western", image: "assets/images/Western.jpg"),
];
