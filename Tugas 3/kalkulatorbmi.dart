import 'package:flutter/material.dart';

class BMIScreen extends StatefulWidget {
  const BMIScreen({super.key});

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  final _bbController = TextEditingController();
  final _tbController = TextEditingController();

  double? _hasilBMI;
  String? _keterangan;
  String _jenisKelamin = 'Laki-laki';

  void _hitungBMI() {
    final double bb = double.tryParse(_bbController.text) ?? 0;
    final double tbCm = double.tryParse(_tbController.text) ?? 0;

    setState(() {
      if (bb > 0 && tbCm > 0) {
        final double tbM = tbCm / 100;
        final double hasil = bb / (tbM * tbM);

        _hasilBMI = hasil;

        if (hasil < 18.5) {
          _keterangan = 'Berat Badan Kurang';
        } else if (hasil < 25) {
          _keterangan = 'Berat Badan Normal';
        } else if (hasil < 30) {
          _keterangan = 'Berat Badan Berlebih';
        } else {
          _keterangan = 'Obesitas';
        }
      } else {
        _hasilBMI = null;
        _keterangan = 'Data Tidak Valid!';
      }
    });
  }

  void _resetBMI() {
    setState(() {
      _bbController.clear();
      _tbController.clear();
      _hasilBMI = null;
      _keterangan = null;
      _jenisKelamin = 'Laki-laki';
    });
  }

  @override
  void dispose() {
    _bbController.dispose();
    _tbController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kalkulator BMI',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
        leading: const Icon(Icons.accessibility),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DropdownButtonFormField<String>(
                value: _jenisKelamin,
                decoration: const InputDecoration(
                  labelText: 'Jenis Kelamin',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'Laki-laki',
                    child: Text('Laki-laki'),
                  ),
                  DropdownMenuItem(
                    value: 'Perempuan',
                    child: Text('Perempuan'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _jenisKelamin = value!;
                    _hasilBMI = null;
                    _keterangan = null;
                  });
                },
              ),

              const SizedBox(height: 15),

              TextField(
                controller: _bbController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  icon: const Icon(Icons.monitor_weight, size: 30),
                  labelText: 'Berat Badan (kg)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: _tbController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  icon: const Icon(Icons.height, size: 30),
                  labelText: 'Tinggi Badan (cm)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              ElevatedButton(
                onPressed: _hitungBMI,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(20),
                ),
                child: const Text('Hitung BMI'),
              ),

              const SizedBox(height: 10),

              OutlinedButton(
                onPressed: _resetBMI,
                child: const Text('Reset'),
              ),

              const SizedBox(height: 15),

              const Text('Hasil:', textAlign: TextAlign.center),

              const SizedBox(height: 15),

              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Text(
                      _hasilBMI?.toStringAsFixed(1) ?? '--',
                      style: const TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      _keterangan ?? 'Masukkan Data Anda!',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    if (_hasilBMI != null)
                      Text(
                        'Jenis Kelamin: $_jenisKelamin',
                        style: const TextStyle(color: Colors.white70),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}