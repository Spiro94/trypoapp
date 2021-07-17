import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorWidget extends StatelessWidget {
  final String message;
  const ErrorWidget({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error,
            color: Colors.white,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            message,
            style: GoogleFonts.montserrat(
              color: Colors.white,
            ),
          )
        ],
      ),
    ));
  }
}
