import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:fhe_template/core.dart';
import 'package:get/get.dart';

class LoginScreensView extends StatelessWidget {
  const LoginScreensView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey1 = GlobalKey<FormState>();
    return GetBuilder<LoginScreensController>(
      init: LoginScreensController(),
      builder: (controller) {
        controller.view = this;

        return SafeArea(
          child: Form(
            key: formKey1,
            child: Scaffold(
              backgroundColor: Colors.black,
              body: Container(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 100.0,
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
                        height: 192.0,
                      ),
                      Text("Login",
                          style: GoogleFonts.roboto(
                            fontSize: 32.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          )),
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
                          keyboardType: TextInputType.emailAddress,
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
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          maxLength: 20,
                          obscureText: true,
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
                            if (formKey1.currentState!.validate()) {
                              controller.doLogin();
                            }
                          },
                          child: const Text("Login"),
                        ),
                      ),
                      const SizedBox(
                        height: 42.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have account?",
                              style: GoogleFonts.roboto(
                                fontSize: 14.0,
                                color: const Color(0xff94A3B8),
                                fontWeight: FontWeight.w400,
                              )),
                          InkWell(
                            onTap: () {
                              Get.to(const RegisterScreensView());
                            },
                            child: Text(" Create Now",
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
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
