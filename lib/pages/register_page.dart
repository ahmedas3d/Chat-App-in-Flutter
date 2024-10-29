import 'package:chat_app/constants.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            const Spacer(
              flex: 2,
            ),
            Image.asset('assets/images/scholar.png'),
            const Text(
              'Scholar Chat',
              style: TextStyle(
                fontSize: 35,
                color: Colors.white,
                fontFamily: 'Pacifico',
              ),
            ),
            const Spacer(
              flex: 2,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'REGISTER',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const CustomTextField(
              icon: Icons.person,
              hintText: 'Enter your Full Name',
              label: 'Full Name',
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomTextField(
              icon: Icons.email,
              hintText: 'Enter your Email',
              label: 'Email',
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomTextField(
              icon: Icons.password,
              hintText: 'Enter your Password',
              label: 'Password',
            ),
            const SizedBox(
              height: 30,
            ),
            const CustomButton(
              buttonText: 'Get Started',
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account?',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    ' Login',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.cyanAccent,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(
              flex: 4,
            )
          ],
        ),
      ),
    );
  }
}
