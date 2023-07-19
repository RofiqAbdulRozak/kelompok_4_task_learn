import 'package:flutter/material.dart';

class tugas_dinilai_dosen extends StatefulWidget {
  const tugas_dinilai_dosen({Key? key}) : super(key: key);

  @override
  _tugas_dinilai_dosenState createState() => _tugas_dinilai_dosenState();
}

class _tugas_dinilai_dosenState extends State<tugas_dinilai_dosen> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Tugas Pertemuan 10"),
        backgroundColor: Colors.amber[700],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              height: 50,
              width: screenWidth,
              margin: EdgeInsets.only(
                top: 30,
                left: 30,
              ),
              child: Text(
                "Jawaban Tugas",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.amber[700],
                ),
              ),
            ),
            Stack(
              children: [
                Container(
                  height: 200,
                  width: screenWidth - 60,
                  margin: EdgeInsets.only(
                    top: 80,
                    left: 30,
                    right: 30,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.amber[700],
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                Positioned(
                  top: 100,
                  left: 50,
                  right: 60,
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 10),
                        Icon(
                          Icons.account_circle,
                          size: 30,
                          color: Colors.white,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Adi",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                " /100",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 180,
                  left: 60,
                  right: 60,
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            obscureText: _obscureText,
                            decoration: InputDecoration(
                              hintText: 'File.pdf',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 50,
              width: 150,
              margin: EdgeInsets.only(
                top: 350,
                left: 30,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey,
              ),
              child: Row(
                children: [
                  SizedBox(width: 10),
                  Text(
                    "Nilai",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          " /100",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              width: 95,
              margin: EdgeInsets.only(
                top: 350,
                left: 200,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.amber[700],
              ),
              child: TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Text(
                      "Beri Nilai",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
