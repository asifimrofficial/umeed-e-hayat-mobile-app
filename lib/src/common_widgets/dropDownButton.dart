import 'package:flutter/material.dart';

class MyCustomDropdown extends StatelessWidget {
  final String value; // Change to non-nullable String
  final List<String> items;
  final String hintText;
  final IconData leadingIcon;
  final Widget? suffixIcon;
  final void Function(String?) onChanged;

  MyCustomDropdown({
    required this.value, // Update to non-nullable String
    required this.items,
    required this.hintText,
    required this.leadingIcon,
    this.suffixIcon,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>( // Update type to String
      value: value,
      items: items
          .map(
            (item) => DropdownMenuItem<String>( // Update type to String
              value: item,
              child: Text(item),
            ),
          )
          .toList(),
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: Icon(
          leadingIcon,
          color: const Color(0xffFF2156),
        ),
        suffixIcon: suffixIcon,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: const Color.fromARGB(255, 0, 0, 0)), // Customize the focused border color
        ),
      ),
    );
  }
}
