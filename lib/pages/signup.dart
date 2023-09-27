import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:interviewtask/HelperFunction.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _textEditingController = TextEditingController();
  bool isImagePicked = false;
  PlatformFile? pickedFile;

  late AnimationController _buttonScaleController;
  late Animation<double> _buttonScaleAnimation;

  @override
  void initState() {
    super.initState();
    _buttonScaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _buttonScaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(_buttonScaleController);
  }

  @override
  void dispose() {
    _buttonScaleController.dispose();
    super.dispose();
  }

  Future upload() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png'],
    );

    if (result != null) {
      setState(() {
        pickedFile = result.files.first;
        if (pickedFile!.size <= 5 * 1024 * 1024) {
          isImagePicked = true;
        }
      });
    } else {
      isImagePicked = false;
    }
  }

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
            width: 10,
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
                                  "Upload Your Image",
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
                            clipper: CustomLogoFrame(),
                            child: Container(
                              width: 120,
                              height: 120,
                              color: Colors.white,
                            ),
                          ),
                          InkWell(
                            onTap: upload,
                            child: ClipPath(
                              clipper: CustomLogoFrame(inner: true),
                              child: Container(
                                width: 120,
                                height: 120,
                                color: Colors.black,
                                child: isImagePicked
                                    ? Image.file(
                                        File(pickedFile!.path!),
                                        width: double.infinity,
                                        fit: BoxFit.fitHeight,
                                      )
                                    : null,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
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
                          formkey: _formKey),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 180,
                        child: Center(
                          child: ElevatedButton(
                              onPressed: null,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black87,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero),
                              ),
                              child: const Center(
                                child: Text(
                                  "GT ID: 4455AAA6",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 15),
                                ),
                              )),
                        ),
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
                            child: AnimatedBuilder(
                                animation: _buttonScaleController,
                                builder: (context, child) {
                                  return Transform.scale(
                                    scale: _buttonScaleAnimation.value,
                                    child: child,
                                  );
                                },
                                child: const CustomButtonWidget(
                                    textval: "Confirm", boxcolor: Colors.red)),
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
                fillColor: Colors.black,
                isDense: true,
                suffixIcon: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8),
                      color: CupertinoColors.activeGreen),
                  child: const Icon(
                    Icons.done_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                        color: CupertinoColors.activeGreen, width: 3)),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2)),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                        color: CupertinoColors.activeGreen, width: 3)),
                hintText: "abc@gmail.com"),
          ),
        ),
      ),
    );
  }
}
