import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kelompok_4_task_learn/widget/lihat_tugas_mahasiswa.dart';
import 'tampil_buat_kelas.dart';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
//import 'buat_kelas.dart';


class DaftarTugas extends StatefulWidget {
  const DaftarTugas({Key? key});

  @override
  State<DaftarTugas> createState() => _DaftarTugasState();
}

class _DaftarTugasState extends State<DaftarTugas> {
  // void navigateToTampilNotes(String noteId) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => tampil_notes(noteId: noteId)),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text("DAFTAR TUGAS"),
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              top: 30,
              left: 30,
            ),
            child: Text(
              "Daftar Tugas",
              style: TextStyle(
                fontSize: 30,
                color: Colors.blue,
              ),
            ),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('informasikelas').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }

              final tugasDocs = snapshot.data!.docs;

              return ListView.builder(
                padding: EdgeInsets.only(
                  top: 120,
                  left: 30,
                  right: 30,
                ),
                itemCount: tugasDocs.length,
                itemBuilder: (context, index) {
                  final tugasData =
                      tugasDocs[index].data() as Map<String, dynamic>;
                  final judul = tugasData['judul'];
                  final deskripsi = tugasData['deskripsi'];

                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TugasMahasiswa(
                            namaKelas: judul, 
                            namaGuru: 'Nama Guru'),
                        )
                      );
                    },
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
                                  '$judul',
                                  style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Text(
                                '$deskripsi',
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
