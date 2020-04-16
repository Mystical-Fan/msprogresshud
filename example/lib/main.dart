import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:msprogresshud/msprogresshud.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MSProgressHUD Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(top: 80),
      alignment: Alignment.center,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          FlatButton(
              onPressed: () {
            MSProgressHUD.showLoading(context);
          }, child: Text("showLoading"), color: Colors.blue),
          FlatButton(onPressed: () {
            MSProgressHUD.showLoading(context, message: "loading");
          }, child: Text("showLoadingMessage"), color: Colors.blue),
          FlatButton(onPressed: () {
            MSProgressHUD.showSuccess(context);
          }, child: Text("showSuccess"), color: Colors.blue),
          FlatButton(onPressed: () {
            MSProgressHUD.showSuccess(context, message: "success");
          }, child: Text("showSuccessMessage"), color: Colors.blue),
          FlatButton(onPressed: () {
            MSProgressHUD.showError(context);
          }, child: Text("showError"), color: Colors.blue),
          FlatButton(onPressed: () {
            MSProgressHUD.showError(context, message: "error");
          }, child: Text("showErrorMessage"), color: Colors.blue),
        ],
      ),
    );
  }
}
