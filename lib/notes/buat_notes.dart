import 'package:flutter/material.dart';
import 'menu_daftar_notes.dart';

class buat_notes extends StatefulWidget {
  @override
  _buat_notesState createState() => _buat_notesState();
}

class _buat_notesState extends State<buat_notes> {
  String title = '';
  String description = '';
  String selectedColor = 'Red';
  DateTime selectedDate = DateTime.now();

  List<String> colors = ['Red', 'Green', 'Blue', 'Yellow'];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Catatan'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              onChanged: (value) {
                setState(() {
                  title = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Judul',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              onChanged: (value) {
                setState(() {
                  description = value;
                });
              },
              maxLines: null, // Untuk mengizinkan multiple baris
              keyboardType: TextInputType
                  .multiline, // Untuk menampilkan keyboard dengan enter
              textInputAction: TextInputAction
                  .newline, // Untuk mengatur tindakan tombol enter
              decoration: InputDecoration(
                labelText: 'Deskripsi',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            DropdownButton<String>(
              value: selectedColor,
              onChanged: (String? newValue) {
                setState(() {
                  selectedColor = newValue!;
                });
              },
              items: colors.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 16.0),
            TextButton(
              onPressed: () => _selectDate(context),
              child: Text(
                'Pilih Tanggal: ${selectedDate.toString().split(' ')[0]}',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => menu_daftar_notes(),
                  ),
                );
              },
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
