import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gaji Pegawai Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GajiPegawaiCalculator(),
    );
  }
}

class GajiPegawaiCalculator extends StatefulWidget {
  @override
  _GajiPegawaiCalculatorState createState() => _GajiPegawaiCalculatorState();
}

class _GajiPegawaiCalculatorState extends State<GajiPegawaiCalculator> {
  double _gajiPokok = 0.0;
  double _tunjangan = 0.0;
  double _gajiTotal = 0.0;

  void _hitungGajiTotal() {
    setState(() {
      _gajiTotal = _gajiPokok + _tunjangan;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gaji Pegawai Calculator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Masukkan Gaji Pokok dan Tunjangan Pegawai',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Gaji Pokok',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _gajiPokok = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Tunjangan',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _tunjangan = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _hitungGajiTotal();
              },
              child: Text('Hitung Gaji Total'),
            ),
            SizedBox(height: 20),
            Text(
              'Gaji Total: $_gajiTotal',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
