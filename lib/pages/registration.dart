
import 'package:bar_council_main_admin/pages/otp.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../utils/constant.dart';
import '../widgets/main_fields.dart';
import 'login_admin.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {


  var datas;

  bool _obscurepassword = true;
  bool _obscureconfirmpassword = true;

  final useridkey = GlobalKey<FormState>();
  final phonekey = GlobalKey<FormState>();
  final passwordkey = GlobalKey<FormState>();
  final confirmpasswordkey = GlobalKey<FormState>();

  TextEditingController regNo = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  TextEditingController username = TextEditingController();

  String? _regNo;
  String? _phoneNumber;

  String? _password;
  String? _confirmpassword;

  String? _dob;
  String? _username;



  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    // double top = MediaQuery.of(context).padding.top;

    return Scaffold(

      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () {
          if (!FocusScope.of(context).hasPrimaryFocus) {
            FocusScope.of(context).unfocus();
          }
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: height / 2.5,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/net1.png'),
                      ),
                    ),
                  ),

                  Positioned(
                    top: height / 9,
                    left: 20,
                    child: const Text(
                      signuphint,
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Positioned(
                    top: height / 6,
                    left: 20,
                    child: const Text(
                      logsubtext,
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                        color: Color.fromRGBO(179, 179, 179, 1),
                        fontSize: 18,
                      ),
                    ),
                  ),

                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    TextFieldOne(
                      hinttext: userhint,
                      controller: username,
                      onchange: (value) {
                        setState(() {
                          _username = value;
                          debugPrint(_phoneNumber);
                        });
                      },
                      obsecuretxt: false,
                    ),
                    TextFieldOne(
                      hinttext: phonehint,
                      keytype: TextInputType.number,
                      controller: phone,
                      onchange: (value) {
                        setState(() {
                          _phoneNumber = value;
                          debugPrint(_phoneNumber);
                        });
                      },
                      obsecuretxt: false,
                    ),

                    TextFieldOne(
                      hinttext: passhint,
                      controller: password,
                      onchange: (value) {
                        setState(() {
                          _password = value;
                          debugPrint(_phoneNumber);
                        });
                      },
                      validator: (value) {},
                      obsecuretxt: _obscurepassword,
                      sufix: IconButton(
                        icon: Icon(
                          _obscurepassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurepassword = !_obscurepassword;
                          });
                        },
                      ),
                    ),
                    TextFieldOne(
                      hinttext: cpasshint,
                      controller: confirmpassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'confirm password is empty.';
                        }
                        return null;
                      },
                      onchange: (value) {
                        setState(() {
                          _confirmpassword = value;
                          debugPrint(_phoneNumber);
                        });
                      },
                      obsecuretxt: _obscureconfirmpassword,
                      sufix: IconButton(
                        icon: Icon(
                          _obscureconfirmpassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureconfirmpassword = !_obscureconfirmpassword;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: height * .03,
                    ),
                    SizedBox(
                      height: 60,
                      width: height,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(18.0))),
                          backgroundColor: MaterialStateProperty.all(button),
                        ),
                        // onPressed: () {
                        //   // uploadImage(_image!,_regNo!,_phoneNumber!,_password!);
                        //   sendOtp(_phoneNumber!);
                        //   print('$_regNo$_phoneNumber$_password');
                        //   // if (useridkey.currentState!.validate() ||
                        //   //     phonekey.currentState!.validate() ||
                        //   //     passwordkey.currentState!.validate() ||
                        //   //     confirmpasswordkey.currentState!.validate()) {
                        //   // verifyOtp(phoneNumber!);
                        //   // UploadImage();
                        //
                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (context) => OtpPage(),
                        //       ));
                        //
                        //   debugPrint('new');
                        //   // }
                        // },

                        onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const OtpPage(),));},

                        child: const Text(
                          signuphint,
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * .02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          alredyaccount,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: width * 0.025,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()));
                          },
                          child: Text(
                            loginhint,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: width * 0.03,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}