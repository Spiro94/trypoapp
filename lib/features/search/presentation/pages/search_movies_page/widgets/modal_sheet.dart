import 'package:flutter/material.dart';
import 'package:trypoapp/core/domain/enums/alert_type.dart';
import 'package:trypoapp/features/search/presentation/pages/search_movies_page/widgets/select_alert_type.dart';
import 'package:trypoapp/features/search/presentation/pages/search_movies_page/widgets/time_of_alert.dart';
import 'package:trypoapp/features/search/presentation/widgets/text.dart';

Future<dynamic> buildModalSheet(
    BuildContext context, String name, ValueChanged<AlertType> onAlertChange) {
  ThemeData theme = Theme.of(context);
  TextEditingController beginingController = TextEditingController();
  TextEditingController endingController = TextEditingController();

  return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      builder: (context) {
        final MediaQueryData mediaQueryData = MediaQuery.of(context);
        return Padding(
          padding: mediaQueryData.viewInsets,
          child: SingleChildScrollView(
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    width: 50,
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    child: const Divider(
                      thickness: 3,
                    ),
                  ),
                  TextWidget(
                    name,
                    fontSize: 20,
                    color: theme.accentColor,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TimeOfAlert(
                    controller: beginingController,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TimeOfAlert(
                    controller: endingController,
                  ),
                  SelectAlertType(
                    onAlertChange,
                  ),
                  OutlinedButton(
                      onPressed: () {},
                      child: TextWidget(
                        'Submit',
                        color: theme.accentColor,
                      )),
                  ListTile(
                    leading: const Icon(Icons.photo),
                    title: const Text('Photo'),
                    onTap: () {
                      print(beginingController.text);
                      print(endingController.text);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
