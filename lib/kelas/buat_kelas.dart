import 'package:flutter/material.dart';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:random_string/random_string.dart';
import 'menu_daftar_kelas.dart';

class buat_kelas extends StatefulWidget {
  const buat_kelas({Key? key}) : super(key: key);

  @override
  State<buat_kelas> createState() => _buat_kelasState();
}

class _buat_kelasState extends State<buat_kelas> {
  TextEditingController matakuliahController = TextEditingController();
  TextEditingController kelasController = TextEditingController();
  TextEditingController kodeKelasController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String message = '';

  @override
  void initState() {
    super.initState();
    generateAndSetRandomString();
  }

  void generateAndSetRandomString() {
    final String randomString = generateRandomString();
    kodeKelasController.text = randomString;
  }

  Future<String?> getCurrentUserID() async {
    User? user = auth.currentUser;
    return user?.uid;
  }

  void generateAndSetKodeKelas() async {
    String? userID = await getCurrentUserID();
    if (userID != null) {
      String? username = await getUsername(userID);
      if (username != null) {
        setState(() {
          kodeKelasController.text = username;
        });
      }
    }
  }

  String generateRandomString() {
    final random = Random();
    final letters = 'abcdefghijklmnopqrstuvwxyz123456789';
    final String randomString = String.fromCharCodes(
      List.generate(
          6, (index) => letters.codeUnitAt(random.nextInt(letters.length))),
    );
    return randomString;
  }

  void saveToFirebase() async {
    final String matakuliah = matakuliahController.text;
    final String kelas = kelasController.text;
    final String kodeKelas = kodeKelasController.text;

    String? userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID != null) {
      try {
        await firestore.collection('kelas').add({
          'matakuliah': matakuliah,
          'kelas': kelas,
          'kodekelas': kodeKelas,
          'id': userID,
        });

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Sukses'),
              content: const Text('Kelas berhasil disimpan.'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, '/menu_daftar_kelas');
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      } catch (error) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Gagal'),
                content:
                    const Text('Gagal menyimpan kelas. Silakan coba lagi.'),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            });
      }
    }
  }

  Future<void> logout() async {
    await auth.signOut();
    Navigator.pushReplacementNamed(context, '/login');
  }

  Future<String?> getUsername(String userID) async {
    DocumentSnapshot userSnapshot =
        await firestore.collection('users').doc(userID).get();
    return userSnapshot['username'];
  }

  @override
  Widget build(BuildContext context) {
    User? user = auth.currentUser;
    String? email = user?.email;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            menu_daftar_kelas();
          },
        ),
        title: const Text('Buat Kelas'),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Pilihan'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (email != null) Text('Email: $email'),
                        ListTile(
                          leading: Icon(Icons.logout),
                          title: const Text('Logout'),
                          onTap: () {
                            Navigator.pop(context);
                            logout();
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.edit),
                          title: const Text('Ubah Profil'),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
          if (email != null) Text('$email'),
        ],
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
              SizedBox(height: 20),
              TextField(
                controller: kodeKelasController,
                enabled: false,
                decoration: InputDecoration(
                  labelText: 'Kode Kelas',
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      saveToFirebase();
                    },
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
