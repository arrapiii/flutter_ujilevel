import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:flutter_ujilevel/Pages/Homenew.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'LandingPage.dart';

class FormPage extends StatefulWidget {
  final Map jadwal;
  FormPage({super.key, required this.jadwal});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final List<String> jenisLayananDisplay = [
    'Bimbingan Pribadi',
    'Bimbingan Sosial',
    'Bimbingan Karir',
    'Bimbingan Belajar'
  ];


  final _formKey = GlobalKey<FormState>();
  TextEditingController tema = TextEditingController();
  TextEditingController tempat = TextEditingController();
  TextEditingController waktu = TextEditingController();
  TextEditingController jam = TextEditingController();

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  final DateFormat dateFormat = DateFormat('yyyy-MM-dd');

  String? currentKonseling;

  String formatTimeOfDay(TimeOfDay tod) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat('hh:mm'); //"6:00"
    return format.format(dt);
  }

  Future storeJadwal() async {
    DateTime combinedDateTime = DateTime(selectedDate.year, selectedDate.month,
        selectedDate.day, selectedTime.hour, selectedTime.minute);

    final response = await http.post(
        Uri.parse('http://127.0.0.1:8000/api/createjadwal/storejadwal'),
        body: {
          "layanan_id": value.toString(),
          "siswa_id": widget.jadwal['id'].toString(),
          "walas_id": widget.jadwal['walikelas_id'].toString(),
          "guru_id": widget.jadwal['gurubk_id'].toString(),
          "tema": tema.text,
          "tempat": tempat.text,
          "waktu": combinedDateTime.toIso8601String(),
          "status": 'MENUNGGU..',
        });
    print(response.body);
    return json.decode(response.body);
  }

  final List<String> jenisLayananValue = ['1', '2', '3', '4'];
  String? value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(234, 242, 255, 255),
      appBar: AppBar(
        // Menghilangkan warna latar belakang dan bayangan
        // backgroundColor: Color.fromARGB(255, 0, 136, 255),

        iconTheme: IconThemeData(
            color: Colors.black), // Mengubah warna ikon menjadi hitam

        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Create Bimbingan',
          style: TextStyle(
              color: Colors.black), // Mengubah warna teks menjadi hitam
        ),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              double maxWidth = constraints.maxWidth;
              double maxHeight = constraints.maxHeight;

              double fontSize = maxWidth *
                  0.1; // You can adjust this factor according to your preference

              return Stack(
                children: [
                  Positioned(
                    top: 110,
                    left: 37,
                    child: Text(
                      'Guru BK',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 130,
                    left: 37,
                    right: 37,
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          widget.jadwal['gurubk'],
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 200,
                    left: 37,
                    child: Text(
                      'Tema',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 225,
                    left: 37,
                    right: 37,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: TextField(
                        controller: tema,
                        style: GoogleFonts.poppins(color: Colors.black),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Tema',
                          hintStyle: GoogleFonts.poppins(
                              color: Colors.black26,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black38,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(13),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 290,
                    left: 37,
                    child: Text(
                      'Tempat',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 310,
                    left: 37,
                    right: 37,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: TextField(
                        controller: tempat,
                        style: GoogleFonts.poppins(color: Colors.black),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Tempat',
                          hintStyle: GoogleFonts.poppins(
                              color: Colors.black26,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black38,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(13),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 375,
                    left: 37,
                    child: Text(
                      'Tanggal',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 395,
                    left: 37,
                    right: 37,
                    child: GestureDetector(
                      onTap: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        if (date != null) {
                          setState(() {
                            selectedDate = date;
                            waktu.text = dateFormat.format(date);
                          });
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        padding: const EdgeInsets.symmetric(horizontal: 11),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.black26, width: 1),
                        ),
                        child: TextField(
                          controller: waktu,
                          enabled: false,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: 'Tanggal',
                            hintStyle: TextStyle(
                                color: Colors.black26,
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black38,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(13),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(13),
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets
                                .zero, // Add this line to remove extra padding
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 453,
                    left: 37,
                    child: Text(
                      'Jam',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 472,
                    left: 37,
                    right: 37,
                    child: GestureDetector(
                      onTap: () async {
                        final time = await showTimePicker(
                          context: context,
                          initialTime: selectedTime,
                        );
                        if (time != null) {
                          setState(() {
                            selectedTime = time;
                            jam.text = formatTimeOfDay(time);
                          });
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        padding: const EdgeInsets.symmetric(horizontal: 11),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.black26, width: 1),
                        ),
                        child: TextField(
                          controller: jam,
                          enabled: false,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: 'Jam',
                            hintStyle: TextStyle(
                                color: Colors.black26,
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black38,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(13),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(13),
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 560,
                    left: 37,
                    child: Container(
                      width: 300, // Tambahkan lebar (width) sesuai kebutuhan
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.blue, // Border berwarna biru
                        ),
                        color: Colors.blue, // Latar belakang berwarna biru
                      ),
                      child: Center(
                        child: Text(
                          'Submit',
                          style: TextStyle(
                            fontSize: 18, // Ganti ukuran font menjadi 18
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // Teks berwarna putih
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 45,
                    left: 37,
                    right: 37,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 11),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.black26, width: 1)),
                      child: DropdownButton<String>(
                        focusColor: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        style: GoogleFonts.poppins(
                            fontSize: 14, color: Colors.black),
                        hint: Text(
                          'Jenis Layanan',
                          style: GoogleFonts.poppins(
                              color: Colors.black26,
                              fontWeight: FontWeight.normal),
                        ),
                        value: value,
                        iconSize: 36,
                        icon: const Icon(
                          Icons.arrow_drop_down_rounded,
                          color: Colors.black,
                        ),
                        isExpanded: true,
                        underline: Container(),
                        items: jenisLayananDisplay.map((String title) {
                          int index = jenisLayananDisplay.indexOf(title);
                          return DropdownMenuItem<String>(
                            value: jenisLayananValue[index],
                            child: Text(
                              title,
                              style: GoogleFonts.poppins(
                                  fontSize: 14, color: Colors.black),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          print('Old value: $value');
                          print('New value: $newValue');
                          setState(() {
                            currentKonseling = newValue;
                            value = newValue;
                          });
                          print('Updated value: $value');
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    top: 560,
                    left: 37,
                    child: GestureDetector(
                      onTap: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          storeJadwal().then((value) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Homenew()));
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("Jadwal berhasil ditambahkan")));
                          });
                        } else {}
                      },
                      child: Container(
                        width: 300, // Tambahkan lebar (width) sesuai kebutuhan
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color(0xFF17C2EC), // Border berwarna biru
                          ),
                          color:
                              Color(0xFF17C2EC), // Latar belakang berwarna biru
                        ),
                        child: Center(
                          child: Text(
                            'Submit',
                            style: TextStyle(
                              fontSize: 18, // Ganti ukuran font menjadi 18
                              fontWeight: FontWeight.bold,
                              color: Colors.white, // Teks berwarna putih
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
