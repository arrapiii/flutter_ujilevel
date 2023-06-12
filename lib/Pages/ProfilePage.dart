import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // PickedFile? _pickedImage;

  // Future<void> _pickImage() async {
  //   final ImagePicker _picker = ImagePicker();
  //   final pickedImage = await _picker.getImage(source: ImageSource.gallery);
  //   setState(() {
  //     _pickedImage = pickedImage;
  //   });
  // }
  @override
  JenisKelamin? selectedValue;
  List<JenisKelamin> jenis = [
    JenisKelamin(id: 1, name: "Laki-Laki"),
    JenisKelamin(id: 2, name: "Perempuan")
  ];





  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.arrow_back_rounded)),
              Expanded(
                  child: Center(
                child: Container(
                  child: const Text(
                    'Informasi Akun',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
              )),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            // child: Image.asset('assets/'),
            child: Lottie.asset(
              "lottie/profile.json",
              width: 300,
              height: 300,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Row(
              children: [
                const Text(
                  'Info Profile',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    
                  },
                  child: const Text('Ubah', style: TextStyle(
                    color: Colors.blueAccent
                  ),),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            
            child: Container(
              height: 700,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const TextField(
                      decoration: InputDecoration(
                          // contentPadding: EdgeInsets.symmetric(horizontal: 10), ini buat ngasih jarak text
                          border: UnderlineInputBorder(),
                          labelText: 'Fullname',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 14
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const TextField(
                      decoration: InputDecoration(
                          // contentPadding: EdgeInsets.symmetric(horizontal: 10), ini buat ngasih jarak text
                          border: UnderlineInputBorder(),
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 14
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //  TextField(
                    //   decoration: InputDecoration(
                    //       // contentPadding: EdgeInsets.symmetric(horizontal: 10), ini buat ngasih jarak text
                    //       border: const UnderlineInputBorder(),
                    //       labelText: 'Password',
                    //        suffixIcon: IconButton(onPressed: (){
                            
                    //       }, icon: Icon(password == false ? Icons.visibility : Icons.visibility_off)),
                          
                    //       labelStyle: const TextStyle(
                    //         fontWeight: FontWeight.w900,
                    //         fontSize: 14
                    //       )),
                    //     obscureText: password,

                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                    const TextField(
                      decoration: InputDecoration(
                          // contentPadding: EdgeInsets.symmetric(horizontal: 10), ini buat ngasih jarak text
                          border: UnderlineInputBorder(),
                          labelText: 'No. Ktp',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 14
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const TextField(
                      decoration: InputDecoration(
                          // contentPadding: EdgeInsets.symmetric(horizontal: 10), ini buat ngasih jarak text
                          border: UnderlineInputBorder(),
                          labelText: 'Alamat',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 14
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const TextField(
                      decoration: InputDecoration(
                          // contentPadding: EdgeInsets.symmetric(horizontal: 10), ini buat ngasih jarak text
                          border: UnderlineInputBorder(),
                          labelText: 'No. Telp',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 14
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const TextField(
                      decoration: InputDecoration(
                          // contentPadding: EdgeInsets.symmetric(horizontal: 10), ini buat ngasih jarak text
                          border: UnderlineInputBorder(),
                          labelText: 'Tanggal lahir',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 14
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Jenis Kelamin',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Container(
                          child: DropdownButton<JenisKelamin?>(
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value;
                              });
                            },
                            isExpanded: true,
                            value: selectedValue,
                            items: jenis
                                .map<DropdownMenuItem<JenisKelamin?>>((e) =>
                                    DropdownMenuItem(
                                      child:
                                          Text((e?.name ?? ' ').toString()),
                                      value: e,
                                    ))
                                .toList(),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class JenisKelamin {
  int? id;
  String? name;

  JenisKelamin({this.id, this.name});
}
