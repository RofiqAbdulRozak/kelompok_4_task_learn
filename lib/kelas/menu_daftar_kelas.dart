import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'buat_kelas.dart';
import '/widget/lihat_tugas_dosen.dart';
// import 'tampil_notes.dart';

class menu_daftar_kelas extends StatefulWidget {
  const menu_daftar_kelas({Key? key});

  @override
  State<menu_daftar_kelas> createState() => _menu_daftar_kelasState();
}

class _menu_daftar_kelasState extends State<menu_daftar_kelas> {
  void navigateTolihat_tugas_dosen(String idkelas, String matakuliah) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => lihat_tugas_dosen(
          namaKelas: idkelas,
          namaGuru: '',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar kelas"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => buat_kelas()),
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              top: 30,
              left: 30,
            ),
            child: Text(
              "Daftar kelas",
              style: TextStyle(
                fontSize: 30,
                color: Colors.blue,
              ),
            ),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('kelas').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }

              final kelasDocs = snapshot.data!.docs;

              return ListView.builder(
                padding: EdgeInsets.only(
                  top: 120,
                  left: 30,
                  right: 30,
                ),
                itemCount: kelasDocs.length,
                itemBuilder: (context, index) {
                  final kelasData =
                      kelasDocs[index].data() as Map<String, dynamic>;
                  final kelas = kelasData['kelas'];
                  final matakuliah = kelasData['matakuliah'];

                  return InkWell(
                    onTap: () => navigateTolihat_tugas_dosen(kelas, matakuliah),
                    child: Container(
                      height: 100,
                      margin: EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.class_,
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
                                  '$kelas',
                                  style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Text(
                                '$matakuliah',
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
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
