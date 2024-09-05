import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:socialmedia_app/components/button.dart';
import 'package:socialmedia_app/components/textfield.dart';
import 'package:socialmedia_app/helper/helper_function.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //Text Editing Controllers
  final TextEditingController usernameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmController = TextEditingController();

  //Register
  void registerUser() async {
    //show loading circle
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    //make sure passwords match
    if (passwordController.text != confirmController.text) {
      //pop loading circle
      Navigator.pop(context);

      //show error message to user
      displayMessageToUser("Passwords Dont Match!", context);
    } else {
      //creating user

      try {
        // create the user
        UserCredential? userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);

        //pop loading circle
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        //pop loading circle
        // ignore: use_build_context_synchronously
        Navigator.pop(context);

        //display erroMessage To User
        // ignore: use_build_context_synchronously
        displayMessageToUser(e.code, context);
      }
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
                  //logo
                  Icon(
                    Icons.person,
                    size: 80,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),

                  const SizedBox(height: 25),

                  //app name
                  const Text(
                    "C H A T A P P",
                    style: TextStyle(fontSize: 20),
                  ),

                  const SizedBox(height: 50),

                  //username textfield
                  MyTextField(
                    hintText: "Username",
                    obscureText: false,
                    controller: usernameController,
                  ),

                  const SizedBox(height: 10),

                  //email textfield
                  MyTextField(
                    hintText: "Email",
                    obscureText: false,
                    controller: emailController,
                  ),

                  const SizedBox(height: 10),

                  //password textfield
                  MyTextField(
                    hintText: "Password",
                    obscureText: true,
                    controller: passwordController,
                  ),

                  const SizedBox(height: 10),

                  //confirm password textfield
                  MyTextField(
                    hintText: "Confirm Password",
                    obscureText: false,
                    controller: confirmController,
                  ),

                  const SizedBox(height: 25),

                  //sign in button
                  MyButton(
                    text: "Register",
                    onTap: registerUser,
                  ),

                  const SizedBox(height: 25),

                  //New to this App? Register Here
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an Account?",
                        style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          " Login Here",
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
