import 'package:flutter/material.dart';
import '../../../widgets/text.dart';

import '../../../../../../core/utils/alert_type_util.dart';
import '../../../../data/models/alert_model.dart';
import '../../../../data/models/moment_model.dart';

class AlertWidget extends StatelessWidget {
  final AlertModel alert;
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
          _buildMomentColum('Begins', alert.begins as MomentModel, theme),
          _buildMomentColum('Ends', alert.ends as MomentModel, theme)
        ],
      ),
      color: getColorFromAlert(alert.type),
    );
  }

  Column _buildMomentColum(String label, MomentModel moment, ThemeData theme) {
    return Column(
      children: [
        TextWidget(label),
        TextWidget(moment.toString()),
      ],
    );
  }
}
