import 'package:flutter/material.dart';


class DetailPage extends StatelessWidget
{
  final Map jadwal;

  DetailPage({ super.key, required this.jadwal});

  @override

  Widget build(BuildContext context)
  {
    return Scaffold
    (
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
        ),),
      body: SafeArea
      
      (
        child: SingleChildScrollView
        (
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Image.asset('assets/images/hero1.jpeg'),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: 
              Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // Warna dan opasitas bayangan
                      spreadRadius: 5, // Besar bayangan (semakin besar, semakin lebar bayangan)
                      blurRadius: 7, // Jumlah blur pada bayangan (semakin besar, semakin samar)
                      offset: Offset(0, 3), // Posisi bayangan (x, y
                    )
                  ],
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
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
                                SizedBox(height: 10,),
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
                                      jadwal['siswa']['namasiswa'],
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
                                      jadwal['layanan_bk']['jenis_layanan'],
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
                                      jadwal['guru']['namaguru'],
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
                                      jadwal['waktu'],
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
                                      jadwal['tempat'],
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
                                      jadwal['status'],
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
                                      jadwal['hasil_konseling'] ?? 'Hasil belum di input',
                                       style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.blueAccent[400],
                                      ),
                                      
                                      ),
                                  ],
                                ),
                                   SizedBox(height: 10,),
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
              )
              ),
              ),
          ]),
        ),
      ),
    );
  }
}