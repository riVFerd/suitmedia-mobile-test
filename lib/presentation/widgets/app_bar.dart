import 'package:flutter/material.dart';
import 'package:flutter_suitmedia/presentation/theme/theme_constants.dart';

AppBar getStyledAppBar(BuildContext context, String title) {
  return AppBar(
    centerTitle: true,
    leading: IconButton(
      onPressed: () => Navigator.pop(context),
      icon: const Icon(
        Icons.arrow_back_ios_new,
        color: ThemeConstants.secondaryBlue,
      ),
    ),
    title: Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.bold),
    ),
  );
}
