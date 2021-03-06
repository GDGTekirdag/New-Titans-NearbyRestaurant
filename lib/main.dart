import 'package:flutter/material.dart';
import 'widgets.dart';
import 'staticMap.dart';
import 'apiClient.dart';

void main() {
  runApp(
    new MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  createState() => new MyAppState();
}

class MyAppState extends State<MyApp> {
  List data;
  StaticMap staticMap;
  ApiClient apiClient = new ApiClient();

  void initState() {
    this.setState(() {
      this.staticMap = new StaticMap(41.013371, 28.973882, 15, 3);
      apiClient.getInstance();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new FutureBuilder(
        future: apiClient.getInstance(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return new Text("Connection none");
            case ConnectionState.waiting:
              return new Scaffold(
                  body: new Center(
                    child: new CircularProgressIndicator(),
                  ));
            default:
              if (snapshot.hasError)
                return new Text("Snapshow error");
              else
                return new States().firstScreen(context, staticMap.addAllMarker(apiClient.getData()), apiClient);
          }
        });
  }
}
