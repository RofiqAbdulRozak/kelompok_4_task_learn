import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../kelas/menu_daftar_kelas.dart';
import 'package:firebase_core/firebase_core.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Inisialisasi Firebase
  runApp(GabungKelas1());
}

class GabungKelas1 extends StatelessWidget {
  const GabungKelas1({Key? key}) : super(key: key);

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
  List<String> daftarKelas = [];
  String kodekelas = '';
  String idkelas = '';
  String iduser = '';

  @override
  void initState() {
    super.initState();
    fetchDaftarKelas();
  }

  String getIdKelasByKodeKelas(String kodeKelas) {
    return 'IDK001';
  }

  // String getIdUser() {
  //   return 'USER001';
  // }

  // Future<String?> getIdKelasByKodeKelas(String kodekelas) async {
  //   try {
  //     var querySnapshot = await FirebaseFirestore.instance
  //         .collection('kelas')
  //         .where('kodekelas', isEqualTo: kodekelas)
  //         .limit(1)
  //         .get();

  //     if (querySnapshot.docs.isNotEmpty) {
  //       // Jika ditemukan data yang sesuai dengan kodekelas
  //       var data = querySnapshot.docs.first.data();
  //       var idkelas = data['idkelas'] as String?;
  //       return idkelas;
  //     } else {
  //       // Jika tidak ditemukan data dengan kodekelas yang sesuai
  //       print('Data Kode Kelas Tidak Ditemukan: $kodekelas');
  //       return null;
  //     }
  //   } catch (e) {
  //     print('Error fetching data: $e');
  //     return null;
  //   }
  // }

  Future<String?> getIdUser() async {
    var user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return user.uid;
    } else {
      return null;
    }
  }

  void simpanDataJoinKelas(String idkelas, String iduser) {
    idkelas = idkelas.toLowerCase();
    iduser = iduser.toLowerCase();

    try {
      FirebaseFirestore.instance.collection('anggota').add({
        'idkelas': idkelas,
        'iduser': iduser,
      });
      print('Data Join Kelas Disimpan: idKelas=$idkelas, idUser=$iduser');
    } catch (e) {
      print('Error saving data: $e');
    }
  }

  void prosesGabungKelas() async {
    if (daftarKelas.contains(kodekelas)) {
      var idkelasResult = await getIdKelasByKodeKelas(kodekelas);
      var iduserResult = await getIdUser();

      if (idkelasResult != null && iduserResult != null) {
        idkelas = idkelasResult;
        iduser = iduserResult;

        simpanDataJoinKelas(idkelas, iduser);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => menu_daftar_kelas()),
        );
      } else {
        print('Gagal mendapatkan idkelas atau iduser.');
      }
    } else {
      print('Kode Kelas Tidak Valid: $kodekelas');
    }
  }

  void fetchDaftarKelas() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('kelas').get();
      List<String> kelasFromDatabase =
          querySnapshot.docs.map((doc) => doc['kodekelas'] as String).toList();

      setState(() {
        daftarKelas = kelasFromDatabase;
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            menu_daftar_kelas();
          },
        ),
        title: Text("GABUNG KELAS"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 4, right: 4, top: 20),
        child: Column(
          children: [
            Center(
              child: Text(
                "Masukan Kode Pemilik Kelas",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  kodekelas = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Kode Kelas',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.blue, width: 2.0, style: BorderStyle.solid),
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                //logika (kode)
                prosesGabungKelas();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
              child: Text("GABUNG KELAS"),
            )
          ],
        ),
      ),
    );
  }
}