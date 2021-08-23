import 'package:flutter/material.dart';
import 'package:trypoapp/core/domain/enums/alert_type.dart';

Color getColorFromAlert(AlertType alertType) {
  Color color = Colors.red;
  if (alertType == AlertType.low) {
    color = Colors.yellow;
  } else if (alertType == AlertType.moderate) {
    color = Colors.orange;
  }

  return color;
}
