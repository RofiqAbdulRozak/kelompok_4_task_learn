import 'package:flutter/material.dart';

class buat_kelas extends StatefulWidget {
  const buat_kelas({Key? key}) : super(key: key);

  @override
  State<buat_kelas> createState() => _buat_kelasState();
}

class _buat_kelasState extends State<buat_kelas> {
  TextEditingController matakuliahController = TextEditingController();
  TextEditingController kelasController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: const Text('Buat Kelas'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            children: [
              Text(
                "Kelas Mengajar",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: matakuliahController,
                decoration: InputDecoration(
                  labelText: 'Mata Kuliah',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: kelasController,
                decoration: InputDecoration(
                  labelText: 'Kelas',
                  border: OutlineInputBorder(),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Buat Kelas"),
                    style: ElevatedButton.styleFrom(primary: Colors.orange),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
