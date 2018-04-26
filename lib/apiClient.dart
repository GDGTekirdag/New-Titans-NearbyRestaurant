import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class ApiClient {

  String url= "https://ders1-b7d60.firebaseio.com/.json";
  List data;
  List dataMenu;
  List menuFiyat;


  Future<String> getInstance() async {
    http.Response response= await http.get(url,headers: {"Accept": "application/json"});

    this.data=JSON.decode(response.body);
    print(data[2]['restoran'].toString());
    return "Succes";
  }

  List getData(){
    return this.data;
  }
  List getDataMEnu(int index){
    this.dataMenu=data[index]['menu'];
    return this.dataMenu;
  }

  List getMenuFiyat(int index){
    this.menuFiyat=data[index]['fiyat'];
    return this.menuFiyat;
  }






}