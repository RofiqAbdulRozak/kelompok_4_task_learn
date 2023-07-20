import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io'; // Import the dart:io package to access File class

class KirimTugasPage extends StatefulWidget {
  @override
  _KirimTugasPageState createState() => _KirimTugasPageState();
}

class _KirimTugasPageState extends State<KirimTugasPage> {
  String _filePath = ''; // Variable to store the selected file path

  // Function to upload the file (implement according to your needs)
  void _uploadFile() {
    FilePicker.platform.pickFiles().then((result) {
      if (result != null) {
        setState(() {
          _filePath = result.files.single.path ?? '';
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kirim Tugas'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Upload jawaban anda dengan klik upload file:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            _filePath.isEmpty
                ? CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 50,
                    child: Icon(
                      Icons.cloud_upload,
                      color: Colors.white,
                      size: 40,
                    ),
                  )
                : CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 50,
                    backgroundImage: FileImage(File(_filePath)),
                  ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _uploadFile,
              child: Text('Upload File'),
            ),
          ],
        ),
      ),
    );
  }
}
