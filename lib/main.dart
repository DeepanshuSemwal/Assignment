import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:assignment/model.dart';
import 'dart:math';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool flag=false;
  Model model=Model();

  void changeColor()
  {
        setState(
            ()
                {
                  flag=!flag;
                  model.color1=flag?Colors.purple:Colors.yellow;
                  model.color2=!flag?Colors.purple:Colors.yellow;
                }
        );

  }

   initState(){
     super.initState();
     generateRandomColor();

   }
   void generateRandomColor()
   {

     int randomColor1=Random().nextInt(model.color.length-1);
     int randomColor2=Random().nextInt(model.color.length-1);
     setState(
         ()
             {
               model.color1=model.color[randomColor1];
               model.color2=model.color[randomColor2];
             }
     );

   }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),

      home: Scaffold(

        appBar: AppBar(

          title: Center
            (
            child: Text("Assignment"),


          ),


        ),
        body: SafeArea(
          child: Row(

            children: <Widget>[

              containerWideget(model.color1),

              containerWideget(model.color2),
            ],

          ),

        ),

        floatingActionButton:   FloatingActionButton(
          onPressed: () {
            setState(()
                {
                  changeColor();

                },

            );


          },
         child: Icon(Icons.emoji_emotions_outlined),
        ),



        ),



    );
  }
  Widget containerWideget(Color color)
   {
      return  Container(
        color: color,
        height: 150.0,
        width: 150.0,

      );
    }
}



