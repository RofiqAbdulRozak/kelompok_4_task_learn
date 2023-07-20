import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../profile/my_profile.dart';
import 'tampil_buat_kelas.dart';

class anggota_dosen extends StatefulWidget {
  const anggota_dosen({Key? key}) : super(key: key);

  @override
  _anggota_dosenState createState() => _anggota_dosenState();
}

class _anggota_dosenState extends State<anggota_dosen> {
  List<String> anggotaKelas = [];

  @override
  void initState() {
    super.initState();
    fetchAnggotaKelas();
  }

  void fetchAnggotaKelas() async {
    try {
      var querySnapshot =
          await FirebaseFirestore.instance.collection('users').get();

      List<String> anggotaWithNamaLengkap = [];

      for (var doc in querySnapshot.docs) {
        var namaLengkap = doc[
            'namalengkap']; // Ubah sesuai dengan field nama lengkap pada dokumen pengguna
        if (namaLengkap != null) {
          anggotaWithNamaLengkap.add(namaLengkap);
        }
      }

      setState(() {
        anggotaKelas = anggotaWithNamaLengkap;
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  Future<String?> getNamaLengkapByid(String id) async {
    try {
      // Query data berdasarkan id di tabel 'users'
      var querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('id', isEqualTo: id)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Ambil data username dari hasil query
        var data = querySnapshot.docs.first.data();
        return data?['username'] as String?;
      } else {
        print('Data User Tidak Ditemukan: $id');
        return null;
      }
    } catch (e) {
      print('Error fetching data: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Bahasa Inggris Lanjut"),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.amber[700],
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
                "Hai Rofiq",
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
                  color: Colors.amber[700],
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
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
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Bahasa Inggris Lanjut\nIF21A\nDini Riandini",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.amber[700],
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
                            color: Colors.amber[700],
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
                    onPressed: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 5),
                        Text(
                          "Tugas",
                          style: TextStyle(
                            color: Colors.amber[700],
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
                    color: Colors.amber[700],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 5),
                        Text(
                          "Teman Kelas",
                          style: TextStyle(
                            color: Colors.white,
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
              margin: EdgeInsets.only(top: 320, left: 30, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: screenWidth - 60,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Dosen Pengajar:",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Nama Dosen Pengajar",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  Container(
                    width: screenWidth - 60,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Teman Kelas:",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 8),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: anggotaKelas.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.symmetric(vertical: 4),
                              child: Text(
                                anggotaKelas[index],
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Divider(
                              color: Colors.grey,
                            );
                          },
                        ),
                      ],
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
