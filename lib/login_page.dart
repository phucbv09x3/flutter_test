// ignore: avoid_web_libraries_in_flutter

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/img_bg.jpg"),
                      fit: BoxFit.cover)),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: <Widget>[
                    Text('Text test bottom status bar'),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          0, MediaQuery.of(context).size.height * 0.18, 0, 0),
                      child: Text(
                        'Bitcoin',
                        style: TextStyle(
                            fontSize: 48,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 2,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Card(
                            elevation: 30,
                            color: Colors.white12,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14)),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 18, 10, 0),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(10, 16, 10, 0),
                                    child: TextFormField(
                                      autofocus: false,
                                      decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white24,
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.red)),
                                          hintText: 'Email',
                                          prefixIcon: Icon(Icons.mail),
                                          labelText: 'Email'),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 18, 10, 0),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(10, 16, 10, 0),
                                    child: TextFormField(
                                      autofocus: false,
                                      decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white24,
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.red)),
                                          hintText: 'Password',
                                          prefixIcon: Icon(Icons.lock),
                                          labelText: 'Password'),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 18, 10, 0),
                                  child: Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 16, 10, 0),
                                      child: SizedBox(
                                        width: 200,
                                        height: 60,
                                        child: FlatButton(
                                          color: Colors.red,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                          child: Text(
                                            'Login',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 29),
                                          ),
                                          onPressed: () {
                                            _pushNavigator(context);
                                            // Navigator.push(
                                            //     context, MaterialPageRoute(builder: (context) => SecondMonitor()));
                                          },
                                        ),
                                      )),
                                ),
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }

}

void _showToast() {
  Fluttertoast.showToast(
      msg: 'This is Toast flutter',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIos: 1,
      backgroundColor: Colors.white24,
      textColor: Colors.red);
}

void _pushNavigator(context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => SecondMonitor()));
}


_makeGetRequest() async{
  String url="https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=5782b99a-b379-4222-8076-fde6da7a0cf7&start=1";
  Response response=await get(url);
  int code=response.statusCode;
  Map<String, String> headers = response.headers;
  String contentType = headers['content-type'];
  String json = response.body;

}
class SecondMonitor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: ListView.builder(itemBuilder: (context, i) {
        return Card(
          child: InkWell(
            onTap: _showToast,
            child: Text(
              i.toString(),
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
          ),
        );
      })),
    );
  }
}
