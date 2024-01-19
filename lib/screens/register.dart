import 'package:flutter/material.dart';
import 'package:foodapp/models/mybutton.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'images/logo.png',
              height: 150,
              width: 150,
            ),
            const SizedBox(height: 50),

            const Text(
              'Let\'s create an account',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 25),

            // Email TextField
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  hintText: 'Email',
                  hintStyle: TextStyle(color: Colors.grey[500]),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Password TextField
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.grey[500]),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Confirm Password TextField
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  hintText: 'Confirm Password',
                  hintStyle: TextStyle(color: Colors.grey[500]),
                ),
              ),
            ),

            const SizedBox(height: 25),

            // Sign-up Button
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: MyButton(
                text: "Sign up",
                onTap: () {
                  if (emailController.text.isEmpty ||
                      passwordController.text.isEmpty ||
                      confirmPasswordController.text.isEmpty) {
                    setState(() {
                      errorMessage = 'Please fill in all fields.';
                    });
                  } else if (passwordController.text !=
                      confirmPasswordController.text) {
                    setState(() {
                      errorMessage = 'Passwords do not match.';
                    });
                  } else {
                    // Handle sign-up logic here
                    // For example, you can call a function to register the user
                  }
                },
              ),
            ),

            // Error message if fields are empty or passwords don't match
            if (errorMessage.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  errorMessage,
                  style: const TextStyle(color: Colors.red),
                ),
              ),

            const SizedBox(height: 50),

            // Login link
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already Have An Account',
                  style: TextStyle(color: Colors.black),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const Text(
                    'Login now',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
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
