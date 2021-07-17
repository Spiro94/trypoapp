import '../../domain/entities/alert.dart';
import '../../domain/enums/alert_type.dart';
import 'moment_model.dart';

class AlertModel extends Alert {
  AlertModel(
    MomentModel begins,
    MomentModel ends,
    AlertType type,
  ) : super(
          begins,
          ends,
          type,
        );

  factory AlertModel.fromJson(Map<String, dynamic> json) {
    return AlertModel(
      MomentModel.fromJson(json['begins']),
      MomentModel.fromJson(json['ends']),
      AlertType.values
          .firstWhere((e) => e.toString() == 'AlertType.' + json['type']),
    );
  }
}
