import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messenger/Utils/Widget/text_field.dart';
import 'package:messenger/View/account/sign_up.dart';

import '../../res/Assets/image_assets.dart';
import 'otp.dart';
class Login extends StatelessWidget {
  Login({super.key});
  final TextEditingController email=TextEditingController();
  final TextEditingController password=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(ImageAssets.signIn,height: MediaQuery.sizeOf(context).height/2.8,),
                const Text("Login",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 35),),
                const SizedBox(height: 20,),
                CustomField(
                    controller: email, hint: "Phone Number", iconData: Icons.phone_iphone_rounded),
                const SizedBox(height: 20,),
                CustomField(
                    controller: email, hint: "Password", iconData: Icons.lock_outlined),
                const SizedBox(height: 10,),
                const Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    "Forgot Password ?",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 30,),
                InkWell(

                  child: Container(
                    height: 60,width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: const Center(
                      child: Text("Continue",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Row(
                  children: [
                    Expanded(child: Container(height: 1,color: Colors.grey.withOpacity(.2),margin: const EdgeInsets.symmetric(horizontal: 10),),),
                    const Text("OR",style: TextStyle(color: Colors.grey,fontSize: 17),),
                    Expanded(child: Container(height: 1,color: Colors.grey.withOpacity(.2),margin: const EdgeInsets.symmetric(horizontal: 10),),),
                  ],
                ),
                const SizedBox(height: 20,),
                InkWell(

                  child: Container(
                    height: 60,width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(.2),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 20,),
                        Image.asset(ImageAssets.google,height: 30,width: 30,),
                        SizedBox(width: MediaQuery.sizeOf(context).width/6,),
                        const Text("Login with Google",style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal),),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () => Get.to( SignUp()),
                    child: RichText(text: const TextSpan(
                        children:[
                          TextSpan(
                            text: "New to logistic? ",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                              text: " SignUp",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)
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
    );
  }
}
