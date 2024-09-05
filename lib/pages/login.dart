import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:socialmedia_app/components/button.dart';
import 'package:socialmedia_app/components/textfield.dart';
import 'package:socialmedia_app/helper/helper_function.dart';

class LoginPage extends StatelessWidget {
  final void Function()? onTap;

  LoginPage({super.key, required this.onTap});

  // Text Editing Controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Login
  void login(BuildContext context) async {
    // Show loading circle
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    // Try to sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // Pop loading circle
      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // Pop loading circle
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      // ignore: use_build_context_synchronously
      displayMessageToUser(e.code, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo
                  Icon(
                    Icons.person,
                    size: 80,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),

                  const SizedBox(height: 25),

                  // App name
                  const Text(
                    "C H A T A P P",
                    style: TextStyle(fontSize: 20),
                  ),

                  const SizedBox(height: 50),

                  // Email textfield
                  MyTextField(
                    hintText: "Email",
                    obscureText: false,
                    controller: emailController,
                  ),

                  const SizedBox(height: 10),

                  // Password textfield
                  MyTextField(
                    hintText: "Password",
                    obscureText: true,
                    controller: passwordController,
                  ),

                  const SizedBox(height: 10),

                  // Forgot password
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forgot Password?",
                        style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  // Sign in button
                  MyButton(
                    text: "Login",
                    onTap: () => login(context), // Pass context here
                  ),

                  const SizedBox(height: 25),

                  // New to this App? Register Here
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "New to this App?",
                        style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
                      ),
                      GestureDetector(
                        onTap: onTap,
                        child: const Text(
                          " Register Here",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
