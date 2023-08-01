import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messenger/Data/Netword/Firebase/firebase_services.dart';
import 'package:messenger/Getx/get_chatScreen.dart';
import 'package:messenger/res/Colors/colors.dart';
import 'package:messenger/res/const/const.dart';

class ChatScreen extends StatefulWidget {
  final String receiverNumber;
  final String url;
  final String receiverName;

  const ChatScreen(
      {Key? key,
      required this.receiverNumber,
      required this.url,
      required this.receiverName})
      : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseDatabase.instance.ref('Chats').child(number).child(widget.receiverNumber).onValue.listen((event) {
      scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 100),
          curve: Curves.bounceIn);
    });
  }


  var message = TextEditingController();
  final ChatState controller = Get.put(ChatState());
  final String senderNumber =
      '0${FirebaseAuth.instance.currentUser!.phoneNumber!.substring(3, 13)}';
  final scrollController=ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.zero,
              child: Container(
                height: 80,
                color: Colors.white,
                width: MediaQuery.sizeOf(context).width,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 30,
                    ),
                    Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60)),
                        child: Stack(
                          children: [
                            CachedNetworkImage(
                              imageUrl: widget.url,
                              imageBuilder: (context, imageProvider) {
                                return CircleAvatar(
                                  radius: 27,
                                  backgroundImage: imageProvider,
                                );
                              },
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                  height: 20,
                                  width: 20,
                                  margin: const EdgeInsets.only(bottom: 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  child: const Icon(
                                    Icons.circle,
                                    color: Colors.greenAccent,
                                    size: 15,
                                  )),
                            )
                          ],
                        )),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.receiverName,
                          style: const TextStyle(
                            color: CustomColors.darkBlur,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          "Online",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.call_rounded,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: Colors.grey,
                          size: 8,
                        ),
                        Icon(Icons.circle, color: Colors.grey, size: 8),
                        Icon(
                          Icons.circle,
                          color: Colors.grey,
                          size: 8,
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 30,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: FirebaseAnimatedList(
                  controller: scrollController,
                  defaultChild: const Center(
                    child: SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: Colors.orange,
                      ),
                    ),
                  ),
                  shrinkWrap: true,
                  query: FirebaseDatabase.instance
                      .ref('Chats')
                      .child(senderNumber)
                      .child(widget.receiverNumber),
                  itemBuilder: (context, snapshot, animation, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Stack(
                        children: [
                          Align(
                            alignment:
                                snapshot.child('sender').value.toString() ==
                                        senderNumber
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft,
                            child: snapshot.child('message').value.toString() ==
                                    'image__'
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                      margin: snapshot
                                                  .child('sender')
                                                  .value
                                                  .toString() ==
                                              senderNumber
                                          ? const EdgeInsets.only(left: 100)
                                          : const EdgeInsets.only(right: 100),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Container(
                                          padding: const EdgeInsets.all(3),
                                          color: snapshot
                                                      .child('sender')
                                                      .value
                                                      .toString() ==
                                                  senderNumber
                                              ?  Colors.grey.withOpacity(.1)
                                              : Colors.grey.withOpacity(.1),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: InkWell(
                                              child: CachedNetworkImage(

                                                placeholder: (context, url) {
                                                  return Container(
                                                    height:300,
                                                    color: Colors.white,
                                                    width: MediaQuery.sizeOf(context).width/2,
                                                    child: const Center(
                                                      child: SizedBox(
                                                        height: 15,
                                                        width: 15,
                                                        child: CircularProgressIndicator(color: Colors.deepOrange,),
                                                      ),
                                                    ),
                                                  );
                                                },
                                                errorWidget: (context, url, error) {
                                                  return Container(
                                                    color: Colors.white,
                                                    height: 300,
                                                    width: MediaQuery.sizeOf(context).width/2,
                                                    child: const Center(
                                                      child: SizedBox(
                                                        height: 15,
                                                        width: 15,
                                                        child: CircularProgressIndicator(color: Colors.deepOrange,),
                                                      ),
                                                    ),
                                                  );
                                                },
                                                imageUrl: snapshot.child('url').value.toString(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ))
                                : SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment: snapshot
                                                  .child('sender')
                                                  .value
                                                  .toString() ==
                                              senderNumber
                                          ? CrossAxisAlignment.end
                                          : CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                          decoration: BoxDecoration(
                                              color: snapshot
                                                          .child('sender')
                                                          .value
                                                          .toString() ==
                                                      senderNumber
                                                  ? Colors.lightBlue
                                                      .withOpacity(.3)
                                                  : Colors.grey.withOpacity(.1),
                                              borderRadius: const BorderRadius
                                                      .only(
                                                  topRight: Radius.circular(10),
                                                  topLeft: Radius.circular(10),
                                                  bottomLeft:
                                                      Radius.circular(10),
                                                  bottomRight: Radius.zero)),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                snapshot
                                                    .child('message')
                                                    .value
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14),
                                              ),
                                              const SizedBox(
                                                height: 4,
                                              ),
                                              Text(
                                                  snapshot
                                                      .child('time')
                                                      .value
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontSize: 10)),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Card(

              margin: EdgeInsets.zero,
              child: Container(
                  height: 70,
                  color: Colors.white,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      const Icon(
                        Icons.emoji_emotions_outlined,
                        color: Colors.greenAccent,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: TextFormField(
                        controller: message,
                        onChanged: (value) {
                          if (value.isEmpty) {
                            controller.isEmpty.value = true;
                          } else {
                            controller.isEmpty.value = false;
                          }
                        },
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: "Your message"),
                      )),

                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        key: UniqueKey(),
                        height: 50,
                        width: 100,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(.1),
                            borderRadius:
                            BorderRadius.circular(30)),
                        child:  Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () async{
                                FirebaseService.sendImage(senderNumber, widget.receiverNumber);
                                await Future.delayed(const Duration(milliseconds: 200));
                                scrollController.animateTo(
                                    scrollController.position.maxScrollExtent,
                                    duration: const Duration(milliseconds: 100),
                                    curve: Curves.bounceIn);
                              },
                              child: const Icon(
                                Icons.image_outlined,
                                color: Colors.black,
                              ),
                            ),
                            const Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Obx(() => AnimatedSwitcher(
                            duration: const Duration(milliseconds: 400),
                            child: controller.isEmpty.value
                                ? const CircleAvatar(
                              backgroundColor: Colors.greenAccent,
                              radius: 25,
                              child: Center(
                                child: Icon(
                                  CupertinoIcons.mic,
                                  color: Colors.white,
                                ),
                              ),
                            ) :InkWell(
                                onTap: () {
                                  FirebaseService.sendMessage(
                                      senderNumber,
                                      widget.receiverNumber,
                                      widget.receiverName,
                                      message.text.toString(),
                                      widget.url);
                                  FocusScope.of(context).unfocus();
                                  message.clear();
                                  scrollController.animateTo(
                                      scrollController.position.maxScrollExtent,
                                      duration: const Duration(milliseconds: 100),
                                      curve: Curves.bounceIn);
                                  controller.isEmpty.value=true;
                                },
                                child: const CircleAvatar(
                                  backgroundColor: Colors.greenAccent,
                                  radius: 25,
                                  child: Center(
                                    child: Icon(
                                      Icons.send_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                            ),
                          )),
                      const SizedBox(
                        width: 20,
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
