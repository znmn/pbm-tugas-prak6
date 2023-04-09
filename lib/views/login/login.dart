import 'package:flutter/material.dart';
import 'package:tugas_pbm/routes/routes.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() {
    return _LoginWidgetState();
  }
}

class _LoginWidgetState extends State<LoginWidget> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>?;
    final String username = args?['username'] ?? '';
    final String password = args?['password'] ?? '';

    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "LOGIN",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Form Tidak Boleh Kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Form Tidak Boleh Kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (_usernameController.text == username &&
                        _passwordController.text == password) {
                      Navigator.pushNamed(context, Routes.home,
                          arguments: _usernameController.text);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Username atau Password Salah"),
                        ),
                      );
                    }
                  }
                },
                child: const Text("Masuk"),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.register);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent[400],
                ),

                child: const Text("Daftar"),
                // give color
              ),
            ],
          ),
        ),
      ),
    );
  }
}
