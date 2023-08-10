import 'package:flutter/material.dart';
import 'package:flutter_ujilevel/Pages/EditPage.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';

class DetailPage extends StatefulWidget {
  final Map jadwalData;

  DetailPage({super.key, required this.jadwalData});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
    void initState() {
    super.initState();
    print(widget.jadwalData);
  }

  String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return text.substring(0, maxLength - 3) + '...';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Menghilangkan warna latar belakang dan bayangan
        backgroundColor: Color.fromARGB(255, 0, 136, 255),

        iconTheme: IconThemeData(
            color: Colors.black), // Mengubah warna ikon menjadi hitam

        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Image.asset('assets/images/hero1.jpeg'),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Expanded(
                  child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey
                          .withOpacity(0.5), // Warna dan opasitas bayangan
                      spreadRadius:
                          5, // Besar bayangan (semakin besar, semakin lebar bayangan)
                      blurRadius:
                          7, // Jumlah blur pada bayangan (semakin besar, semakin samar)
                      offset: Offset(0, 3), // Posisi bayangan (x, y
                    )
                  ],
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Detail Bimbingan',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.blueAccent[400],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Nama Siswa',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.blueAccent[400],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    ':',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.blueAccent[400],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    widget.jadwalData['siswa']['namasiswa'],
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.blueAccent[400],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Jenis Bimbingan',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.blueAccent[400],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    ':',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.blueAccent[400],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    widget.jadwalData['layanan_bk']['jenis_layanan'],
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.blueAccent[400],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Nama Pembimbing',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.blueAccent[400],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    ':',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.blueAccent[400],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    widget.jadwalData['guru']['namaguru'],
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.blueAccent[400],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Waktu',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.blueAccent[400],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    ':',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.blueAccent[400],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    widget.jadwalData['waktu'],
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.blueAccent[400],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Tempat',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.blueAccent[400],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    ':',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.blueAccent[400],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    widget.jadwalData['tempat'],
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.blueAccent[400],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Status',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.blueAccent[400],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    ':',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.blueAccent[400],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    widget.jadwalData['status'],
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.blueAccent[400],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Hasil Konseling',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.blueAccent[400],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    ':',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.blueAccent[400],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    truncateText(
                                        widget.jadwalData['hasil_konseling'] ??
                                            'Hasil belum di input',
                                        12),
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.blueAccent[400],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      print(widget.jadwalData);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => EditPage(jadwalLagi: widget.jadwalData),
                                        ),
                                      );
                                    },
                                    child: Container(
                                        width: 270.0,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 227, 182, 67),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text('Edit',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              )),
                                        )),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Container(
                                      width: 270.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text('Hapus',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            )),
                                      ))
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              // Text(
                              //   'Jenis Bimbingan',
                              //    style: TextStyle(
                              //   fontSize: 14,
                              //   fontWeight: FontWeight.w300,
                              //   color: Colors.blueAccent[400],
                              //   ),
                              //   ),
                              //    SizedBox(height: 10,),
                              // Text(
                              //   'Nama Pembimbing',
                              //    style: TextStyle(
                              //   fontSize: 14,
                              //   fontWeight: FontWeight.w300,
                              //   color: Colors.blueAccent[400],
                              //   ),
                              //   ),
                              //    SizedBox(height: 10,),
                              // Text(
                              //   'Waktu',
                              //    style: TextStyle(
                              //   fontSize: 14,
                              //   fontWeight: FontWeight.w300,
                              //   color: Colors.blueAccent[400],
                              //   ),
                              //   ),
                              //    SizedBox(height: 10,),
                              // Text(
                              //   'Tempat',
                              //    style: TextStyle(
                              //   fontSize: 14,
                              //   fontWeight: FontWeight.w300,
                              //   color: Colors.blueAccent[400],
                              //   ),
                              //   ),
                              //    SizedBox(height: 10,),
                              // Text(
                              //   'Status',
                              //    style: TextStyle(
                              //   fontSize: 14,
                              //   fontWeight: FontWeight.w300,
                              //   color: Colors.blueAccent[400],
                              //   ),
                              //   ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                // child: Padding(
                //   padding: const EdgeInsets.all(20.0),
                //   child: Row(
                //     children: [
                //       Column(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Row(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               Text(
                //                 'Detail Bimbingan',
                //                 style: TextStyle(
                //                   color: Colors.blueAccent[400],
                //                   fontWeight: FontWeight.w900,
                //                   fontSize: 19,
                //                 ),
                //                 ),
                //                 Text('data')
                //             ],
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                // ),
              )),
            ),
          ]),
        ),
      ),
    );
  }
}
