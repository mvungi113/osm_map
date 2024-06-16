import 'package:flutter/material.dart';
import 'package:trafficopt/auth/auth_service.dart';
import 'package:trafficopt/components/my_button.dart';
import 'package:trafficopt/components/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key, required this.onTap});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final void Function()? onTap;
  void register(BuildContext context) {
    //register function
    final _auth = AuthService();
      try {
        _auth.signUpWithEmailPassword(
            _emailController.text, _passwordController.text);
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              e.toString(),
            ),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),


                const SizedBox(
                  height: 50,
                ),
                // welcome back message
                Text(
                  "Welcome back, you've been missed!",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),

               
                 MyTextField(
                  hintText: "Email",
                  obscureText: false,
                  controller: _emailController,
                ),

                const SizedBox(
                  height: 20,
                ),
                MyTextField(
                  hintText: "Password",
                  obscureText: true,
                  controller: _passwordController,
                ),
                const SizedBox(
                  height: 20,
                ),
               
                const SizedBox(
                  height: 20,
                ),
                MyButton(
                  text: "Register",
                  onTap: () => register(context),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Already a member  ",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    GestureDetector(
                      onTap: onTap,
                      child: Text(
                        'Login Now',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
