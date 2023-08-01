import 'package:get/get.dart';

class OtpState extends GetxController{
  RxBool isPress=false.obs;
  setPress(){
    isPress.toggle();
  }
}