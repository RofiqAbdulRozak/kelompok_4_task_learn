import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

void main() {
  runApp(TambahInformasi1());
}

class TambahInformasi1 extends StatelessWidget {
  const TambahInformasi1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TambahInformasi(),
    );
  }
}

class TambahInformasi extends StatefulWidget {
  const TambahInformasi({Key? key}) : super(key: key);

  @override
  State<TambahInformasi> createState() => _TambahInformasiState();
}

class _TambahInformasiState extends State<TambahInformasi> {
  String? selectedOption;
  String? fileName;
  String? filePath;
  bool showDeadline = false; // Menambahkan variabel showDeadline
  DateTime? selectedDateTime;

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDateTime ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (pickedTime != null) {
        setState(() {
          selectedDateTime = DateTime(
            picked.year,
            picked.month,
            picked.day,
            pickedTime.hour,
            pickedTime.minute,
          );
        });
      }
    }
  }

  void showPicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        fileName = result.files.single.name;
        filePath = result.files.single.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: Text("TAMBAH INFORMASI"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 4, right: 4, top: 20),
          child: Column(
            children: [
              Center(
                child: Text(
                  "TAMBAHKAN INFORMASI",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Jenis Informasi',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2.0,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
                value: selectedOption,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedOption = newValue;
                    if (selectedOption == 'TUGAS') {
                      showDeadline = true;
                    } else {
                      showDeadline = false;
                    }
                  });
                },
                items: <String>['TUGAS', 'MATERI']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Judul',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2.0,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
                textInputAction: TextInputAction.newline,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                onEditingComplete: () {},
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Deskripsi',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.teal,
                      width: 2.0,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
                textInputAction: TextInputAction.newline,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                onEditingComplete: () {},
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue, width: 2.0),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.attach_file,
                            color: Colors.blue,
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              fileName ?? 'Belum ada file terpilih',
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  InkWell(
                    onTap: showPicker,
                    child: InkResponse(
                      highlightShape: BoxShape.circle,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[300],
                        ),
                        child: Icon(
                          Icons.upload,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              if (showDeadline) // Menampilkan Tenggat Waktu hanya jika showDeadline true
                InkWell(
                  onTap: () => _selectDateTime(context),
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'Tenggat Waktu',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.teal,
                          width: 2.0,
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.calendar_today),
                        SizedBox(width: 8),
                        if (selectedDateTime != null)
                          Text(
                            selectedDateTime.toString(),
                          ),
                      ],
                    ),
                  ),
                ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  //logika (kode)
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                ),
                child: Text("Tambah Informasi"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
