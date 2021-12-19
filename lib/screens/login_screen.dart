import 'package:flutter/material.dart';
import 'package:food_order_pj/auth/auth.dart';
import 'package:food_order_pj/auth/login_status.dart';
import 'package:food_order_pj/main.dart';
import 'package:food_order_pj/screens/palette.dart';
import 'package:food_order_pj/screens/register_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final key = GlobalKey<FormState>();
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
                      'Login Account',
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
                    'Welcome back, Login to continue',
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
                                      height: 20,
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
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
                                },
                                child: Text('Create New Account', style: TextStyle(color: Palette.priceColor),),
                              ),
                              Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width * 0.4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Palette.speciColor,
                                ),
                                child: OutlinedButton(
                                  onPressed: () async {
                                    if (key.currentState!.validate()) {
                                      Map<String,dynamic> result = await Auth().login(emailController.text, passwordController.text);
                                      if(result['status']){
                                        Provider.of<LoginStatus>(context, listen: false).setStatus(true);
                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyApp()));
                                      }
                                    }
                                  },
                                  child: Text(
                                    'Login',
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
