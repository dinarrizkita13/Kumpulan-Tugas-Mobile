import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardName extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Digital Card Name',
      home: Scaffold(
        backgroundColor: Colors.red,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: .center,
              children: [
                CircleAvatar( //Foto
                  backgroundImage: NetworkImage('data:image/jpeg;base64,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'),
                  radius: 70.0,
                ),
                SizedBox(height: 20.0,),
                Text( //Teks nama
                  'Jokowow',
                  style: GoogleFonts.playwriteAr(
                    fontSize: 30,
                    fontWeight: .bold,
                    color: Colors.white
                  ),
                ),
                Text( //Teks pekerjaan
                  'Nganggur',
                  style: GoogleFonts.aladin(
                    fontSize: 20,
                    fontWeight: .bold,
                    color: Colors.black,
                    letterSpacing: 5
                  ),
                ),

                SizedBox(
                  height: 10,
                  width: 200.0,
                  child: Divider(
                    color: Colors.white,
                  ),
                ),

                Card( //Card Nomor
                  margin: EdgeInsets.symmetric(horizontal: 50,vertical: 5),
                  color: Colors.black,
                  child: ListTile(
                    leading: Icon(Icons.phone_android, color: Colors.white,),
                    title: Text('+62812 2600 960',
                    style: TextStyle(
                      color: Colors.white
                      ),
                    ),
                  ),
                ),

                Card( //Card Email
                  margin: EdgeInsets.symmetric(horizontal: 50,vertical: 5),
                  color: Colors.black,
                  child: ListTile(
                    leading: Icon(Icons.email, color: Colors.white,),
                    title: Text('jokowow@gmail.com',
                    style: TextStyle(
                      color: Colors.white
                      ),
                    ),
                  ),
                ),

                Card( //Card Sosmed
                  margin: EdgeInsets.symmetric(horizontal: 50,vertical: 5),
                  color: Colors.black,
                  child: ListTile(
                    leading: Icon(Icons.facebook, color: Colors.white,),
                    title: Text('jokowow anjay',
                    style: TextStyle(
                      color: Colors.white
                      ),
                    ),
                  ),
                ),

                Card( //Card Alamat
                  margin: EdgeInsets.symmetric(horizontal: 50,vertical: 5),
                  color: Colors.black,
                  child: ListTile(
                    leading: Icon(Icons.home, color: Colors.white,),
                    title: Text('Kota Solo',
                    style: TextStyle(
                      color: Colors.white
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
          ),
      ),
    );
  }
}
