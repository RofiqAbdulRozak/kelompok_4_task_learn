import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'buat_notes.dart';
import 'tampil_notes.dart';

class menu_daftar_notes extends StatefulWidget {
  const menu_daftar_notes({Key? key});

  @override
  State<menu_daftar_notes> createState() => _menu_daftar_notesState();
}

class _menu_daftar_notesState extends State<menu_daftar_notes> {
  void navigateToTampilNotes(String noteId) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => tampil_notes(noteId: noteId)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              top: 30,
              left: 30,
            ),
            child: Text(
              "Notes",
              style: TextStyle(
                fontSize: 30,
                color: Colors.blue,
              ),
            ),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('Notes').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }

              final notes = snapshot.data!.docs;

              return ListView.builder(
                padding: EdgeInsets.only(
                  top: 120,
                  left: 30,
                  right: 30,
                ),
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  final note = notes[index].data() as Map<String, dynamic>;
                  final noteId = notes[index].id;
                  final title = note['Judul'];
                  final description = note['Description'];

                  return InkWell(
                    onTap: () => navigateToTampilNotes(noteId),
                    child: Container(
                      height: 100,
                      margin: EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.note_alt_outlined,
                              color: Colors.white,
                              size: 80,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  '$title',
                                  style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Text(
                                '$description',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
          Positioned(
            top: 30,
            right: 30,
            child: Align(
              alignment: Alignment.topRight,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => buat_notes()),
                  );
                },
                child: Icon(Icons.add),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
