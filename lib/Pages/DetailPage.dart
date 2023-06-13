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
      body: SafeArea
      (
        child: SingleChildScrollView
        (
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Image.asset('images/hero1.png'),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: 
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(jadwal['tempat'],
                      style: TextStyle
                      (
                          fontWeight:FontWeight.w700
                      ),),
                      SizedBox(height: 10),
                      Text("Bogor,Jawabarat",
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
                  "Tugu Kujang adalah sebuah tugu yang merupakan ikon kota Bogor. Bentuknya menyerupai sebuah kujang, yakni senjata pusaka suku Sunda yang berasal dari Jawa Barat. Tugu Kujang dibangun pada 4 Mei 1982 pada masa pemerintahan walikota Achmad Sobana dengan biaya pembangunan mencapai 80 juta. Wikipedia \n\n Tugu Kujang adalah sebuah tugu yang merupakan ikon kota Bogor. Bentuknya menyerupai sebuah kujang, yakni senjata pusaka suku Sunda yang berasal dari Jawa Barat. Tugu Kujang dibangun pada 4 Mei 1982 pada masa pemerintahan walikota Achmad Sobana dengan biaya pembangunan mencapai 80 juta. Wikipedia",
                  style: TextStyle(fontSize: 12),
                  textAlign: TextAlign.justify,
                )
            )
          ]),
        ),
      ),
    );
  }
}