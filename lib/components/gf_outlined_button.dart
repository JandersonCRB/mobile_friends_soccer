import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GFOutlinedButton extends StatelessWidget {
  final String text;
  final bool filled;
  final VoidCallback onPressed;

  const GFOutlinedButton({
    Key? key,
    required this.text,
    this.filled = false,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textColor =
        filled ? const Color(0xFF21222B) : const Color(0xFFE6862E);
    final backgroundColor =
        filled ? const Color(0xFFE6862E) : Colors.transparent;
    return SizedBox(
      width: double.infinity,
      height: 46,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor,
          side: const BorderSide(
            color: Color(0xFFE6862E),
            width: 1,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(40),
            ),
          ),
        ),
        child: Text(
          text,
          style: GoogleFonts.inter(
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
