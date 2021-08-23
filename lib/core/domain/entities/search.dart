import 'show.dart';

class Search extends Show {
  final String type;

  const Search(
    int id,
    String name,
    String posterPath,
    String backdropPath,
    this.type,
  ) : super(
          id,
          name,
          posterPath,
          backdropPath,
        );
}
