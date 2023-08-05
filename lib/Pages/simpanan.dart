import 'package:flutter/material.dart';
Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: 
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(jadwal['tempat'] ?? '--:--',
                      style: TextStyle
                      (
                          fontWeight:FontWeight.w700
                      ),),
                      SizedBox(height: 10),
                      Text(jadwal['layanan_bk']['jenis_layanan'],
                      style: TextStyle
                      (
                          fontWeight:FontWeight.w400
                      ),),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.favorite,color: Colors.amber[400]),
                      const Text(" 9.9")
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row
              (
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column
                  (
                    children: [
                      Icon(Icons.call,color:Colors.green[400]),
                      const SizedBox(height: 10),
                      const Text("CALL",style: TextStyle(fontSize: 12),)
                    ],
                  ),
                  Column
                  (
                    children: [
                      Icon(Icons.near_me,color:Colors.green[400]),
                      const SizedBox(height: 10),
                      const Text("MAP",style: TextStyle(fontSize: 12),)
                    ],
                  ),
                  Column
                  (
                    children: [
                      Icon(Icons.share,color:Colors.green[400]),
                      const SizedBox(height: 10),
                      const Text("SHARE",style: TextStyle(fontSize: 12),)
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30)
,            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child:
              Text(
                  jadwal['hasil_konseling'] ?? 'Hasil belum di input',
                  style: TextStyle(fontSize: 12),
                  textAlign: TextAlign.justify,
                )
            )