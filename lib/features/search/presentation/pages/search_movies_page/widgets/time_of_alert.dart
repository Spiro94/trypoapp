import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trypoapp/core/themes/font_theme.dart';
import 'package:trypoapp/features/search/presentation/widgets/text.dart';

class TimeOfAlert extends StatefulWidget {
  const TimeOfAlert({
    Key? key,
    this.controller,
  }) : super(key: key);

  final TextEditingController? controller;

  @override
  _TimeOfAlertState createState() => _TimeOfAlertState();
}

class _TimeOfAlertState extends State<TimeOfAlert> {
  final TextEditingController hourController = TextEditingController();

  final TextEditingController minuteController = TextEditingController();

  final TextEditingController secondController = TextEditingController();

  @override
  void initState() {
    widget.controller?.text = '00:00:00';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      children: [
        TextWidget(
          'Begining of the alert',
          color: theme.accentColor,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 70,
              child: Column(
                children: [
                  TextWidget(
                    'Hour',
                    color: theme.accentColor,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextField(
                    style: FontTheme.font.copyWith(
                      color: theme.accentColor,
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('\\d')),
                      LengthLimitingTextInputFormatter(2),
                    ],
                    onChanged: (String text) {
                      if (int.parse(text) > 10) {
                        hourController.text = '10';
                      }

                      widget.controller?.text = widget.controller?.text
                              .replaceRange(
                                  0, 2, hourController.text.padLeft(2, '0')) ??
                          '00';
                      hourController.selection = TextSelection.fromPosition(
                          TextPosition(offset: hourController.text.length));
                    },
                    keyboardType: TextInputType.phone,
                    controller: hourController,
                    textAlign: TextAlign.center,
                    cursorColor: theme.accentColor,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      hintText: '00',
                      hintStyle: FontTheme.font.copyWith(
                        color: theme.unselectedWidgetColor,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      enabledBorder: getBorder(theme),
                      focusedBorder: getBorder(theme),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 70,
              child: Column(
                children: [
                  TextWidget(
                    'Minutes',
                    color: theme.accentColor,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextField(
                    style: FontTheme.font.copyWith(
                      color: theme.accentColor,
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('\\d')),
                      LengthLimitingTextInputFormatter(2),
                    ],
                    onChanged: (String text) {
                      if (int.parse(text) > 59) {
                        minuteController.text = '59';
                      }
                      widget.controller
                          ?.text = widget.controller?.text.replaceRange(
                              3, 5, minuteController.text.padLeft(2, '0')) ??
                          '00';
                      minuteController.selection = TextSelection.fromPosition(
                          TextPosition(offset: minuteController.text.length));
                    },
                    keyboardType: TextInputType.phone,
                    controller: minuteController,
                    textAlign: TextAlign.center,
                    cursorColor: theme.accentColor,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      hintText: '00',
                      hintStyle: FontTheme.font.copyWith(
                        color: theme.unselectedWidgetColor,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      enabledBorder: getBorder(theme),
                      focusedBorder: getBorder(theme),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 70,
              child: Column(
                children: [
                  TextWidget(
                    'Seconds',
                    color: theme.accentColor,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextField(
                    style: FontTheme.font.copyWith(
                      color: theme.accentColor,
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('\\d')),
                      LengthLimitingTextInputFormatter(2),
                    ],
                    onChanged: (String text) {
                      if (int.parse(text) > 59) {
                        secondController.text = '59';
                      }
                      widget.controller
                          ?.text = widget.controller?.text.replaceRange(
                              6, 8, secondController.text.padLeft(2, '0')) ??
                          '00';
                      secondController.selection = TextSelection.fromPosition(
                          TextPosition(offset: secondController.text.length));
                    },
                    keyboardType: TextInputType.phone,
                    controller: secondController,
                    textAlign: TextAlign.center,
                    cursorColor: theme.accentColor,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      hintText: '00',
                      hintStyle: FontTheme.font.copyWith(
                        color: theme.unselectedWidgetColor,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      enabledBorder: getBorder(theme),
                      focusedBorder: getBorder(theme),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}

OutlineInputBorder getBorder(ThemeData theme) {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: theme.accentColor,
    ),
    // borderRadius: BorderRadius.circular(30),
  );
}
