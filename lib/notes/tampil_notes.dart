import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class tampil_notes extends StatefulWidget {
  final String noteId;

  const tampil_notes({Key? key, required this.noteId}) : super(key: key);

  @override
  State<tampil_notes> createState() => _tampil_notesState();
}

class _tampil_notesState extends State<tampil_notes> {
  late Stream<DocumentSnapshot> _noteStream;

  @override
  void initState() {
    super.initState();
    _noteStream = FirebaseFirestore.instance
        .collection('Notes')
        .doc(widget.noteId)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
      ),
      body: Stack(
        children: <Widget>[
          StreamBuilder<DocumentSnapshot>(
            stream: _noteStream,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }

              final note = snapshot.data!.data() as Map<String, dynamic>;
              final title = note['Judul'];
              final description = note['Description'];
              final color = note['Color'];
              final date = (note['Date'] as Timestamp).toDate();

              return ListView(
                padding: EdgeInsets.only(
                  top: 50,
                  left: 30,
                  right: 30,
                ),
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Text(
                          '$title',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      Text(
                        '$description',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                        ),
                      ),
                      Text(
                        '${date.toString().split(' ')[0]}',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
