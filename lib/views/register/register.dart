import 'package:flutter/material.dart';
import 'package:tugas_pbm/routes/routes.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({Key? key}) : super(key: key);

  @override
  State<RegisterWidget> createState() {
    return _RegisterWidgetState();
  }
}

class _RegisterWidgetState extends State<RegisterWidget> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "REGISTER",
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
                    Navigator.pushNamed(
                      context,
                      Routes.login,
                      arguments: {
                        'username': _usernameController.text,
                        'password': _passwordController.text,
                      },
                    );
                  }
                },
                child: const Text("Daftar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
