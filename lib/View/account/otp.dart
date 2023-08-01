import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messenger/Data/Netword/Firebase/firebase_services.dart';
import 'package:messenger/Getx/get_otp.dart';
import '../../res/Assets/image_assets.dart';

class Otp extends StatelessWidget {
  final String verificationId;

  Otp({super.key, required this.verificationId});

  final pin1 = TextEditingController();
  final pin2 = TextEditingController();
  final pin3 = TextEditingController();
  final pin4 = TextEditingController();
  final pin5 = TextEditingController();
  final pin6 = TextEditingController();
  final controller=Get.put(OtpState());
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
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  ImageAssets.otp,
                  height: MediaQuery.sizeOf(context).height / 2.8,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Enter OTP",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 35),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("An 4 digit otp number has been sent to",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold)),
                const Text("+923054200605",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 54,
                      width: 54,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.1),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: TextFormField(
                          controller: pin1,
                          textAlign: TextAlign.center,
                          maxLength: 1,
                          keyboardType: TextInputType.number,
                          autofocus: true,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                              counterText: "",
                              border: InputBorder.none,
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(10))),
                          onSaved: (newValue) {},
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                        ),
                      ),
                    ),
                    Container(
                      height: 54,
                      width: 54,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.1),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: TextFormField(
                          controller: pin2,
                          textAlign: TextAlign.center,
                          maxLength: 1,
                          keyboardType: TextInputType.number,
                          autofocus: true,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                              counterText: "",
                              border: InputBorder.none,
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(10))),
                          onSaved: (newValue) {},
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                        ),
                      ),
                    ),
                    Container(
                      height: 54,
                      width: 54,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.1),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: TextFormField(
                          controller: pin3,
                          textAlign: TextAlign.center,
                          maxLength: 1,
                          keyboardType: TextInputType.number,
                          autofocus: true,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                              counterText: "",
                              border: InputBorder.none,
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(10))),
                          onSaved: (newValue) {},
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                        ),
                      ),
                    ),
                    Container(
                      height: 54,
                      width: 54,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.1),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: TextFormField(
                          controller: pin4,
                          textAlign: TextAlign.center,
                          maxLength: 1,
                          keyboardType: TextInputType.number,
                          autofocus: true,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                              counterText: "",
                              border: InputBorder.none,
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(10))),
                          onSaved: (newValue) {},
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                        ),
                      ),
                    ),
                    Container(
                      height: 54,
                      width: 54,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.1),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: TextFormField(
                          controller: pin5,
                          textAlign: TextAlign.center,
                          maxLength: 1,
                          keyboardType: TextInputType.number,
                          autofocus: true,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                              counterText: "",
                              border: InputBorder.none,
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(10))),
                          onSaved: (newValue) {},
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                        ),
                      ),
                    ),
                    Container(
                      height: 54,
                      width: 54,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.1),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: TextFormField(
                          controller: pin6,
                          textAlign: TextAlign.center,
                          maxLength: 1,
                          keyboardType: TextInputType.number,
                          autofocus: true,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                              counterText: "",
                              border: InputBorder.none,
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(10))),
                          onSaved: (newValue) {},
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    "00:59",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 60,
                      width: 150,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                        child: Text(
                          "Resend",
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        FirebaseService.verifyOtp(
                            pin1.text.toString() +
                                pin2.text.toString() +
                                pin3.text.toString() +
                                pin4.text.toString() +
                                pin5.text.toString() +
                                pin6.text.toString(),
                            verificationId,controller);
                      },
                      child: Container(
                        height: 60,
                        width: 150,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10)),
                        child: Obx(() => controller.isPress.value?
                             const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 15,width: 15,child: CircularProgressIndicator(color: Colors.white,),),
                              SizedBox(width: 10,),
                              Center(
                                child: Text(
                                  "Verifying",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                          ],
                        )
                           :  const Center(
                          child: Text(
                            "Verify",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),)
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
