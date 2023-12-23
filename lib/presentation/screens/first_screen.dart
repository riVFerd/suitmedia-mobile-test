import 'package:flutter/material.dart';
import 'package:flutter_suitmedia/presentation/screens/second_screen.dart';
import 'package:flutter_suitmedia/presentation/theme/theme_constants.dart';
import 'package:flutter_suitmedia/presentation/widgets/cutom_elevated_button.dart';
import 'package:flutter_suitmedia/presentation/widgets/cutom_text_field.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  static const routeName = '/first-screen';

  void _checkPalindrome(BuildContext context, String text) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final originalText = text.replaceAll(' ', '').toLowerCase();
    final reversedText = text.split('').reversed.join().replaceAll(' ', '').toLowerCase();

    if (reversedText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Palindrome cannot be empty'),
        ),
      );
      return;
    }
    if (originalText == reversedText) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Palindrome'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Not Palindrome'),
        ),
      );
    }
  }

  void _handleNextButton(String name, BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Name cannot be empty'),
        ),
      );
      return;
    }
    Navigator.pushNamed(
      context,
      SecondScreen.routeName,
      arguments: name,
    );
  }

  @override
  Widget build(BuildContext context) {
    String name = '';
    String palindrome = '';

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        constraints: const BoxConstraints.expand(),
        padding: ThemeConstants.screenPadding,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/ic_photo.png'),
              const SizedBox(height: 48),
              CustomTextField(
                hintText: 'Name',
                initialValue: name,
                onChanged: (value) => name = value,
              ),
              CustomTextField(
                hintText: 'Palindrome',
                initialValue: palindrome,
                onChanged: (value) => palindrome = value,
              ),
              const SizedBox(height: 24),
              CustomElevatedButton(
                text: 'CHECK',
                onPressed: () {
                  _checkPalindrome(context, palindrome);
                },
              ),
              CustomElevatedButton(
                text: 'NEXT',
                onPressed: () {
                  _handleNextButton(name, context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
