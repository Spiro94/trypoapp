import '../enums/alert_type.dart';
import 'moment.dart';

class Alert {
  Moment begins;
  Moment ends;
  AlertType type;

  Alert(
    this.begins,
    this.ends,
    this.type,
  );
}
