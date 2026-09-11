import 'package:flutter/material.dart';

class DimiSearchBar extends StatelessWidget {
  final String hintText;
  final ValueChanged<String>? onChanged;

  const DimiSearchBar({
    super.key,
    this.hintText = 'Cari menu Dimi...',
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: const Icon(Icons.search),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
