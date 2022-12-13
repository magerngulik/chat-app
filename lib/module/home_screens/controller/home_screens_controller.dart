import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fhe_template/core.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomeScreensController extends GetxController {
  HomeScreensView? view;
  Color color1 = const Color(0xff272A35);
  Color color2 = const Color(0xff373E4E);
  var statusChat = false;

  LoginScreensController loginPage = Get.find();

  var pesan = TextEditingController();

  doChat() async {
    if (pesan.text.isEmpty) {
      return;
    }

    await FirebaseFirestore.instance.collection("chat").add({
      "pesan": pesan.text,
      "id": loginPage.uidUser,
      "username": loginPage.uidUsername,
      "time": DateTime.now()
    });
    pesan.text = "";
  }

  doDeleteAll() async {
    var snapshot = await FirebaseFirestore.instance.collection("chat").get();
    for (var i = 0; i < snapshot.docs.length; i++) {
      await FirebaseFirestore.instance
          .collection("chat")
          .doc(snapshot.docs[i].id)
          .delete();
    }
  }
}
