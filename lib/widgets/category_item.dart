import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String name;
  final VoidCallback? onTap;

  const CategoryItem({super.key, required this.name, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Text(name),
      ),
    );
  }
}
