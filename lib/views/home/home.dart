import 'package:flutter/material.dart';

class Functions {
  static List<String> hitungBMI(
    double weight,
    double height,
  ) {
    // Ubah Cm ke M
    height = height / 100;
    // Hitung BMI dengan rumus: weight / (height * height)
    double bmi = weight / (height * height);
    // Bulatkan BMI ke 2 angka dibelakang koma
    bmi = double.parse(bmi.toStringAsFixed(2));
    // Cek status BMI
    String status = '';
    if (bmi < 18.5) {
      status = 'Kurus';
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      status = 'Normal';
    } else if (bmi >= 25 && bmi <= 29.9) {
      status = 'Gemuk';
    } else if (bmi >= 30) {
      status = 'Obesitas';
    }
    return [bmi.toString(), status];
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() {
    return _HomeWidgetState();
  }
}

class _HomeWidgetState extends State<HomeWidget> {
  final _formKey = GlobalKey<FormState>();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  final _bmiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String?;
    final String username = args ?? 'Zainul Muhaimin';

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'BMI Calculator',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "HITUNG BMI",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Halo $username",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: _heightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    labelText: 'Tinggi Badan',
                    hintText: 'in cm',
                    labelStyle: TextStyle(
                      color: Colors.blueGrey[700],
                      fontWeight: FontWeight.bold,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.blueGrey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    errorStyle: const TextStyle(color: Colors.red),
                    errorMaxLines: 2,
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
                  controller: _weightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    labelText: 'Berat Badan',
                    hintText: 'in kg',
                    labelStyle: TextStyle(
                      color: Colors.blueGrey[700],
                      fontWeight: FontWeight.bold,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.blueGrey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    errorStyle: const TextStyle(color: Colors.red),
                    errorMaxLines: 2,
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
                  controller: _bmiController,
                  enabled: false,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[600],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    labelText: 'BMI',
                    labelStyle: TextStyle(
                      color: Colors.cyan[400],
                      fontWeight: FontWeight.bold,
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    errorStyle: const TextStyle(color: Colors.red),
                    errorMaxLines: 2,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      try {
                        final double height =
                            double.parse(_heightController.text);
                        final double weight =
                            double.parse(_weightController.text);
                        final List bmis = Functions.hitungBMI(weight, height);

                        final String bmi = bmis[0];
                        final String status = bmis[1];

                        _bmiController.text = '$bmi ($status)';
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('BMI anda adalah $bmi ($status)'),
                          ),
                        );
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                                Text('Tinggi atau Berat Badan tidak valid'),
                          ),
                        );
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey[900],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 10,
                    ),
                  ),
                  child: const Text('Hitung BMI'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
