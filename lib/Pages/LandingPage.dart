import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_ujilevel/Pages/DetailPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var currentIndex = 0;
  late SharedPreferences preferences;
  @override
  void initState() {
    super.initState();
    getUserData();
  }

  Future getJadwal() async {
    int userId = preferences.getInt('user_id') ?? 0;
    String user = userId.toString();
    final String urlj = 'http://127.0.0.1:8000/api/getjadwal?id=' + user;
    var response = await http.get(Uri.parse(urlj));
    return jsonDecode(response.body);
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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          toolbarHeight: 70,
          title: Text("Riwayat Jadwal"),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                gradient: LinearGradient(
                    colors: [Color(0xff30A2FF), Color(0xff30A2FF)],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter)),
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Text(preferences.getString('name') .toString()),
              Container(
                height: MediaQuery.of(context).size.height / 1.7,
                child: isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : FutureBuilder(
                        future: getJadwal(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: 2,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                              DetailPage(
                                                  jadwal: snapshot.data['data'][index],
                                                  )
                                              ),
                                          );
                                    },
                                    child: Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                          top: 25,
                                          // left: 25,
                                          // right: 25,
                                        ),
                                        padding: const EdgeInsets.only(
                                          top: 20,
                                          left: 20,
                                          right: 20,
                                          bottom: 25,
                                        ),
                                        decoration: BoxDecoration(
                                            boxShadow: const [
                                              BoxShadow(
                                                  color: Color(0xffDDDDDD),
                                                  blurRadius: 5,
                                                  spreadRadius: 1,
                                                  offset: Offset(0, 4.5)),
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color: Colors.white),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    image: const DecorationImage(
                                                        image: AssetImage(
                                                            ''),
                                                        fit: BoxFit.cover),
                                                  ),
                                                  height: 50,
                                                  width: 50,
                                                ),
                                                const SizedBox(width: 10),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                         snapshot.data['data']
                                                            [index]['tempat'],
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                height: 1.5,
                                                                color: Colors
                                                                    .black),
                                                        textAlign:
                                                            TextAlign.left,
                                                      ),
                                                      Text(
                                                         snapshot.data['data']
                                                            [index]['tempat'],
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontSize: 11,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                height: 1.5,
                                                                color: Colors
                                                                    .black),
                                                        textAlign:
                                                            TextAlign.left,
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 12),
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                    top: 5,
                                                    left: 10,
                                                    right: 10,
                                                    bottom: 5),
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xff29B6F6),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                        color:
                                                            Color(0xffDDDDDD),
                                                        blurRadius: 4,
                                                        spreadRadius: 0.5,
                                                        offset: Offset(0, 4.5))
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
                                                            Icons
                                                                .calendar_month,
                                                            size: 15,
                                                            color: Colors.white,
                                                          ),
                                                          const SizedBox(
                                                            width: 5,
                                                          ),
                                                          Text(
                                                             snapshot.data['data']
                                                            [index]['waktu'],
                                                            style: GoogleFonts.poppins(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                height: 1.5,
                                                                color: Colors
                                                                    .white),
                                                            textAlign:
                                                                TextAlign.left,
                                                          )
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          const Icon(
                                                            Icons.timelapse,
                                                            size: 15,
                                                            color: Colors.white,
                                                          ),
                                                          const SizedBox(
                                                            width: 5,
                                                          ),
                                                          Text(
                                                             snapshot.data['data']
                                                            [index]['status'],
                                                            style: GoogleFonts.poppins(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                height: 1.5,
                                                                color: Colors
                                                                    .white),
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
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
              ),
            ],
          ),
        ));
  }
}
