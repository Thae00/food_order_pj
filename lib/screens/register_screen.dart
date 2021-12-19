import 'package:flutter/material.dart';
import 'package:food_order_pj/auth/auth.dart';
import 'package:food_order_pj/auth/login_status.dart';
import 'package:food_order_pj/screens/home.dart';
import 'package:food_order_pj/screens/login_screen.dart';
import 'package:food_order_pj/screens/palette.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final key = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Palette.bgColor,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Center(
                    child: Text(
                      'Register Account',
                      style: TextStyle(
                        color: Palette.titleColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'To all special discounts and more\n become a member!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Palette.showColor,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Palette.boxColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Form(
                                key: key,
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            width: 1,
                                            color: Palette.titleColor,
                                          ),
                                        ),
                                      ),
                                      child: TextFormField(
                                        style: TextStyle(color: Palette.speciColor),
                                        controller: nameController,
                                        validator: (val) {
                                          if (val == null || val.isEmpty) {
                                            return 'Name Must not Empty';
                                          }
                                        },
                                        decoration: InputDecoration(
                                          hintText: "Enter Your Name",
                                          hintStyle: TextStyle(color: Palette.titleColor),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            width: 1,
                                            color: Palette.titleColor,
                                          ),
                                        ),
                                      ),
                                      child: TextFormField(
                                        style: TextStyle(color: Palette.speciColor),
                                        controller: emailController,
                                        validator: (val) {
                                          if (val == null || val.isEmpty) {
                                            return 'Email Must not Empty';
                                          }
                                        },
                                        decoration: InputDecoration(
                                          hintText: "Enter Your Email",
                                          hintStyle: TextStyle(color: Palette.titleColor),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            width: 1,
                                            color: Palette.titleColor,
                                          ),
                                        ),
                                      ),
                                      child: TextFormField(
                                        style: TextStyle(color: Palette.speciColor),
                                        controller: passwordController,
                                        validator: (val) {
                                          if (val == null || val.isEmpty) {
                                            return 'Password must Not Empty';
                                          }
                                        },
                                        decoration: InputDecoration(
                                          hintText: "Enter Your Password",
                                          hintStyle: TextStyle(color: Palette.titleColor),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                                },
                                child: Text('If you have account, please Login', style: TextStyle(color: Palette.priceColor),),
                              ),
                              Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width * 0.35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Palette.speciColor,
                                ),
                                child: OutlinedButton(
                                  onPressed: () async {
                                    if (key.currentState!.validate()) {
                                     Map<String,dynamic> status = await Auth().register(emailController.text, passwordController.text);
                                     if(status['status']){
                                       Provider.of<LoginStatus>(context, listen: false).setStatus(true);
                                       Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
                                     }
                                    }
                                  },
                                  child: Text(
                                    'Register',
                                    style: TextStyle(
                                      color: Palette.titleColor,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
