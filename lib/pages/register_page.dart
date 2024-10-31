import 'package:chat_app/constants.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  String? email;
  String? password;
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
            CustomTextField(
              icon: Icons.person,
              hintText: 'Enter your Full Name',
              label: 'Full Name',
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              onChange: (data) {
                email = data;
              },
              icon: Icons.email,
              hintText: 'Enter your Email',
              label: 'Email',
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              onChange: (data) {
                password = data;
              },
              icon: Icons.password,
              hintText: 'Enter your Password',
              label: 'Password',
            ),
            const SizedBox(
              height: 30,
            ),
            CustomButton(
              onTap: () async {
                try {
                  await registerUser();
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    showSnackBar(context, 'The password provided is too weak.',
                        Colors.red);
                  } else if (e.code == 'email-already-in-use') {
                    showSnackBar(
                        context,
                        'The account already exists for that email.',
                        Colors.red);
                  }
                }
                showSnackBar(
                    context, 'Email Scssfully Registered', Colors.green);
              },
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

  void showSnackBar(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        duration: const Duration(seconds: 4),
        behavior: SnackBarBehavior.floating,
        backgroundColor: color,
        content: Text(message),
      ),
    );
  }

  Future<void> registerUser() async {
    UserCredential user =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
