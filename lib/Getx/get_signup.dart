import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SignUpState extends GetxController{
  RxString path="".obs;
  RxBool isPress=false.obs;

  setPress(){
    isPress.toggle();
  }
  picImage() async {
     var picker=await ImagePicker().pickImage(source: ImageSource.gallery);
     if(picker!=null){
       path.value=picker.path;
     }else{
       path.value="";
     }
  }
}