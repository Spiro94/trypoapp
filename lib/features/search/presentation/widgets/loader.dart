import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(
          color: Colors.white,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Loading data ...',
          style: GoogleFonts.montserrat(
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
