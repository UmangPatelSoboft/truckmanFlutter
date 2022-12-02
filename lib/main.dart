import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:truckman/CustomTextStyle.dart';
import 'package:truckman/SignUpScreen.dart';
import 'package:truckman/models/TruckManModel/truckman.dart';
import 'package:truckman/models/TruckManModel/truckmanResponse.dart';
import 'package:truckman/utils/dio_client.dart';
import 'ConstColor.dart';
import 'package:otp_text_field/otp_field.dart';

import 'models/employee.dart';
import 'models/employeeResponse.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: Colors.white,
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  //for checkbox
  bool valuefirst = false;
  final DioClient _client = DioClient();

  //for toast
  bool showErrorMessage = false;
  bool valuesecond = false;

  //to change widget
  bool? isTruckManLoginSubmit;
  TruckManResponse? retrievedTruckManResponse;

//for tab bar selection
  int selectedTabIndex = 0;
  late TabController _tabController;

  //for validation
  final emailformKey = GlobalKey<FormState>();
  final pswdformKey = GlobalKey<FormState>();
  final mnumberformKey = GlobalKey<FormState>();
  final otpnumberformKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _pswdController = TextEditingController();
  final _mnumberController = TextEditingController();
  final _otpController = OtpFieldController();

  bool _isEmailValidated = false;
  bool _isPasswordValidated = false;
  bool _isMobileNumValidated = false;
  bool _isOtpNumValidated = false;

  //button pressed text changed
  bool login = false;
  bool confirm = false;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        selectedTabIndex = _tabController.index;
      });
    });
    // super.initState();
  }

  @override
  void dispose() {
    // super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   // Here we take the value from the MyHomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   title: const Text("LogIn"),
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 120.0,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10, bottom: 0, right: 20, top: 10),
              //apply padding to all four sides
              child: Text("Login Account", style: CustomTextStyle.textBold24),
            ),
            Row(
              children: const [
                Padding(
                  padding:
                  EdgeInsets.only(left: 10, bottom: 0, right: 20, top: 10),
                  child: Text("Hello, welcome login to your account",
                      style: CustomTextStyle.textNormal16),
                ),
              ],
            ),
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 25.0,
                    ),
                    //  Container(color:selectedTabIndex == 0 ?  ColorSelect.buttonColorBlue : ColorSelect.textLableColorBlack),
                    // give the tab bar a height [can change hheight to preferred height]
                    Container(
                      height: 60.0,
                      decoration: BoxDecoration(
                        color: ColorSelect.tabcolorBg,
                        borderRadius: BorderRadius.circular(
                          30.0,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TabBar(
                          controller: _tabController,
                          // give the indicator a decoration (color and border radius)
                          indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                30.0,
                              ),
                              color: Colors.white),
                          indicatorPadding:
                          const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                          labelPadding:
                          const EdgeInsets.only(left: 0, right: 0),
                          labelColor: ColorSelect.textLableColorBlack,
                          unselectedLabelColor: ColorSelect.buttonColorBlue,
                          tabs: [
                            // first tab [you can add an icon using the icon property]
                            const Tab(
                              child: Text(
                                "Employee",
                                style: CustomTextStyle.tabTextLable14,
                              ),
                            ),
                            // second tab [you can add an icon using the icon property]
                            const Tab(
                              child: Text(
                                "Truckman",
                                style: CustomTextStyle.tabTextLable14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    selectedTabIndex == 1
                        ? truckManLogin(selectedTabIndex)
                        : employeeLogin()
                    // tab bar view here
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Widget truckManLogin(int selectedTabIndex) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isTruckManLoginSubmit == true ? otpSubUI() :truckManSubLogin() ,
        SizedBox(
          height: 50,
        ),
        Center(
          child: MaterialButton(
            height: 58,
            minWidth: 300,
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            child: confirm
                ? Text("Confirm", style: CustomTextStyle.textBold16White)
                : Text("Login", style: CustomTextStyle.textBold16White),
            onPressed: () async {
                if (confirm != true) {
                  if (mnumberformKey.currentState!.validate() ||
                      _mnumberController.text.length == 10) {
                    if (valuefirst != true) {
                      if (showErrorMessage = true) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Accept terms and condition',
                              style: CustomTextStyle.textNormal16Black),
                          duration: const Duration(seconds: 3),
                          backgroundColor: ColorSelect.tabcolorBg,
                        ));
                      }
                    } else if (_mnumberController.text != '') {
                      TruckMan truckManSignIn = TruckMan(
                          mobileNumber: _mnumberController.text,
                          deviceToken: "String",
                          deviceType: "String",
                          uDID: "String",);
                      TruckManResponse? retrivedTruckMane =
                      await _client.TruckMan_SignIn(truckManSignIn);
                      //  isTruckManLoginSubmit = true;
                      if (retrivedTruckMane != null) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(retrivedTruckMane.message.toString(),
                              style: CustomTextStyle.textNormal16Black),
                          duration: const Duration(seconds: 3),
                          backgroundColor: ColorSelect.tabcolorBg,
                        ));
                      }
                      login = !login;
                      confirm = !confirm;
                      isTruckManLoginSubmit = true;
                      setState(() => showErrorMessage = false);
                    }
                    // isTruckManLoginSubmit = true;
                  }
                }  else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUp()),
                  );
                }
              // if(otpnumberformKey.currentState!.validate()){
              //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              //     content: Text('invalid',
              //         style: CustomTextStyle.textNormal16Black),
              //     duration: const Duration(seconds: 3),
              //     backgroundColor: ColorSelect.tabcolorBg,
              //   ));
              // }else{
              //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              //     content: Text('Validate',
              //         style: CustomTextStyle.textNormal16Black),
              //     duration: const Duration(seconds: 3),
              //     backgroundColor: ColorSelect.tabcolorBg,
              //   ));
              // }
              //  }
              // else {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => const SignUp()),
              //   );
              // }
            },
            color: ColorSelect.buttonColorBlue,
            // const Text(
            // "Login",
            // style: CustomTextStyle.textBold16White,
            // )
          ),
        ),
      ],
    );
  }

  Widget truckManSubLogin() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 10, bottom: 0, right: 20, top: 30.0),
          child: Text("Mobile", style: CustomTextStyle.textbold16Black),
        ),
        Padding(
          padding:
          const EdgeInsets.only(left: 10, bottom: 0, right: 20, top: 10),
          child: Form(
            key: mnumberformKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: TextFormField(
              validator: validateMobileNumber,
              onChanged: (val) {
                setState(() {
                  _isMobileNumValidated = true;
                });
              },
              controller: _mnumberController,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(0, 255, 255, 255),
                border: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: ColorSelect.textLableColorBlack),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: 'Enter mobile number',
                hintStyle: TextStyle(color: Colors.grey),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                      color: _isMobileNumValidated
                          ? Colors.green
                          : ColorSelect.textLableColorBlack),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                      color:
                      _isMobileNumValidated ? Colors.green : Colors.grey),
                ),
              ),
            ),
          ),
        ),
        Row(
          children: [
            const SizedBox(height: 75.0),
            Transform.scale(
              scale: 1.2,
              child: Checkbox(
                side: const BorderSide(
                  // ======> CHANGE THE BORDER COLOR HERE <======
                  color: Colors.black,
                ),
                checkColor: Colors.white,
                activeColor: ColorSelect.buttonColorBlue,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(3.0))),
                value: valuefirst,
                onChanged: (value) {
                  setState(() => valuefirst = value!);
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 0, bottom: 0, right: 0, top: 8),
              child: Text(
                "By continuing, you agree to our Terms and Conditions\nand Privacy Policy",
                style: CustomTextStyle.textNormal14Black,
              ),
            )
          ],
        ),
        SizedBox(
          height: 40,
        ),
      ],
    );
  }

  Widget otpSubUI() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 10, bottom: 0, right: 20, top: 50.0),
          child: Text(
            'OTP verification',
            style: CustomTextStyle.textBold24,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10, bottom: 0, right: 20, top: 10.0),
          child: Text(
            'Enter the code sent to +91 9878789845',
            style: CustomTextStyle.textNormal16,
          ),
        ),
        SizedBox(
          height: 25.0,
        ),
        Form(
          key: otpnumberformKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: OTPTextField(
            obscureText: false,
            length: 4,
            width: MediaQuery.of(context).size.width,
            fieldWidth: 60,
            style: CustomTextStyle.textNormal16Black,
            textFieldAlignment: MainAxisAlignment.spaceAround,
            fieldStyle: FieldStyle.underline,
            otpFieldStyle: OtpFieldStyle(
              focusBorderColor: _isOtpNumValidated
                  ? Colors.green
                  : ColorSelect.textLableColorBlack,
              borderColor: ColorSelect.textLableColorBlack,
              disabledBorderColor: ColorSelect.textLableColorBlack,
              enabledBorderColor: _isOtpNumValidated
                  ? Colors.green
                  : ColorSelect.textLableColorBlack,
              errorBorderColor: Colors.red,
            ),
            onChanged: (val) {
              setState(
                    () {
                  validateOtpNumber;
                  _isOtpNumValidated == true;
                },
              );
            },
            controller: _otpController,
            // onCompleted: (pin) {
            //   _isOtpNumValidated = true;
            // },
          ),
        ),
      ],
    );
  }

  Widget employeeLogin() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 10, bottom: 0, right: 20, top: 30.0),
          child: Text("Email", style: CustomTextStyle.textbold16Black),
        ),
        Padding(
          padding:
          const EdgeInsets.only(left: 10, bottom: 0, right: 20, top: 10),
          child: Form(
            key: emailformKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: TextFormField(
              validator: validateEmail,
              onChanged: (val) {
                setState(() {
                  _isEmailValidated = true;
                });
              },
              controller: _emailController,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(0, 255, 255, 255),
                border: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: ColorSelect.textLableColorBlack),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: 'Enter E-mail Address',
                hintStyle: TextStyle(color: Colors.grey),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                      color: _isEmailValidated
                          ? Colors.green
                          : ColorSelect.textLableColorBlack),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                      color: _isEmailValidated ? Colors.green : Colors.grey),
                ),
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10, bottom: 0, right: 20, top: 20.0),
          child: Text("Password", style: CustomTextStyle.textbold16Black),
        ),
        Padding(
          padding:
          const EdgeInsets.only(left: 10, bottom: 0, right: 20, top: 10),
          child: Form(
            key: pswdformKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: TextFormField(
              validator: validatePassword,
              onChanged: (val) {
                setState(() {
                  _isPasswordValidated = true;
                });
              },
              controller: _pswdController,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(0, 255, 255, 255),
                border: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: ColorSelect.textLableColorBlack),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: 'Enter password',
                hintStyle: TextStyle(color: Colors.grey),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                      color: _isPasswordValidated
                          ? Colors.green
                          : ColorSelect.textLableColorBlack),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                      color: _isPasswordValidated ? Colors.green : Colors.grey),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Center(
          child: MaterialButton(
              height: 58,
              minWidth: 300,
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              onPressed: () async {
                if (emailformKey.currentState!.validate() ||
                    pswdformKey.currentState!.validate()) {
                  if (_emailController.text != '' &&
                      _pswdController.text != '') {
                    Employee employeeSignIn = Employee(
                        email: _emailController.text,
                        password: _pswdController.text,
                        deviceToken: "String",
                        deviceType: "String",
                        uDID: "String",
                        iMEI: "String");
                    EmployeeResponse? retrivedEmployee =
                    await _client.Employee_SignIn(employeeSignIn);
                    if (retrivedEmployee != null) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Login Successfull !!',
                            style: CustomTextStyle.textNormal16Black),
                        duration: const Duration(seconds: 3),
                        backgroundColor: ColorSelect.tabcolorBg,
                      ));
                    }
                  }
                } else {
                  //  return null;
                  setState(() => showErrorMessage = false);
                }
              },
              color: ColorSelect.buttonColorBlue,
              child: const Text(
                "Login",
                style: CustomTextStyle.textBold16White,
              )),
        ),
      ],
    );
  }
}

//Validator Functions

String? validateEmail(String? email) {
  if (email == null || email.isEmpty) {
    return "* required";
  } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
    return "Invalid email";
  }
  return null;
}

String? validatePassword(String? pswd) {
  if (pswd == null || pswd.isEmpty) {
    return "* required";
  } else if (pswd.length < 3) {
    return "Invalid password";
  }
  return null;
}

String? validateMobileNumber(String? mnumber) {
  if (mnumber == null || mnumber.isEmpty) {
    return "* required";
  } else if (mnumber.length < 10 ||
      mnumber.length > 10 ||
      !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
          .hasMatch(mnumber)) {
    return "Invalid number";
  }
  return null;
}

String? validateOtpNumber(String? otp) {
  if (otp == null || otp.isEmpty) {
    return "* required";
  } else if (otp.length < 4) {
    return "Invalid Otp";
  }
  return null;
}