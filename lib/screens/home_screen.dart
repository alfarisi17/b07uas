import 'login_screen.dart';
import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'user.dart' as user;

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CarouselSlider(
              options: CarouselOptions(height: 200),
              items: [
                Image.asset('assets/images/traveling1.jpg'),
                Image.asset('assets/images/traveling5.jpg'),
                Image.asset('assets/images/traveling6.jpg'),
                Image.asset('assets/images/traveling7.jpg'),
              ].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: i));
                  },
                );
              }).toList(),
            ),
          ),
          Container(
              child: Text("SAFE FLIGHT",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2,
                    wordSpacing: 10,
                  ))),
          SizedBox(height: 10),
          Container(
              child: Text("Stay happy, Stay healthy",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1,
                    wordSpacing: 5,
                  ))),
          SizedBox(height: 15),
          Container(
              child: user.user[0]['status'] == 'logged off'
                  ? ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(LoginPage.routeName);
                      },
                      child: Text("Login Sekarang"),
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.cyan)),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Selamat Datang, ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1,
                              wordSpacing: 5,
                            )),
                        Text(user.user[0]['username'] + "!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.blue,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1,
                              wordSpacing: 5,
                            )),
                      ],
                    )),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    ]);
  }
}
