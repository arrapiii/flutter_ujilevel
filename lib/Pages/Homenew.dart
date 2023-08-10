import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_ujilevel/Components/BottomNav.dart';
import 'package:flutter_ujilevel/Pages/Riwayat.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_ujilevel/Pages/DetailPage.dart';
import 'MyNavigation.dart';
import 'ProfilePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'FormPage.dart';
import 'package:lottie/lottie.dart';

class Homenew extends StatefulWidget {
  const Homenew({super.key});

  @override
  State<Homenew> createState() => _HomenewState();
}

class _HomenewState extends State<Homenew> {
  var currentIndex = 0;
  late SharedPreferences preferences;
  @override
  void initState() {
    super.initState();
    getUserData();
    createJadwalnya();
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
  void createJadwalnya() async {
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
      body: Container(
        color: const Color(0xFFEAF2FF),
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(),
                ),
                const SizedBox(width: 1),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      preferences.getString('name').toString(),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.0),
                    // Text(
                    //   preferences.getString('level').toString(),
                    //   style: TextStyle(
                    //     fontSize: 10,
                    //     fontWeight: FontWeight.w400,
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 40.0),
                    child: Text(
                      'Selamat datang,',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 40.0),
                    child: Text(
                      'di Bimbingan Konseling',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                    ),
                  ),
                  Center(
                    child: Image.asset(
                      'assets/images/hero-image.png',
                      width: 240,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 40.0),
                    child: Text(
                      'Menu',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FutureBuilder(
                    future: createJadwal(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasError) {
                          return Text('Error occurred while fetching profile');
                        } else {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FormPage(
                                    jadwal: snapshot.data['data'],
                                  ),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 30.0),
                              child: FractionallySizedBox(
                                widthFactor: 0.9, // Adjust the width as needed
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            image: const DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/event.png'),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Buat Jadwal',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 8),
                                            Text(
                                              'Yuk, hadapi masalah bersama dalam sesi konseling',
                                              style: TextStyle(
                                                fontSize: 10,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FutureBuilder(
                    future: createJadwal(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasError) {
                          return Text('Error occurred while fetching profile');
                        } else {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Riwayat(
                                    jadwal: snapshot.data['data'],
                                  ),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 30.0),
                              child: FractionallySizedBox(
                                widthFactor: 0.9, // Adjust the width as needed
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            image: const DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/history.png'),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Lihat History',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 8),
                                            Text(
                                              'Review Sesi Konseling kamu',
                                              style: TextStyle(
                                                fontSize: 10,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
