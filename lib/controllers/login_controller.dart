import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:note_pad/views/home/home.dart';

class LoginController extends GetxController {
  //RxString email = RxString('');
  //var email = ''.obs;
  //RxString email = ''.obs;

  RxString email = RxString('');
  RxString password = RxString('');

  RxBool isLogging = RxBool(false);

  Map validLoginDetails = {
    'email': 'mahfujur1598@gmail.com',
    'password': '12345678',

    'response': {
      'token': 'jfryhguyetrf',
      'user': {
        'name': 'Mahfuj',
        'phone': '01723381598'
      }
    }
  };

  final box = GetStorage();




   Future login() async {
    if (email.isEmpty || password.isEmpty) {
      return Get.snackbar(
        'Error',
        'All field is required.',
        colorText: Colors.white,
      );
    }

    if (!GetUtils.isEmail(email.value)) {
      return Get.snackbar('Error', 'Your E-mail is Invalid.');
    }

    isLogging.value = true;

    Timer(Duration(seconds: 1), (){

      isLogging.value = false;

      if(validLoginDetails['email'] != email.value){
        Get.snackbar('Error', 'Your email is invalid.');
        return;
      }
      if(validLoginDetails['password'] != password.value){
        Get.snackbar('Error', 'Your password is incorrect.');
        return;
      }


      // Login Success
      final response = validLoginDetails['response'];

      //print(response);

      box.write('token', response['token']).then((value)=>print('Token Stored'));
      
       Get.offAll(() => HomePage());


    });


  }
}
