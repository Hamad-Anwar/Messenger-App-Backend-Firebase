import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messenger/Getx/get_home.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

import '../chat_screen.dart';
class HomePage extends StatefulWidget {
   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeState controller=Get.put(HomeState());

  final search=TextEditingController();

  final String number='0${FirebaseAuth.instance.currentUser!.phoneNumber!.substring(3,13)}';

  @override
  Widget build(BuildContext context) {
    controller.getUrl();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Chats",style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),),
                  Icon(Icons.linear_scale_outlined,color: Colors.grey,)
                ],
              ),
            ),
            Container(
              height: 40,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: TextFormField(
                  controller: search,
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                  onChanged: (value) {
                    setState(() {

                    });
                  },
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 10),
                      hintText: "Search",
                      border: InputBorder.none,
                      icon: Icon(CupertinoIcons.search,color: Colors.grey,)
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              children: [
                const SizedBox(width: 30,),
                Icon(Icons.history_toggle_off_outlined,color: Colors.grey.withOpacity(.5),),
                const SizedBox(width: 10,),
                const Text("Stories",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),)
              ],
            ),
            const SizedBox(height: 10,),
            SizedBox(
              height: 80,
              child: Row(
                children: [
                  const SizedBox(width: 20,),
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(.1),
                      borderRadius: BorderRadius.circular(70)
                    ),
                    child: Stack(
                      children: [
                        Obx(() =>
                            CachedNetworkImage(imageUrl: controller.url.value,
                          imageBuilder: (context, imageProvider) {
                            return CircleAvatar(
                              radius: 40,
                              backgroundImage:  imageProvider,
                            );
                          },
                        )),
                        const Positioned(
                          right: 1,
                            bottom: 1,
                            child: CircleAvatar(
                              radius: 9,
                              backgroundColor: Colors.red,
                              child: Center(
                                child: Icon(Icons.add,color: Colors.white,size: 15,),
                              ),
                            ))
                      ],
                    )
                  )
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              children: [
                const SizedBox(width: 30,),
                Icon(Icons.message_outlined,color: Colors.grey.withOpacity(.5),),
                const SizedBox(width: 10,),
                const Text("All Messages",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),)
              ],
            ),
            const SizedBox(height: 10,),
            Expanded(child:
                FirebaseAnimatedList(
                  query: FirebaseDatabase.instance.ref('Accounts').child(number).child('Chat'),
                  itemBuilder: (context, snapshot, animation, index) {
                    if(search.text.isEmpty){
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                        child: InkWell(
                          onTap: () {
                            Get.to(ChatScreen(receiverNumber: snapshot.child('phoneNumber').value.toString(), url:
                            snapshot.child('url').value.toString()
                                , receiverName: snapshot.child('name').value.toString()));
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CachedNetworkImage(imageUrl: snapshot.child('url').value.toString(),
                                placeholder: (context, url) {
                                  return const Center(
                                    child: SizedBox(
                                      height: 15,
                                      width: 15,
                                      child: CircularProgressIndicator(color: Colors.deepOrangeAccent,),
                                    ),
                                  );
                                },
                                imageBuilder: (context, imageProvider) {
                                  return Card(
                                    margin: EdgeInsets.zero,
                                    elevation: 5,
                                    color: Colors.deepOrangeAccent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(70)
                                    ),
                                    child: CircleAvatar(
                                      radius: 25,
                                      backgroundImage: imageProvider,
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(snapshot.child('name').value.toString(),style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                  Text(snapshot.child('latestMessage').value.toString(),style: const TextStyle(fontSize: 11,color: Colors.grey),),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Text("Online",style: TextStyle(color: Colors.greenAccent,fontWeight: FontWeight.bold,fontSize: 10),),
                                  const SizedBox(height: 2,),
                                  CircleAvatar(
                                    radius: 8,
                                    backgroundColor: Colors.greenAccent,
                                    child: Center(child: Text(index.toString(),style: const TextStyle(color: Colors.white,fontSize: 10),)),
                                  )
                                ],
                              ),
                              const SizedBox(width: 20,)
                            ],
                          ),
                        ),
                      );
                    }else if(snapshot.child('phoneNumber').value.toString().contains(search.text.toString())){
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                        child: InkWell(
                          onTap: () {
                            Get.to(ChatScreen(receiverNumber: snapshot.child('phoneNumber').value.toString(), url:
                            snapshot.child('url').value.toString()
                                , receiverName: snapshot.child('name').value.toString()));
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CachedNetworkImage(imageUrl: snapshot.child('url').value.toString(),
                                placeholder: (context, url) {
                                  return const Center(
                                    child: SizedBox(
                                      height: 15,
                                      width: 15,
                                      child: CircularProgressIndicator(color: Colors.deepOrangeAccent,),
                                    ),
                                  );
                                },
                                imageBuilder: (context, imageProvider) {
                                  return Card(
                                    margin: EdgeInsets.zero,
                                    elevation: 5,
                                    color: Colors.deepOrangeAccent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(70)
                                    ),
                                    child: CircleAvatar(
                                      radius: 25,
                                      backgroundImage: imageProvider,
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(snapshot.child('name').value.toString(),style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                  Text(snapshot.child('latestMessage').value.toString(),style: const TextStyle(fontSize: 11,color: Colors.grey),),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Text("Online",style: TextStyle(color: Colors.greenAccent,fontWeight: FontWeight.bold,fontSize: 10),),
                                  const SizedBox(height: 2,),
                                  CircleAvatar(
                                    radius: 8,
                                    backgroundColor: Colors.greenAccent,
                                    child: Center(child: Text(index.toString(),style: const TextStyle(color: Colors.white,fontSize: 10),)),
                                  )
                                ],
                              ),
                              const SizedBox(width: 20,)
                            ],
                          ),
                        ),
                      );
                    }else{
                      return Container();
                    }
                  },
                )
            ),
          ],
        ),


      ),
    );
  }
}
