import 'package:flutter/material.dart';

import '../../../../../../core/domain/entities/alert.dart';
import '../../../../../../core/domain/entities/moment.dart';
import '../../../../../../core/utils/alert_type_util.dart';
import '../../../widgets/text.dart';

class AlertWidget extends StatelessWidget {
  final Alert alert;
  const AlertWidget({
    Key? key,
    required this.alert,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildMomentColum('Begins', alert.begins, theme),
          _buildMomentColum('Ends', alert.ends, theme)
        ],
      ),
      color: getColorFromAlert(alert.type),
    );
  }

  Column _buildMomentColum(String label, Moment moment, ThemeData theme) {
    return Column(
      children: [
        TextWidget(label),
        TextWidget(moment.toString()),
      ],
    );
  }
}
