import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(TugasDosen1());
}

class TugasDosen1 extends StatelessWidget {
  const TugasDosen1({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TugasDosen(),
    );
  }
}

class TugasDosen extends StatefulWidget {
  const TugasDosen({Key? key});

  @override
  State<TugasDosen> createState() => _TugasDosenState();
}

class _TugasDosenState extends State<TugasDosen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {},
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Bahasa Inggris Lanjut",
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
          backgroundColor: Colors.blue,
        ),
      
      body:  SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
            ),
            Container(
              height: 100,
              width: 400,
              margin: EdgeInsets.only(
                top: 50,
                left: 30,
              ),
            ),
            Container(
              height: 50,
              width: 50,
              margin: EdgeInsets.only(
                top: 30,
                left: 420,
              ),
            ),
            Stack(
              children: [
                Container(
                  height: 200,
                  width: 500,
                  margin: EdgeInsets.only(
                    top: 100,
                    left: 30,
                    right: 30,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                Container(
                  height: 100,
                  margin: EdgeInsets.only(
                    top: 130,
                    left: 50,
                  ),
                  child: Text(
                    "BAHASA INGGRIS",
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 210,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: FractionallySizedBox(
                      widthFactor: 0.8,
                      child: ElevatedButton(
                        onPressed: () {
                          // Logika untuk tombol Informasi Kelas
                          print('Tombol Informasi Kelas Ditekan');
                        },
                        child: Text('Informasi Kelas'),
                      ),
                    ),
                  ),
                  Flexible(
                    child: FractionallySizedBox(
                      widthFactor: 0.8,
                      child: ElevatedButton(
                        onPressed: () {
                          // Logika untuk tombol Tugas
                          print('Tugas');
                        },
                        child: Text('Tugas'),
                      ),
                    ),
                  ),
                  Flexible(
                    child: FractionallySizedBox(
                      widthFactor: 0.8,
                      child: ElevatedButton(
                        onPressed: () {
                          // Logika untuk tombol Anggota Kelas
                          print('Tombol Anggota Kelas Ditekan');
                        },
                        child: Text('Anggota Kelas'),
                      ),
                    ),
                  ),
                ],
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}
    
