import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyProfilePage extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  void goBack(BuildContext context) {
    Navigator.pop(context);
  }

  void logout() {
    // Logika logout di sini
    print('Logout');
  }

  void editProfile(BuildContext context) {
    Navigator.pushNamed(context, '/ubah_profile');
  }

  void openManualBook() {
    // Logika buka manual book di sini
    print('Buka Manual Book');
  }

  void openAboutMe() {
    // Logika buka About Me di sini
    print('Buka About Me');
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
        title: Text('My Profile'),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            goBack(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: () {
              logout();
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage(
                'https://i.pinimg.com/originals/ee/b0/b4/eeb0b48cb00a736edbb9e7a8c31e2bdc.jpg',
              ),
            ),
            SizedBox(height: 20),
            FutureBuilder<String?>(
              future: getUsername(user!.uid),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  String? username = snapshot.data;
                  return Column(
                    children: [
                      if (username != null)
                        Text(
                          'Username: $username',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal,
                          ),
                        ),
                      SizedBox(height: 10),
                      if (email != null) Text('Email: $email'),
                    ],
                  );
                }
              },
            ),
            SizedBox(height: 40),
            ListTile(
              leading: Icon(Icons.edit, color: Colors.teal),
              title: Text('Ubah Profile', style: TextStyle(color: Colors.teal)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfilePage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.book, color: Colors.teal),
              title: Text('Manual Book', style: TextStyle(color: Colors.teal)),
              onTap: () {
                openManualBook();
              },
            ),
            ListTile(
              leading: Icon(Icons.person, color: Colors.teal),
              title: Text('About Me', style: TextStyle(color: Colors.teal)),
              onTap: () {
                openAboutMe();
              },
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      logout();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.amber,
                    ),
                    child: Text('Logout'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EditProfilePage extends StatelessWidget {
  void goBack(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ubah Profile'),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            goBack(context);
          },
        ),
      ),
      body: Center(
        child: Text(
          'Halaman Ubah Profile',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class UnknownRoutePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Tidak Diketahui'),
      ),
      body: Center(
        child: Text(
          'Halaman tidak ditemukan',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
