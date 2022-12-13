import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../controller/home_screens_controller.dart';
import 'package:fhe_template/core.dart';
import 'package:get/get.dart';

class HomeScreensView extends StatelessWidget {
  const HomeScreensView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreensController>(
      init: HomeScreensController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          backgroundColor: const Color(0xff292F3F),
          appBar: AppBar(
            backgroundColor: const Color(0xff0E181E),
            title: const Text("Chat Grup"),
            actions: [
              IconButton(
                onPressed: () {
                  controller.doDeleteAll();
                },
                icon: const Icon(
                  Icons.delete,
                  size: 24.0,
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.85,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.75,
                      child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection("chat")
                            .orderBy("time", descending: false)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) return const Text("Error");
                          if (snapshot.data == null) return Container();
                          if (snapshot.data!.docs.isEmpty) {
                            return const Center(
                              child: Text(
                                "Belum ada chat",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            );
                          }
                          final data = snapshot.data!;
                          return ListView.builder(
                            itemCount: data.docs.length,
                            itemBuilder: (context, index) {
                              var item = data.docs[index];

                              if (item['id'] == controller.loginPage.uidUser) {
                                controller.statusChat == true;
                              }
                              print(
                                  "user: ${item['id'].toString()} sekarang: ${controller.loginPage.uidUser.toString()} ");

                              print(controller.statusChat);

                              return Card(
                                color:
                                    (item['id'] == controller.loginPage.uidUser)
                                        ? controller.color1
                                        : controller.color2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Container(
                                  height: 50,
                                  margin: (item['id'] ==
                                          controller.loginPage.uidUser)
                                      ? const EdgeInsets.only(
                                          left: 20.0,
                                        )
                                      : const EdgeInsets.only(
                                          right: 20.0,
                                        ),
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12.0),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: (item['id'] ==
                                            controller.loginPage.uidUser)
                                        ? CrossAxisAlignment.start
                                        : CrossAxisAlignment.end,
                                    children: [
                                      const SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        "${item['username']}",
                                        style: const TextStyle(
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5.0,
                                      ),
                                      Row(
                                        mainAxisAlignment: (item['id'] ==
                                                controller.loginPage.uidUser)
                                            ? MainAxisAlignment.start
                                            : MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            "${item['pesan']}",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Container(
                      height: 80.0,
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            16.0,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 250,
                            padding: const EdgeInsets.all(12),
                            margin: const EdgeInsets.only(),
                            child: TextFormField(
                              controller: controller.pesan,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                              decoration: const InputDecoration(
                                labelStyle: TextStyle(
                                  color: Colors.white,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              onChanged: (value) {},
                            ),
                          ),
                          Container(
                            width: 60,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  16.0,
                                ),
                              ),
                            ),
                            child: Container(
                              height: 60.0,
                              width: 60,
                              decoration: const BoxDecoration(
                                color: Color(0xff373E4E),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    16.0,
                                  ),
                                ),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  controller.doChat();
                                },
                                icon: const Icon(
                                  Icons.send,
                                  size: 24.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
