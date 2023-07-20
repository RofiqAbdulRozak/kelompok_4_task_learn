import 'package:flutter/material.dart';
import '../profile/my_profile.dart';
import 'anggota_dosen.dart';
import 'lihat_tugas_dosen.dart';
import 'tambah_infomasi_dosen.dart';

class tampil_buat_kelas extends StatefulWidget {
  const tampil_buat_kelas({Key? key}) : super(key: key);

  @override
  _tampil_buat_kelasState createState() => _tampil_buat_kelasState();
}

class _tampil_buat_kelasState extends State<tampil_buat_kelas> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Bahasa Inggris Lanjut"),
        backgroundColor: Colors.amber[700],
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
                "Hai Dini",
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
                          "Informasi",
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
                            builder: (context) => lihat_tugas_dosen(
                                  namaGuru: '',
                                  namaKelas: '',
                                )),
                      );
                    },
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
                            color: Colors.amber[700],
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
                "Informasi",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.amber[700],
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
                color: Colors.amber[700],
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
