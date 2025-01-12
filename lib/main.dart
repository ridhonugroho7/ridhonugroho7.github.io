import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Area Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KALKULATOR LUAS'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SquareAreaPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Text('HITUNG LUAS PERSEGI', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text('Pilih Untuk Mulai Menghitung Luas Persegi'),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CircleAreaPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Text('HITUNG LUAS LINGKARAN', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text('Pilih Untuk Mulai Menghitung Luas Lingkaran'),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DeveloperProfilePage()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Text('PROFILE DEVELOPER', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text('Pilih Untuk Melihat Developer'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SquareAreaPage extends StatefulWidget {
  @override
  _SquareAreaPageState createState() => _SquareAreaPageState();
}

class _SquareAreaPageState extends State<SquareAreaPage> {
  final TextEditingController lengthController = TextEditingController();
  final TextEditingController widthController = TextEditingController();
  double? area;

  void calculateArea() {
    final length = double.tryParse(lengthController.text);
    final width = double.tryParse(widthController.text);
    if (length != null && width != null) {
      setState(() {
        area = length * width;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hitung Luas Persegi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: lengthController,
              decoration: InputDecoration(labelText: 'Panjang'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: widthController,
              decoration: InputDecoration(labelText: 'Lebar'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateArea,
              child: Text('Hitung Luas'),
            ),
            SizedBox(height: 20),
            if (area != null)
              Text(
                'Luas: $area',
                style: TextStyle(fontSize: 18),
              ),
          ],
        ),
      ),
    );
  }
}

class CircleAreaPage extends StatefulWidget {
  @override
  _CircleAreaPageState createState() => _CircleAreaPageState();
}

class _CircleAreaPageState extends State<CircleAreaPage> {
  final TextEditingController radiusController = TextEditingController();
  double? area;

  void calculateArea() {
    final radius = double.tryParse(radiusController.text);
    if (radius != null) {
      setState(() {
        area = 3.14 * radius * radius;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hitung Luas Lingkaran'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: radiusController,
              decoration: InputDecoration(labelText: 'Jari-jari'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateArea,
              child: Text('Hitung Luas'),
            ),
            SizedBox(height: 20),
            if (area != null)
              Text(
                'Luas: $area',
                style: TextStyle(fontSize: 18),
              ),
          ],
        ),
      ),
    );
  }
}

class DeveloperProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Developer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nama: M. Ridho Nugroho', style: TextStyle(fontSize: 18)),
            Text('NPM: 2410020168', style: TextStyle(fontSize: 18)),
            Text('Kelas: SI-5A', style: TextStyle(fontSize: 18)),
            Text('Kontak: ridhonugroho7@gmail.com', style: TextStyle(fontSize: 18)),
            Text('Alamat: Desa Tungkaran Jalan Keramat Komplek Zahrah 1 Blok B No.13', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
