import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(DaftarTugas1());
}

class DaftarTugas1 extends StatelessWidget {
  const DaftarTugas1({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DaftarTugas(),
    );
  }
}

class DaftarTugas extends StatefulWidget {
  const DaftarTugas({Key? key});

  @override
  State<DaftarTugas> createState() => _DaftarTugasState();
}

class _DaftarTugasState extends State<DaftarTugas> {
  void navigateToTugasMahasiswa() {
    // Navigasi ke halaman "TUGAS MAHASISWA" ketika teks diklik
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TugasMahasiswa()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: Text("Daftar Tugas"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 4, right: 4, top: 30),
        child: Column(
          children: [
            Center(
              child: Text(
                "TUGAS BARU",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: navigateToTugasMahasiswa, // Menggunakan InkWell untuk membuat teks dapat diklik
              child: Container(
                width: 350,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.assessment,
                        color: Colors.white,
                        size: 80,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            'TUGAS BARU: Pertemuan 1',
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Text(
                          'Tenggat: 10 Juli 2023',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TugasMahasiswa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tugas Mahasiswa'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text('Halaman Tugas Mahasiswa'),
      ),
    );
  }
}
