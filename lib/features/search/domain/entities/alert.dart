import '../enums/alert_type.dart';

class Alert {
  DateTime begins;
  DateTime ends;
  AlertType type;

  Alert(this.begins, this.ends, this.type);
}
