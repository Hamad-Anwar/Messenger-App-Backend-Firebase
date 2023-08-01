import 'package:get/get.dart';

class ChatState extends GetxController{
  RxBool isEmpty=true.obs;

  setEmpty(){
    isEmpty.toggle();
  }

}