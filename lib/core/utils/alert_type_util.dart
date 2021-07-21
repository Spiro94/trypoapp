import 'package:flutter/material.dart';
import 'package:trypoapp/core/domain/enums/alert_type.dart';

Color getColorFromAlert(AlertType alertType) {
  Color color = Colors.red;
  if (alertType == AlertType.Low) {
    color = Colors.yellow;
  } else if (alertType == AlertType.Moderate) {
    color = Colors.orange;
  }

  return color;
}
