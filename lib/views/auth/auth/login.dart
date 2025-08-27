import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_pad/controllers/login_controller.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(LoginController());



    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Obx(()=>ListView(
          children: [
            TextFormField(
              onChanged: (value){
                controller.email.value = value;
              },

              decoration: InputDecoration(
                labelText: 'E-mail',
                labelStyle: TextStyle(color: Colors.white.withAlpha(70)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            SizedBox(height: 15),

            TextFormField(
                onChanged: (value){
                  controller.password.value = value;
                },
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.white.withAlpha(70)),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onPressed: () => controller.login(),
                child: controller.isLogging.value ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                ) : Text('Login', style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold)),
              ),
            ),
          ],




        )),
      ),
    );
  }
}
