
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool password = true;

  late String message = '';

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          padding: const EdgeInsets.all(20),
          scrollDirection: Axis.vertical,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: IconButton(
                      onPressed: () {
                        // balik ke awal
                      },
                      icon: const Icon(Icons.arrow_back_rounded)),
                ),

                // Hero Image
                const SizedBox(
                  height: 15,
                ),
                Center(
                    child: Lottie.asset(
                  'lottie/login.json',
                  width: 270,
                  height: 270,
                )),
                const SizedBox(
                  height: 15,
                ),

                // Sign Up
                const Text(
                  'Login',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                // Input Start
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 12),
                      child: Icon(Icons.alternate_email_rounded),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          // contentPadding: EdgeInsets.symmetric(horizontal: 10), ini buat ngasih jarak text
                          border: UnderlineInputBorder(),
                          labelText: 'Email',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 12),
                      child: Icon(Icons.lock_rounded),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    password = !password;
                                  });
                                },
                                icon: Icon(password == false
                                    ? Icons.visibility
                                    : Icons.visibility_off))),
                        obscureText: password,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                // Input End

                const SizedBox(
                  height: 20,
                ),

                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Forgot Password?',
                        style: TextStyle(color: Colors.blueAccent)),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                // Button Start
                Center(
                  child: Container(
                      width: 320,
                      height: 50,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed)) {
                              // return Colors
                              //     .blue; // Mengatur warna latar belakang saat tombol ditekan menjadi merah
                            }
                            return const Color(
                                0xFF0065FF); // Mengatur warna latar belakang saat tombol tidak ditekan menjadi biru
                          }),
                        ),
                        onPressed: () {
                          // Login(
                          //     emailController, passwordController, "Realmi");
                        },
                        child: const Text('Continue'),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),

                Center(
                  child: message.isNotEmpty
                      ? Text(
                          message,
                          style: TextStyle(color: Colors.red),
                        )
                      : Text(''),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('New to Logistic? '),
                    GestureDetector(
                        onTap: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Login(),
                                  ))
                            },
                        child: const Text(
                          'Register',
                          style: TextStyle(color: Colors.blueAccent),
                        ))
                  ],
                ),
              ],
            ),
          ],
        ),
        // icon
      ),
      backgroundColor: Colors.white,
    );
  }
}