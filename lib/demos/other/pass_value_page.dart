import 'package:flutter/material.dart';
import 'package:jh_flutter_demo/demos/demos_router.dart';
import 'package:jh_flutter_demo/project/routes/navigator_utils.dart';
import 'package:jh_flutter_demo/project/routes/fluro_navigator.dart';
import 'package:jhtoast/jhtoast.dart';

class PassValuePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("传值"),
          elevation: 0.0,
        ),
        body:
        RaisedButton(
          child: Text("带参数跳转"),
          onPressed: () {
//            Navigator.pushNamed(context, "PassValuePage2",arguments:"123").then((value){
//              print("回传的值===="+value.toString());
//            });

//            NavigatorFluroUtils.pushResult(context, '${"PassValuePage2"}?passvalue=123&isScan=true', (value){
//              print("回传的值===="+value.toString());
//            });

//            NavigatorUtils.pushNamed(context, '${"PassValuePage2"}?passvalue=123&isScan=true');

            NavigatorUtils.pushNamedResult(context, '${"PassValuePage2"}?passvalue=123&isScan=true', (value){
              print("回传的值===="+value.toString());
              JhToast.showText(context, msg: "返回的参数: $value");
            });

          },
        )

    );
  }
}



