import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBar extends StatelessWidget {
  final double viewportHeight;
  final String hintText;

  const SearchBar({
    Key? key,
    required this.viewportHeight,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: viewportHeight * .1,
      child: Center(
        child: TextField(
          style: GoogleFonts.montserrat(
            color: Colors.white,
          ),
          cursorColor: Colors.white,
          textCapitalization: TextCapitalization.words,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: GoogleFonts.montserrat(
              color: Colors.grey[600],
            ),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            enabledBorder: getBorder(),
            focusedBorder: getBorder(),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder getBorder() {
    return OutlineInputBorder(
        borderSide: new BorderSide(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(30));
  }
}
