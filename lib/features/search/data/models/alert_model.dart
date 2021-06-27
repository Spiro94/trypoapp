import '../../domain/entities/alert.dart';
import '../../domain/enums/alert_type.dart';

class AlertModel extends Alert {
  AlertModel(
    DateTime begins,
    DateTime ends,
    AlertType type,
  ) : super(
          begins,
          ends,
          type,
        );

  factory AlertModel.fromJson(Map<String, dynamic> json) {
    return AlertModel(
      json['begins'],
      json['ends'],
      json['type'],
    );
  }
}
