import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:http/http.dart' as http;
import 'package:kotha_new/apiService.dart';
import 'package:kotha_new/model/login_request_model.dart';
import 'package:kotha_new/pages/myHomepage.dart';
import 'package:kotha_new/pages/signup.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscureText = true;
  bool isAPIcallProcess = false;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff1d3b58),
                Color(0xff1d3b58),
              ],
              begin: Alignment.topLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 7,
                child: Form(
                  key: globalFormKey,
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(50, 130, 50, 0),
                      child: Column(
                        children: [
                          //email textfield starts
                          TextFormField(
                            controller: emailController,
                            cursorColor: const Color(0xff1d3b58),
                            style: const TextStyle(color: Color(0xff1d3b58)),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7.0),
                                borderSide: const BorderSide(
                                    color: Color(0xff1d3b58),
                                    width: 3.0,
                                    style: BorderStyle.solid),
                              ),
                              labelText: 'E-mail',
                              labelStyle:
                                  const TextStyle(color: Color(0xff1d3b58)),
                              hintText: 'jaminsampang@gmail.com',
                              focusColor: const Color(0xff1d3b58),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xff1d3b58),
                                ),
                              ),
                              prefixIcon: const Icon(
                                Icons.email,
                                color: Color(0xff1d3b58),
                              ),
                            ),
                          ),
                          //email textfield ends
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: passwordController,
                            obscureText: _obscureText,
                            cursorColor: const Color(0xff1d3b58),
                            style: const TextStyle(color: Color(0xff1d3b58)),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7.0),
                                borderSide: const BorderSide(
                                    color: Color(0xff1d3b58),
                                    width: 3.0,
                                    style: BorderStyle.solid),
                              ),
                              labelText: 'Password',
                              labelStyle:
                                  const TextStyle(color: Color(0xff1d3b58)),
                              hintText: 'Enter Your Password',
                              focusColor: const Color(0xff1d3b58),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xff1d3b58),
                                ),
                              ),
                              prefixIcon: const Icon(
                                Icons.key,
                                color: Color(0xff1d3b58),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(_obscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                                color: const Color(0xff1d3b58),
                              ),
                            ),
                          ),
                          //password textfield ends here
                          const SizedBox(
                            height: 3,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: GestureDetector(
                              onTap: (() => {}),
                              child: Text(
                                "Forget Password?",
                                style:
                                    (TextStyle(color: Colors.blueAccent[700])),
                              ),
                            ),
                          ),
                          //login button starts here
                          const SizedBox(
                            height: 53,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: TextButton(
                              onPressed: () async {
                                if (validateAndSave()) {
                                  setState(() {
                                    isAPIcallProcess = true;
                                  });
                                }

                                if (emailController.text.isEmpty ||
                                    passwordController.text.isEmpty) {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text("error"),
                                        content: const Text(
                                            "email or password cannot be empty"),
                                        actions: [
                                          TextButton(
                                            onPressed: (() {
                                              Navigator.of(context).pop();
                                            }),
                                            child: const Text("OK"),
                                          )
                                        ],
                                      );
                                    },
                                  );
                                  return;
                                }
                                LoginRequestModel model = LoginRequestModel(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                                bool isLoginSuccess =
                                    await APIService.login(model);
                                if (isLoginSuccess) {
                                  Navigator.pushReplacementNamed(
                                    (context),
                                    '/homepage',
                                  );
                                  // routes:
                                  // {
                                  //   Navigator.defaultRouteName;
                                  //   (context) => RoomCard();
                                  // }
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text("error"),
                                          content: const Text(
                                              "Invalid email or password"),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text("ok"))
                                          ],
                                        );
                                      });
                                }
                              },
                              //end of on pressed
                              style: TextButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  elevation: 2,
                                  backgroundColor: const Color(0xff1d3b58)),
                              child: const Text(
                                "Login",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                          //login button ends here4
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don't have account?",
                                style: TextStyle(color: Color(0xff1d3b58)),
                              ),
                              GestureDetector(
                                onTap: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Signup()))
                                },
                                child: Text(
                                  "SignUp Now",
                                  style:
                                      TextStyle(color: Colors.blueAccent[700]),
                                ),
                              )
                            ],
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
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  // void _navigateToHomePage(BuildContext context) {
  //   Navigator.pushNamed(context, '/homepage');
  // }
}
