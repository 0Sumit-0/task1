import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:interviewtask/HelperFunction.dart';

class SignUpPage1 extends StatefulWidget {
  const SignUpPage1({Key? key}) : super(key: key);

  @override
  State<SignUpPage1> createState() => _SignUpPage1State();
}

class _SignUpPage1State extends State<SignUpPage1> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _textEditingController = TextEditingController();

  void moveForward(String msg) {
    if (_formKey.currentState!.validate()) {
      Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  bool isEmailValid(String email) {
    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 10, 1, 1),
      body: Row(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: ClipPath(
                clipper: CustomBackOne(openbar: true),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(1, 23, 6, 1),
                    borderRadius: BorderRadius.circular(5),
                    shape: BoxShape.rectangle,
                  ),
                  width: 20,
                  height: 400,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Center(
                child: ClipPath(
                  clipper: CustomBackOne(),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 340,
                    height: 585,
                  ),
                ),
              ),
              // SizedBox(width: 20,),
              Center(
                child: ClipPath(
                  clipper: CustomBackTwo(),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(1, 23, 6, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 315,
                    height: 570,
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  width: 315,
                  height: 570,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: ClipPath(
                          clipper: CustomBackThree(),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.black87,
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: Colors.red, width: 2)),
                            width: 315,
                            height: 100,
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  "Password Reset",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Stack(
                        children: [
                          ClipPath(
                            clipper: CustomShape(),
                            child: Container(
                              height: 120,
                              width: 120,
                              decoration: const BoxDecoration(
                                  color: Colors.black45,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black54,
                                      offset: Offset(4, 4),
                                      blurRadius: 15,
                                      spreadRadius: 1,
                                    ),
                                    BoxShadow(
                                      color: Colors.white24,
                                      offset: Offset(-4, -4),
                                      blurRadius: 15,
                                      spreadRadius: 1,
                                    )
                                  ]),
                            ),
                          ),
                          ClipPath(
                            clipper: CustomShape(),
                            child: Container(
                              height: 110,
                              width: 110,
                              decoration: const BoxDecoration(
                                  color: Colors.black26,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black54,
                                      offset: Offset(4, 4),
                                      blurRadius: 15,
                                      spreadRadius: 1,
                                    ),
                                    BoxShadow(
                                      color: Colors.black26,
                                      offset: Offset(-4, -4),
                                      blurRadius: 15,
                                      spreadRadius: 1,
                                    )
                                  ]),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10,),
                      const SizedBox(
                          height: 65,
                          width: 250,
                          child: Text(
                            "Enter the Email id associated with your account and we will send a new password to your email",
                            softWrap: true,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400,color: Colors.white10),
                          )),

                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        textEditingController: _textEditingController,
                        formkey: _formKey,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CustomButtonWidget(
                              reverse: true,
                              textval: "Cancel",
                              boxcolor: Colors.white),
                          const SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            child: const CustomButtonWidget(
                                textval: "Reset", boxcolor: Colors.red),
                            onTap: () {
                              final email = _textEditingController.text;
                              final isValid = isEmailValid(email);
                              setState(() {
                                isValid
                                    ? moveForward("Successful")
                                    : moveForward("Email not valid");
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final GlobalKey formkey;
  final TextEditingController textEditingController;

  const CustomTextField(
      {Key? key, required this.textEditingController, required this.formkey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 315,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formkey,
          child: TextFormField(
            controller: textEditingController,
            style: const TextStyle(color: Colors.white54),
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(16),
                fillColor: Colors.white54,
                isDense: true,
                suffixIcon: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8),
                      color: CupertinoColors.systemRed),
                  child: const Icon(
                    Icons.restart_alt_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: CupertinoColors.systemRed, width: 3)),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2)),
                focusedBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: CupertinoColors.systemRed, width: 3)),
                hintText: "Type email id"),
          ),
        ),
      ),
    );
  }
}
