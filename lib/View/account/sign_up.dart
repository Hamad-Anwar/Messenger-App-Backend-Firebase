import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messenger/Data/Netword/Firebase/firebase_services.dart';
import 'package:messenger/Getx/get_signup.dart';
import 'package:messenger/Utils/Widget/snackbar.dart';
import 'package:messenger/Utils/Widget/text_field.dart';
import 'package:messenger/View/account/login.dart';
import 'package:messenger/res/Assets/image_assets.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  final TextEditingController name=TextEditingController();
  final TextEditingController number=TextEditingController();
  final TextEditingController password=TextEditingController();
  final SignUpState _controller=Get.put(SignUpState());
  final _key=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Form(
              key: _key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20,),
                  Image.asset(ImageAssets.image1,height: MediaQuery.sizeOf(context).height/2.8,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Sign Up",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 35),),
                      const Spacer(),
                      const Spacer(),
                      const Spacer(),
                      Obx(
                            () => GestureDetector(
                              onTap: () => _controller.picImage(),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Container(
                                  height: 70,
                                  width: 70,
                                  color: Colors.white,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      _controller.path.isEmpty
                                          ? const Padding(
                                        padding: EdgeInsets.all(20.0),
                                        child: FlutterLogo(
                                          size: 50,
                                        ),
                                      )
                                          : Image.file(
                                        File(_controller.path.value),
                                        height: 70,
                                        width: 70,
                                        fit: BoxFit.cover,
                                      ),
                                      Positioned(
                                          bottom: 1,
                                          child: Container(
                                            height: 30,
                                            width: 100,
                                            color: Colors.black12,
                                            child: const Center(
                                              child: Icon(
                                                Icons.camera_alt,
                                                color: Colors.black38,
                                              ),
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  CustomField(controller: name, hint: "Full Name", iconData: Icons.person_outline_rounded),
                  const SizedBox(height: 20,),
                  CustomField(controller: number, hint: "Mobile Number", iconData: Icons.phone_iphone,type: TextInputType.number,),
                  const SizedBox(height: 20,),
                  CustomField(controller: password, hint: "Password", iconData: Icons.lock_outlined),
                  const SizedBox(height: 20,),
                  RichText(text: const TextSpan(
                    children:[
                      TextSpan(
                        text: "By signing up, you're agree to our ",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: " Terms & Conditions",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)
                      ),
                      TextSpan(
                        text: "  and ",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                          text: "  Privacy Policy",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)
                      ),
                    ]
                  )),
                  const SizedBox(height: 30,),
                  GestureDetector(
                    onTap: () {
                      if(name.text.toString().isNotEmpty && number.text.toString().isNotEmpty
                      && password.text.toString().isNotEmpty && _controller.path.isNotEmpty
                      ){
                        FirebaseService.requestOtp(number.text.toString(), name.text.toString(),
                            File(_controller.path.value),_controller);
                      }else{
                        ShowSnackBar("Warning", "Fill data correctly");
                      }
                    },
                    child: Container(
                      height: 60,width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Obx(() =>
                      _controller.isPress.value ?

                       const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 15,width: 15,child: CircularProgressIndicator(color: Colors.white,),),
                          SizedBox(
                            width: 20,
                          ),
                          Text("Requesting",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
                        ],
                      )

                          :const Center(
                        child: Text("Get Otp",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
                      ),

                        )
                    ),
                  ),
                  const SizedBox(height: 30,),
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () => Get.to( Login()),
                      child: RichText(text: const TextSpan(
                          children:[
                            TextSpan(
                              text: "Join us before? ",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                                text: " Login",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)
                            ),

                          ]
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
