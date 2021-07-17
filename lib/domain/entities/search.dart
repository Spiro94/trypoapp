import 'show.dart';

class Search extends Show {
  String type;

  Search(
    int id,
    String name,
    String posterPath,
    String backdropPath,
    String type,
  )   : this.type = type,
        super(id, name, posterPath, backdropPath);
}
