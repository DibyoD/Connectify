// ignore_for_file: use_build_context_synchronously

import 'package:chatapp/services/auth/auth_service.dart';
import "package:chatapp/components/my_button.dart";
import "package:chatapp/components/my_textfield.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

class LoginPage extends StatelessWidget {
  final void Function()? onTap;
  LoginPage({super.key, this.onTap});
  final authService = AuthService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwController = TextEditingController();

  void login(BuildContext context) async {
    try {
      await authService.signInWithEmailAndPassword(
          emailController.text.trim(), pwController.text.trim(), );
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
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
              "Welcome back, you've hi been missed!",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 25),

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
            const SizedBox(height: 25),

            //login button
            MyButton(
              text: "Login",
              onTap: () => login(context),
            ),
            const SizedBox(height: 25),

            //register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member?",
                  style: TextStyle(color: Colors.grey.shade700),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: const Text(
                    " Register Now!",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
