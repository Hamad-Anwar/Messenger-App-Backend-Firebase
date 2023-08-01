
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:messenger/View/chat_screen.dart';
class SearchUser extends StatelessWidget {
  const SearchUser({super.key});

  @override
  Widget build(BuildContext context) {
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
                  Text("Search",style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),),

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
                  enabled: false,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 10),
                      hintText: "Search",
                      border: InputBorder.none,
                      icon: Icon(CupertinoIcons.search,color: Colors.grey,)
                  ),
                ),
              ),
            ),
            Row(
              children: [
                const SizedBox(width: 30,),
                Icon(Icons.account_circle_outlined,color: Colors.grey.withOpacity(.5),),
                const SizedBox(width: 10,),
                const Text("All Users",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),)
              ],
            ),
            const SizedBox(height: 20,),
            Expanded(child:
            FirebaseAnimatedList(
              query: FirebaseDatabase.instance.ref('Accounts'),
              itemBuilder: (context, snapshot, animation, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
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
                              radius: 30,
                              backgroundImage: imageProvider,
                            ),
                          );
                        },
                        ),
                        const SizedBox(width: 20,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                           mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(snapshot.child('name').value.toString(),style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                            Text(snapshot.child('phoneNumber').value.toString(),style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: Colors.grey),),
                          ],
                        ),
                        Spacer(),
                        const Icon(Icons.send_outlined,color: Colors.blue,),
                        SizedBox(width: 20,)
                      ],
                    ),
                  ),
                );
              },
            )
            ),
          ],
        ),
      ),
    );
  }
}
