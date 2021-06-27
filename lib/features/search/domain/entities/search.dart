import 'show.dart';

class Search extends Show {
  late String type;

  Search(int id, String name, String posterPath, String backdropPath)
      : super(id, name, posterPath, backdropPath) {
    this.type = type;
  }
}
