import 'package:flutter/material.dart';

class LightUnderlinedInputDecoration extends InputDecoration {
  const LightUnderlinedInputDecoration({
    String? labelText,
    String? hintText,
    String? helperText,
    Widget? prefixIcon,
    Widget? suffixIcon,
    bool filled = false,
    bool enabled = true,
    bool error = false,
  }) : super(
          labelText: labelText,
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          filled: filled,
          enabled: enabled,
          helperText: helperText,
          labelStyle: const TextStyle(
            color: Colors.white70,
            fontSize: 14,
          ),
          hintStyle: const TextStyle(
            color: Color(0xFFE6862E),
            fontSize: 14,
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white60,
              width: 1,
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 1,
            ),
          ),
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 1,
            ),
          ),
          focusedErrorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFE6862E),
              width: 1,
            ),
          ),
        );
}
