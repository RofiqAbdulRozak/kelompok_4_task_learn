import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(GabungKelas1());
}

class GabungKelas1 extends StatelessWidget {
  const GabungKelas1({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GabungKelas(),
    );
  }
}
 
class GabungKelas extends StatefulWidget {
  const GabungKelas({super.key});

  @override
  State<GabungKelas> createState() => _GabungKelasState();
}

class _GabungKelasState extends State<GabungKelas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){

          },
        ),
        title: Text("GABUNG KELAS"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 4, right: 4, top: 20),
        child: Column(
          children: [
            Center(
              child: Text("Masukan Kode Pemilik Kelas",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
              ),
            ),
            SizedBox( height:50,),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Kode Kelas',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.teal,
                    width: 2.0,
                    style: BorderStyle.solid
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: (){
                //logika (kode)
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.teal,
              ),
              child: Text("GABUNG KELAS"),)
          ],
        ),
      ),
    );
  }
}