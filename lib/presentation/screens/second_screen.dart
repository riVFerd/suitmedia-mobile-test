import 'package:flutter/material.dart';
import 'package:flutter_suitmedia/presentation/screens/third_screen.dart';
import 'package:flutter_suitmedia/presentation/theme/theme_constants.dart';
import 'package:flutter_suitmedia/presentation/widgets/cutom_elevated_button.dart';

class SecondScreen extends StatefulWidget {
  final String name;

  const SecondScreen({super.key, required this.name});

  static const routeName = '/second-screen';

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  void _chooseUser() {
    ScaffoldMessenger.of(context).clearSnackBars();
    Navigator.pushNamed(
      context,
      ThirdScreen.routeName,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: ThemeConstants.secondaryBlue,
          ),
        ),
        title: const Text(
          'Second Screen',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: ThemeConstants.screenPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    widget.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              'Selected User Name',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            CustomElevatedButton(
              text: 'Choose a User',
              onPressed: _chooseUser,
            ),
          ],
        ),
      ),
    );
  }
}
