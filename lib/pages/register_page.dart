import 'package:chatapp/services/auth/auth_service.dart';
import 'package:chatapp/components/my_button.dart';
import 'package:chatapp/components/my_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final void Function()? onTap;
  RegisterPage({
    super.key,
    this.onTap,
  });

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwController = TextEditingController();
  final TextEditingController confirmPwController = TextEditingController();

  void register(BuildContext context) {
    final _auth = AuthService();
    if (pwController.text == confirmPwController.text) {
      try {
        _auth.signUpWithEmailAndPassword(
            emailController.text.trim(), pwController.text.trim(), nameController.text.trim());
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Passwords don't match!"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // final TextEditingController nameController = TextEditingController();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo
              Icon(
                CupertinoIcons.chat_bubble_text,
                size: 60,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 50),

              Text(
                "C O N N E C T I F Y",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 25),

              //welcome back
              Text(
                "Let's create an account for you",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 25),

              // name textfield
              MyTextField(
                labelText: "Name",
                hintText: "May I know your name",
                isShow: false,
                controller: nameController,
              ),
              const SizedBox(height: 15),

              //email textfield
              MyTextField(
                labelText: "Email",
                hintText: "example@mail.com",
                isShow: false,
                controller: emailController,
              ),
              const SizedBox(height: 15),

              //password textfield
              MyTextField(
                labelText: "Password",
                hintText: "Keep it secret",
                isShow: true,
                controller: pwController,
              ),
              const SizedBox(height: 15),

              //confirm password
              MyTextField(
                labelText: "Confirm Password",
                hintText: "Check again",
                isShow: true,
                controller: confirmPwController,
              ),
              const SizedBox(height: 25),

              //login button
              MyButton(
                text: "Register",
                onTap: () => register(context),
              ),
              const SizedBox(height: 25),

              //register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: const Text(
                      " Login now!",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
