import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fhe_template/core.dart';
import 'package:get/get.dart';

class RegisterScreensView extends StatelessWidget {
  const RegisterScreensView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterScreensController>(
      init: RegisterScreensController(),
      builder: (controller) {
        controller.view = this;

        return SafeArea(
            child: Form(
          key: controller.formKey,
          child: Scaffold(
            backgroundColor: Colors.black,
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(10.0),
              child: ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 50.0,
                      ),
                      Text("Chat Skuy",
                          style: GoogleFonts.rubik(
                            fontSize: 24.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )),
                      Text("chating dengan happy",
                          style: GoogleFonts.inter(
                            fontSize: 14.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          )),
                      const SizedBox(
                        height: 100.0,
                      ),
                      Text("Register",
                          style: GoogleFonts.roboto(
                            fontSize: 32.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          )),
                      Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Username tidak boleh kosong';
                            }
                            return null;
                          },
                          maxLength: 20,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          controller: controller.username,
                          decoration: const InputDecoration(
                              labelText: 'Username',
                              labelStyle: TextStyle(
                                color: Colors.white,
                              ),
                              suffixIcon: Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              )),
                          onChanged: (value) {},
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(),
                        child: TextFormField(
                          controller: controller.email,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Email tidak boleh kosong';
                            }
                            return null;
                          },
                          maxLength: 20,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                            suffixIcon: Icon(
                              Icons.email,
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
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(),
                        child: TextFormField(
                          controller: controller.password,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password tidak boleh kosong';
                            }
                            return null;
                          },
                          maxLength: 20,
                          obscureText: true,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                            suffixIcon: Icon(
                              Icons.password,
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
                      SizedBox(
                        width: 300,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff334155),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          onPressed: () {
                            if (controller.formKey.currentState!.validate()) {
                              controller.doRegister();
                            }
                          },
                          child: (controller.isLoading == true)
                              ? const CircularProgressIndicator()
                              : const Text("Register"),
                        ),
                      ),
                      const SizedBox(
                        height: 42.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Sudah punya akun?",
                              style: GoogleFonts.roboto(
                                fontSize: 14.0,
                                color: const Color(0xff94A3B8),
                                fontWeight: FontWeight.w400,
                              )),
                          InkWell(
                            onTap: () {
                              Get.off(LoginScreensView());
                            },
                            child: Text(" Login Sekarang",
                                style: GoogleFonts.roboto(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
      },
    );
  }
}
