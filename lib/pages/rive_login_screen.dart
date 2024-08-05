import 'package:flutter/material.dart';
import 'package:rive/rive.dart' as rive;

class RiveLoginScreen extends StatefulWidget {
  const RiveLoginScreen({super.key});

  @override
  State<RiveLoginScreen> createState() => _RiveLoginScreenState();
}

class _RiveLoginScreenState extends State<RiveLoginScreen> {
  late rive.StateMachineController? stateMachineController;
  rive.SMIInput<bool>? isFocus;
  rive.SMIInput<bool>? IsPassword;
  rive.SMIInput<bool>? login_success;
  rive.SMIInput<bool>? login_fail;
  rive.SMIInput? eye_track;
  // Controllers for email and password text fields
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  bool _obscureText = true; // To toggle password visibility

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void isCheckField() {
    IsPassword?.change(false);
    isFocus?.change(true);
    eye_track?.change(0);
  }

  void moveEyeBall(value) {
    eye_track?.change(value.length.toDouble());
  }

  void hidePassword() {
    IsPassword?.change(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              const Color.fromARGB(255, 238, 148, 4),
              Color.fromARGB(255, 244, 225, 57),
              Colors.yellow[100]!
            ]
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 80,),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    "Login", 
                    style: TextStyle(
                      color: Colors.white, 
                      fontSize: 40, 
                      fontWeight: FontWeight.bold,
                      fontFamily: 'BanonkuRegular',
                    ),
                  ),
                  SizedBox(height: 0,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start, // Align items to the top
                    children: [
                      Expanded(
                        child: Text.rich( // Expand text to fill available space
                          TextSpan(
                            children: [
                              const TextSpan(
                                text: "Hey, enter your details to get sign in\nto your account </>.\n\nLet's try Locket Premium!",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  // fontFamily: 'BanonkuRegular',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Image.asset(
                        'assets/images/image.png',
                        width: 100,
                        height: 100,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
                ),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 120, 
                        child: rive.RiveAnimation.asset(
                          'assets/images/bunny_login.riv',
                          stateMachines: const ['State Machine 1'],
                          onInit: (artBoard) {
                            stateMachineController = rive.StateMachineController.fromArtboard(
                              artBoard, 
                              'State Machine 1' // It must be same as the state machine name in Rive
                            );
                            if (stateMachineController == null){
                              return;
                            }
                            artBoard.addController(stateMachineController!);
                            isFocus = stateMachineController?.findInput('isFocus');
                            IsPassword = stateMachineController?.findInput('IsPassword');
                            login_success = stateMachineController?.findInput('login_success');
                            login_fail = stateMachineController?.findInput('login_fail');
                            eye_track = stateMachineController?.findInput('eye_track');
                          },
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [BoxShadow(
                            color: Color.fromRGBO(229, 233, 3, 0.694),
                            blurRadius: 20,
                            offset: Offset(0, 2.5)
                          )]
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.yellow[200]!)),
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Form(
                                key: _formKey,
                                child: Column(children: [
                                  TextFormField(
                                    onChanged: moveEyeBall,
                                    onTap: isCheckField,
                                    controller: _emailController,
                                    decoration: InputDecoration(
                                      hintText: "Email",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                      prefixIcon: Icon(Icons.email, color: Colors.grey),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your email';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(height: 10,),
                                  TextFormField(
                                    onTap: hidePassword,
                                    controller: _passwordController,
                                    obscureText: _obscureText,
                                    decoration: InputDecoration(
                                      hintText: "Password",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                      prefixIcon: const Icon(Icons.lock, color: Colors.grey),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          _obscureText ? Icons.visibility : Icons.visibility_off,
                                          color: Colors.grey,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _obscureText = !_obscureText;
                                          });
                                        },
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your password';
                                      }
                                      return null;
                                    },
                                  ),
                                ],)
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40,),
                      Container(
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: 50),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: const Color.fromARGB(255, 233, 210, 3)
                        ),
                        child: Center(
                          child: InkWell(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                isFocus?.change(false);
                                IsPassword?.change(false);
                                login_success?.change(true);
                                login_fail?.change(false);
                              } else {
                                isFocus?.change(false);
                                IsPassword?.change(false);
                                login_success?.change(false);
                                login_fail?.change(true);
                              }
                            },
                            child: Text("Login ", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),
                      Text("© 2024 Designed by Nhattt", style: TextStyle(color: Colors.grey),)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
