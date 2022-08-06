import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          // color: Colors.black,
          margin: const EdgeInsets.all(10),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const Text(
                  "Login Screen",
                  style: TextStyle(
                    fontSize: 33,
                  ),
                ),
                const SizedBox(height: 50),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Email required";
                    }
                    if (!value.contains("@") || !value.contains(".")) {
                      return "Email not valid";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password required";
                    }
                    return null;
                  },
                  obscureText: obscureText,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                        onPressed: () {
                          obscureText = !obscureText;
                          setState(() {});
                        },
                        icon: Icon(obscureText
                            ? Icons.visibility_off
                            : Icons.visibility)),
                    border: const OutlineInputBorder(),
                  ),
                ),
                Container(
                  alignment: AlignmentDirectional.centerEnd,
                  child: TextButton(
                    onPressed: () {
                      // Respond to button press
                    },
                    child: const Text("Forget password?"),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Respond to button press
                          if (formKey.currentState!.validate()) {
                            print('Validate');
                          } else {
                            print('Not valid');
                          }
                        },
                        child: const Text('Login'),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          // Respond to button press
                        },
                        child: const Text("Register"),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
