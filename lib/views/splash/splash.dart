import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:note_pad/views/auth/auth/login.dart';
import 'package:note_pad/views/home/home.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), (){
      checkUserState();
    });
  }

  checkUserState(){

    final token = GetStorage().read('token');

    if(token == null){
      return Get.offAll(() => LoginView());
    } else {
     return Get.offAll(() => HomePage());
    }

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'MR Notes',
              style: TextStyle(
                color: Colors.amber,
                fontWeight: FontWeight.bold, fontSize: 20
              )
            ),

            SizedBox(
              height: 15,
            ),


            CircularProgressIndicator(color: Colors.yellowAccent),
          ],
        ),
      ),
    );
  }
}
