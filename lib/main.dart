import 'package:flutter/material.dart';
import 'package:grpctest/services/hello_service.dart';

void main() => runApp(new FlutterGrpcApp());

class FlutterGrpcApp extends StatefulWidget {
  _FlutterGrpcAppState createState() => _FlutterGrpcAppState();
}

class _FlutterGrpcAppState extends State<FlutterGrpcApp> {
  String res;

  @override
  void initState() {
    res = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Grpc ❤️ Flutter"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                  onPressed: () async => _sayHello(),
                  color: Colors.purpleAccent,
                  child: Text(
                    "Click to connect",
                    style: TextStyle(color: Colors.white),
                  )),
              res.isNotEmpty
                  ? Text("Server says: $res")
                  : Text('No connection !'),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _sayHello() async {
    var hello = await HelloService.SayHello();
    setState(() {
      res = hello.toString();
    });
  }
}
