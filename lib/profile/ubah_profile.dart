import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController alamatController = TextEditingController();

  @override
  void initState() {
    usernameController = TextEditingController();
    namaController = TextEditingController();
    alamatController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    namaController.dispose();
    alamatController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text('Profile updated successfully!'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _editPhoto() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Photo'),
          content: Text('Foto berhasil di perbarui'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            InkWell(
              onTap: _editPhoto,
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('path_to_your_image'),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: namaController,
              decoration: InputDecoration(
                labelText: 'Nama',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: alamatController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: _saveProfile,
              child: Text('Simpan'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Konfirmasi'),
                      content: Text('Apakah Anda yakin ingin keluar?'),
                      actions: [
                        TextButton(
                          child: Text('Batal'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text('Log Out'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Keluar'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
