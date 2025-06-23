import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: const Color.fromARGB(255, 223, 72, 193),
      body: ListView(
        padding: EdgeInsets.only(top: 200),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Image.asset(
                'assets/images/shailushai.jpg',
                width: 400,
                ),
            
              Text(
                'Шайлушай',
                textDirection: TextDirection.ltr,
                style: TextStyle(fontSize: 35),
              ),
            
              SLWidget(pic: 'https://i.pinimg.com/736x/70/88/5b/70885bb8b00f3f978faed985614f83e9.jpg', txt: 'свага присутствует',),

              SLWidget(pic: 'https://i.pinimg.com/736x/e9/7d/1d/e97d1d7ac8ac8396c0cc5ffba5fcc24b.jpg',txt: 'cakes',),

              SFWifget(),
            
            ],
          )
        ],
      ),
    ),
  )
);
}

class SLWidget extends StatelessWidget{
  final String pic;
  final String txt;
  const SLWidget({super.key, required this.pic, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.symmetric(vertical: 40),
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(
          width: 500, 
          height: 400
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(
              pic,
              width: 200,
              height: 200,
            ),
            Text(
              txt, 
              style: TextStyle(fontSize: 35),
            )
          ],
        ),
      ),
    );
  }
}

class SFWifget extends StatefulWidget{
  const SFWifget({super.key});

  @override
  SFWifgetState createState() => SFWifgetState();
}

class SFWifgetState extends State<SFWifget>{

  int value = 0;
  
  @override 
  Widget build(BuildContext context){

    return ElevatedButton(
      onPressed:(){setState(() {
        value++;
      });}, 
      child: Text(
        'пикми: $value',
        style: TextStyle(fontSize: 24),  
      )
    );
  }
}