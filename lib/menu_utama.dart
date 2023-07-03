import 'package:flutter/material.dart';
// import 'menu_daftar_notes.dart';

class menu_utama extends StatefulWidget {
  const menu_utama({super.key});

  @override
  State<menu_utama> createState() => _menu_utamaState();
}

class _menu_utamaState extends State<menu_utama> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
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
              width: 400,
              margin: EdgeInsets.only(
                top: 50,
                left: 30,
              ),
              child: Text(
                "Hai ROFIQ",
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
                left: 420,
              ),
              child: IconButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => my_profil()),
                  // );
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
                  width: 440,
                  margin: EdgeInsets.only(
                    top: 100,
                    left: 30,
                    right: 30,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
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
                    "Selamat Datang Di Task Learn.\nSelamat Belajar Dengan\nMenyenangkan :)",
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  width: 100,
                  margin: EdgeInsets.only(
                    top: 130,
                    left: 350,
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/.png"),
                    ),
                  ),
                )
              ],
            ),

            //MENU
            Container(
              height: 100,
              width: 205,
              margin: EdgeInsets.only(
                top: 280,
                left: 30,
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(25),
              ),
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => menu_daftar_kelas()),
                  // );
                },
                child: Text("Daftar Kelas"),
              ),
            ),
            Container(
              height: 100,
              width: 205,
              margin: EdgeInsets.only(
                top: 280,
                left: 265,
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(25),
              ),
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => menu_daftar_notes()),
                  // );
                },
                child: Text("Notes"),
              ),
            ),
            Container(
              height: 100,
              width: 205,
              margin: EdgeInsets.only(
                top: 410,
                left: 30,
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(25),
              ),
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => menu_daftar_tugas()),
                  // );
                },
                child: Text("Daftar Tugas"),
              ),
            ),
            Container(
              height: 100,
              width: 205,
              margin: EdgeInsets.only(
                top: 410,
                left: 265,
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(25),
              ),
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => menu_tanggal()),
                  // );
                },
                child: Text("Tanggal"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
