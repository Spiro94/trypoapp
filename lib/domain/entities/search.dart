import 'show.dart';

class Search extends Show {
  final String type;

  Search(
    int id,
    String name,
    String posterPath,
    String backdropPath,
    String type,
  )   : this.type = type,
        super(
          id,
          name,
          posterPath,
          backdropPath,
        );
}
