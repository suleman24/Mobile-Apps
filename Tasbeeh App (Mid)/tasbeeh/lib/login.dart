import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:tasbeeh/apphome.dart';

class login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loginsignup(),
    );
  }
}

class loginsignup extends StatefulWidget {
  @override
  loginsignupState createState() {
    return loginsignupState();
  }
}

class loginsignupState extends State<loginsignup>
    with SingleTickerProviderStateMixin {
  bool isLogin = true;
  late Animation<double> loginSize;
  late AnimationController loginController;
  late AnimatedOpacity opacityAnimation;
  Duration animationDuration = Duration(milliseconds: 270);

  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIOverlays([]);

    loginController =
        AnimationController(vsync: this, duration: animationDuration);

    opacityAnimation =
        AnimatedOpacity(opacity: 0.0, duration: animationDuration);
  }

  @override
  void dispose() {
    loginController.dispose();
    super.dispose();
  }
  final formkey = GlobalKey<FormState>();

  Widget _buildLoginWidgets() {
    return Container(
      padding: EdgeInsets.only(bottom: 62, top: 16),
      width: MediaQuery.of(context).size.width,
      height: loginSize.value,
      decoration: BoxDecoration(
          color: Color(0XFF2a3ed7),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(190),
              bottomRight: Radius.circular(190))),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: AnimatedOpacity(
          opacity: loginController.value,
          duration: animationDuration,
          child: GestureDetector(
            onTap: isLogin ? null : () {
              loginController.reverse();

              setState(() {
                isLogin = !isLogin;
              });
            },
            child: Container(
              child: Text(
                'LOG IN'.toUpperCase(),
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginComponents() {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Visibility(
            visible: isLogin,
            child: Padding(
              padding: const EdgeInsets.only(left: 42, right: 42),
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(32.0),
                      color: Colors.white,
                    ),
                    child: TextFormField(
                      style: TextStyle(color: Colors.blueAccent[900],),
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          hintText: 'Email',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(32))
                          )
                      ),
                      validator: EmailValidator(errorText: 'Format is not correct'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Container(
                      decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.circular(32.0),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        style: TextStyle(color: Colors.blueAccent[900],),
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.vpn_key),
                            hintText: 'Password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(32)))),
                        validator: RequiredValidator(errorText: 'Can`t be empty'),
                      ),
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 40,
                    margin: EdgeInsets.only(top: 32),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(50))
                    ),
                    child: Center(
                      child: GestureDetector(
                        onTap: (){

                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => apphome()));

                        },
                        child: Text(
                          'LOG IN',
                          style: TextStyle(color: Color(0XFF2a3ed7),
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }

  Widget _buildRegistercomponents() {
    return Padding(
      padding: EdgeInsets.only(
          left: 42,
          right: 42,
          top: 32,
          bottom: 32
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: Text(
              'Sign Up'.toUpperCase(),
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0XFF2a3ed7)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16, top: 16),
            child: TextField(
              style: TextStyle(color: Colors.black, height: 0.5),
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.man,
                  ),
                  hintText: 'Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32)))),
            ),
          ),
          TextField(
            style: TextStyle(color: Colors.black, height: 0.5),
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.email,
                ),
                hintText: 'Email',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32)))),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16, top: 16),
            child: TextField(
              style: TextStyle(color: Colors.black, height: 0.5),
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.vpn_key),
                  hintText: 'Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32)))),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: Container(
              width: 200,
              height: 40,
              margin: EdgeInsets.only(top: 32),
              decoration: BoxDecoration(
                  color: Color(0XFF2a3ed7),
                  borderRadius: BorderRadius.all(Radius.circular(50))
              ),
              child: Center(
                child: Text(
                  'SIGN UP',
                  style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ) ,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double _defaultLoginSize = MediaQuery.of(context).size.height / 1.6;

    loginSize = Tween<double>(begin: _defaultLoginSize, end: 200).animate(
        CurvedAnimation(parent: loginController, curve: Curves.linear));

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedOpacity(
              opacity: isLogin ? 0.0 : 1.0,
              duration: animationDuration,
              child: Container(child: _buildRegistercomponents()),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: isLogin && !loginController.isAnimating ? Colors.white : Colors.transparent,
              width: MediaQuery.of(context).size.width,
              height: _defaultLoginSize/1.5,
              child: Visibility(
                visible: isLogin,
                child: GestureDetector(
                  onTap: () {
                    loginController.forward();
                    setState(() {
                      isLogin = !isLogin;
                    });
                  },
                  child: Center(
                    child: Text(
                      'Sign Up'.toUpperCase(),
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0XFF2a3ed7),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          AnimatedBuilder(
            animation: loginController,
            builder: (context, child) {
              return _buildLoginWidgets();
            },
          ),
          Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/2,
                child: Center(child: _buildLoginComponents()),
              )
          )
        ],
      ),
    );
  }
}