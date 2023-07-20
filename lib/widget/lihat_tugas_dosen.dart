import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../profile/my_profile.dart';
import 'anggota_dosen.dart';
import 'tambah_infomasi_dosen.dart';
import 'tampil_buat_kelas.dart';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';

class lihat_tugas_dosen extends StatefulWidget {
  final String namaKelas;
  final String namaGuru;

  const lihat_tugas_dosen(
      {Key? key, required this.namaKelas, required this.namaGuru})
      : super(key: key);

  @override
  _lihat_tugas_dosenState createState() => _lihat_tugas_dosenState();
}

class _lihat_tugas_dosenState extends State<lihat_tugas_dosen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<Kelas> daftarKelas = [];

  void navigateToLihatTugasDosen(String kelas, String namaGuru) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => lihat_tugas_dosen(
          namaKelas: kelas,
          namaGuru: namaGuru,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    User? user = auth.currentUser;
    String? email = user?.email;
    final screenWidth = MediaQuery.of(context).size.width;
    final String namaKelas = widget.namaKelas;
    final String namaGuru = widget.namaGuru;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: Text(namaKelas),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
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
              width: screenWidth,
              margin: EdgeInsets.only(
                top: 50,
                left: 30,
              ),
              child: Text(
                "Hai, $email",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              height: 50,
              width: 50,
              margin: EdgeInsets.only(
                top: 30,
                left: screenWidth - 80,
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyProfilePage()),
                  );
                },
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            Stack(
              children: [
                Container(
                  height: 150,
                  width: screenWidth - 60,
                  margin: EdgeInsets.only(
                    top: 100,
                    left: 30,
                    right: 30,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        namaKelas,
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.blue,
                        ),
                      ),
                      Image.asset(
                        'assets/logo2.png',
                        height: 80,
                        width: 80,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 30,
                  width: screenWidth / 3 - 30,
                  margin: EdgeInsets.only(
                    top: 270,
                    right: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tampil_buat_kelas()),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 5),
                        Text(
                          "Informasi",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 30,
                  width: screenWidth / 3 - 30,
                  margin: EdgeInsets.only(
                    top: 270,
                    right: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 5),
                        Text(
                          "Tugas",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 30,
                  width: screenWidth / 3 - 30,
                  margin: EdgeInsets.only(
                    top: 270,
                    right: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => anggota_dosen()),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 5),
                        Text(
                          "Anggota",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 50,
              width: screenWidth,
              margin: EdgeInsets.only(
                top: 330,
                left: 30,
              ),
              child: Text(
                "Tugas",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                ),
              ),
            ),
            Container(
              height: 50,
              width: 50,
              margin: EdgeInsets.only(
                top: 320,
                left: screenWidth - 100,
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TambahInformasi()),
                  );
                },
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> fetchDataKelas() async {
  try {
    final QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('kelas').get();
    daftarKelas = querySnapshot.docs
        .map((doc) => Kelas.fromFirestore(doc.data() as Map<String, dynamic>))
        .toList();
  } catch (e) {
    print('Error fetching data: $e');
  }
}

List<Kelas> daftarKelas = [];

class Kelas {
  final String namaKelas;
  final String namaGuru;

  Kelas({required this.namaKelas, required this.namaGuru});

  factory Kelas.fromFirestore(Map<String, dynamic> data) {
    return Kelas(
      namaKelas: data['namaKelas'],
      namaGuru: data['namaGuru'],
    );
  }
}
