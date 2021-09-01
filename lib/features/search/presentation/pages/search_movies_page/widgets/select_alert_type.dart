import 'package:flutter/material.dart';
import 'package:trypoapp/core/domain/enums/alert_type.dart';
import 'package:trypoapp/core/themes/font_theme.dart';
import 'package:trypoapp/features/search/presentation/widgets/text.dart';

class SelectAlertType extends StatefulWidget {
  const SelectAlertType(this.onChange, {Key? key}) : super(key: key);
  final ValueChanged<AlertType> onChange;

  @override
  _SelectAlertTypeState createState() => _SelectAlertTypeState();
}

class _SelectAlertTypeState extends State<SelectAlertType> {
  AlertType alertType = AlertType.low;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return DropdownButton<AlertType>(
      onChanged: (type) {
        setState(() {
          alertType = type ?? AlertType.low;
        });
        widget.onChange(type ?? AlertType.low);
      },
      style: FontTheme.font.copyWith(
        color: theme.accentColor,
      ),
      value: alertType,
      hint: TextWidget(
        'Alert Type',
        color: theme.accentColor,
      ),
      items: const <DropdownMenuItem<AlertType>>[
        DropdownMenuItem(
          value: AlertType.low,
          child: Text('Low'),
        ),
        DropdownMenuItem(
          value: AlertType.moderate,
          child: Text('Moderate'),
        ),
        DropdownMenuItem(
          value: AlertType.high,
          child: Text('High'),
        ),
      ],
    );
  }
}
