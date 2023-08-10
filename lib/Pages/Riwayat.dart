import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_ujilevel/Components/BottomNav.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_ujilevel/Pages/DetailPage.dart';
import 'MyNavigation.dart';
import 'ProfilePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'FormPage.dart';

class Riwayat extends StatefulWidget {
  final Map jadwal;
  Riwayat({super.key, required this.jadwal});

  @override
  State<Riwayat> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Riwayat> {
  var currentIndex = 0;
  late SharedPreferences preferences;
  @override
  void initState() {
    super.initState();
    getUserData();
  }

  Future createJadwal() async {
    int userId = preferences.getInt('user_id') ?? 0;
    String user = userId.toString();
    final String urlj = 'http://127.0.0.1:8000/api/createjadwal?id=$userId';
    var response = await http.get(Uri.parse(urlj));
    var decodedResponse = jsonDecode(response.body);
    var id = decodedResponse['id'];
    print(id); // For example, print it
    return decodedResponse;
  }

  Future getJadwal() async {
    int userId = preferences.getInt('user_id') ?? 0;
    String user = userId.toString();
    final String urlj = 'http://127.0.0.1:8000/api/getjadwal?id=' + user;
    var response = await http.get(Uri.parse(urlj));
    print(response.body);
    return jsonDecode(response.body);
  }

  Future updateJadwal(id) async {
    int userId = preferences.getInt('user_id') ?? 0;
    String user = userId.toString();
    final String urlj = 'http://127.0.0.1:8000/api/jadwal/update/' + id;
    var response = await http.get(Uri.parse(urlj));
    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> getProfile() async {
    int userId = preferences.getInt('user_id') ?? 0;
    String user = userId.toString();
    final String urlj = 'http://127.0.0.1:8000/api/profilesiswa?id=' + user;
    var response = await http.get(Uri.parse(urlj));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load profile data');
    }
  }

  bool isLoading = false;
  void getUserData() async {
    setState(() {
      isLoading = true;
    });
    preferences = await SharedPreferences.getInstance();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(234, 242, 255, 255),
      appBar: AppBar(
        // Menghilangkan warna latar belakang dan bayangan
        backgroundColor: Color.fromARGB(234, 242, 255, 255),

        iconTheme: IconThemeData(
            color: Colors.black), // Mengubah warna ikon menjadi hitam

        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        title: Text(
          "Riwayat Jadwal",
          style: GoogleFonts.poppins(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        elevation: 0,
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   elevation: 0.0,
        //   toolbarHeight: 70,
        //   title: Text("Riwayat Jadwal"),
        //   centerTitle: true,
        //   flexibleSpace: Container(
        //     decoration: BoxDecoration(
        //         borderRadius: BorderRadius.only(
        //             bottomLeft: Radius.circular(20),
        //             bottomRight: Radius.circular(20)),
        //         gradient: LinearGradient(
        //             colors: [Color(0xff30A2FF), Color(0xff30A2FF)],
        //             begin: Alignment.bottomCenter,
        //             end: Alignment.topCenter)),
        //   ),
        // ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              //  SizedBox(
              //   height: 10,
              //  ),

              Expanded(
                child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      child: SingleChildScrollView(
                        child: Container(
                          child: Column(
                            children: [
                              // Text(preferences.getString('name').toString()),
                              Container(
                                height: MediaQuery.of(context).size.height / 1,
                                child: isLoading
                                    ? const Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : FutureBuilder(
                                        future: getJadwal(),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData) {
                                            return ListView.builder(
                                                itemCount: snapshot
                                                    .data['data'].length,
                                                itemBuilder: (context, index) {
                                                  return InkWell(
                                                    onTap: () {
                                                      print(snapshot.data['data']);
                                                      Navigator.push(
                                                        context,
                                                        
                                                        MaterialPageRoute(
                                                          
                                                            builder:
                                                                (context) =>
                                                                    DetailPage(
                                                                      jadwalData: snapshot
                                                                              .data['data']
                                                                          [index],
                                                                    )),
                                                      );
                                                    },
                                                    child: Expanded(
                                                      child: Container(
                                                        margin: const EdgeInsets
                                                            .only(
                                                          top: 25,
                                                          // left: 25,
                                                          // right: 25,
                                                        ),
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          top: 20,
                                                          left: 20,
                                                          right: 20,
                                                          bottom: 25,
                                                        ),
                                                        decoration: BoxDecoration(
                                                            boxShadow: const [
                                                              BoxShadow(
                                                                  color: Color(
                                                                      0xffDDDDDD),
                                                                  blurRadius: 5,
                                                                  spreadRadius:
                                                                      1,
                                                                  offset:
                                                                      Offset(0,
                                                                          4.5)),
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            color:
                                                                Colors.white),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    image: const DecorationImage(
                                                                        image: AssetImage(
                                                                            ''),
                                                                        fit: BoxFit
                                                                            .cover),
                                                                  ),
                                                                  height: 50,
                                                                  width: 50,
                                                                ),
                                                                const SizedBox(
                                                                    width: 10),
                                                                Expanded(
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        snapshot.data['data'][index]['layanan_bk']
                                                                            [
                                                                            'jenis_layanan'],
                                                                        style: GoogleFonts.poppins(
                                                                            fontSize:
                                                                                14,
                                                                            fontWeight: FontWeight
                                                                                .bold,
                                                                            height:
                                                                                1.5,
                                                                            color:
                                                                                Colors.black),
                                                                        textAlign:
                                                                            TextAlign.left,
                                                                      ),
                                                                      Text(
                                                                        snapshot.data['data'][index]
                                                                            [
                                                                            'tempat'],
                                                                        style: GoogleFonts.poppins(
                                                                            fontSize:
                                                                                11,
                                                                            fontWeight: FontWeight
                                                                                .bold,
                                                                            height:
                                                                                1.5,
                                                                            color:
                                                                                Colors.black),
                                                                        textAlign:
                                                                            TextAlign.left,
                                                                      )
                                                                    ],
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 12),
                                                              child: Container(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top: 5,
                                                                        left:
                                                                            10,
                                                                        right:
                                                                            10,
                                                                        bottom:
                                                                            5),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          0,
                                                                          172,
                                                                          252),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  boxShadow: const [
                                                                    BoxShadow(
                                                                        color: Color(
                                                                            0xffDDDDDD),
                                                                        blurRadius:
                                                                            4,
                                                                        spreadRadius:
                                                                            0.5,
                                                                        offset: Offset(
                                                                            0,
                                                                            4.5))
                                                                  ],
                                                                ),
                                                                child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Row(
                                                                        children: [
                                                                          const Icon(
                                                                            Icons.calendar_month,
                                                                            size:
                                                                                15,
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                          const SizedBox(
                                                                            width:
                                                                                5,
                                                                          ),
                                                                          Text(
                                                                            snapshot.data['data'][index]['waktu'],
                                                                            style: GoogleFonts.poppins(
                                                                                fontSize: 12,
                                                                                fontWeight: FontWeight.normal,
                                                                                height: 1.5,
                                                                                color: Colors.white),
                                                                            textAlign:
                                                                                TextAlign.left,
                                                                          )
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        children: [
                                                                          const Icon(
                                                                            Icons.timelapse,
                                                                            size:
                                                                                15,
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                          const SizedBox(
                                                                            width:
                                                                                5,
                                                                          ),
                                                                          Text(
                                                                            snapshot.data['data'][index]['status'],
                                                                            style: GoogleFonts.poppins(
                                                                                fontSize: 12,
                                                                                fontWeight: FontWeight.normal,
                                                                                height: 1.5,
                                                                                color: Colors.white),
                                                                            textAlign:
                                                                                TextAlign.left,
                                                                          )
                                                                        ],
                                                                      )
                                                                    ]),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                });
                                          } else {
                                            return const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          }
                                        },
                                      ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
