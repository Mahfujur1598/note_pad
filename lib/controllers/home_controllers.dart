

import 'package:get/get.dart';

class HomeController extends GetxController{

  RxBool isGrid = RxBool(false);

  void changeType(){

    isGrid.value = !isGrid.value;

    update();
  }
}

