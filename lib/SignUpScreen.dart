import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truckman/EditTextUtils.dart';
import 'ConstColor.dart';
import 'CustomTextStyle.dart';

class SignUp extends StatefulWidget  {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Second Route'),
      // ),
        body: SingleChildScrollView(
          child : Padding(
            padding: const EdgeInsets.only(left: 15,right: 15,bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 70.0,
                ),
                Text("Sign Up", style: CustomTextStyle.textBold24),
                SizedBox(
                  height: 20.0,
                ),
                Text("Hello, welcome login to your account", style: CustomTextStyle.textNormal16),
                SizedBox(
                  height: 20.0,
                ),
                Text("Name", style: CustomTextStyle.textbold16Black),
                SizedBox(
                  height: 10.0,
                ),
                EditTextUtils(hintText: "Enter Name...") ,
                SizedBox(
                  height: 20.0,
                ),
                Text("Mobile Number", style: CustomTextStyle.textbold16Black),
                SizedBox(
                  height: 10.0,
                ),
                EditTextUtils(hintText: "Enter mobile number..."),
                SizedBox(
                  height: 20.0,
                ),
                Text("Vehicle  Number", style: CustomTextStyle.textbold16Black),
                SizedBox(
                  height: 10.0,
                ),
                EditTextUtils(hintText: "Enter vehicle  number..."),
                SizedBox(
                  height: 20.0,
                ),
                Text("Vahicle RC", style: CustomTextStyle.textbold16Black),
                SizedBox(
                  height: 10.0,
                ),
                EditTextUtils(hintText: '').roundedRectBorderWidget(),
                SizedBox(
                  height: 20.0,
                ),
                Text("TDS", style: CustomTextStyle.textbold16Black),
                SizedBox(
                  height: 10.0,
                ),
                EditTextUtils(hintText: '').roundedRectBorderWidget(),
                SizedBox(
                  height: 20.0,
                ),
                Text("Pan Card", style: CustomTextStyle.textbold16Black),
                SizedBox(
                  height: 10.0,
                ),
                EditTextUtils(hintText: '').roundedRectBorderWidget(),
                SizedBox(
                  height: 20.0,
                ),
                Text("Acc No.", style: CustomTextStyle.textbold16Black),
                SizedBox(
                  height: 10.0,
                ),
                EditTextUtils(hintText: "Enter Acc number...."),
                SizedBox(
                  height: 20.0,
                ),
                Text("Cancel Cheque", style: CustomTextStyle.textbold16Black),
                SizedBox(
                  height: 10.0,
                ),
                EditTextUtils(hintText: '').roundedRectBorderWidget(),
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: MaterialButton(
                      height: 58,
                      minWidth: 300,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      onPressed: () {
                      },
                      color: ColorSelect.buttonColorBlue,
                      child: const Text(
                        "Register",
                        style: CustomTextStyle.textBold16White,
                      )),
                ),
              ],
            ),
          ),
        )

    );
  }
}
