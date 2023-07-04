import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class buat_kelas extends StatefulWidget {
  const buat_kelas({Key? key}) : super(key: key);

  @override
  State<buat_kelas> createState() => _buat_kelasState();
}

class _buat_kelasState extends State<buat_kelas> {
  TextEditingController matakuliahController = TextEditingController();
  TextEditingController kelasController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> logout() async {
    await auth.signOut();
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    User? user = auth.currentUser;
    String? email = user?.email;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
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
