import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: ListView(
        padding: EdgeInsets.only(top: 200),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Image.network(
                "https://i.pinimg.com/736x/64/ca/5f/64ca5f34cbe5f9eb7f6a3bf7a06410bd.jpg",
                width: 500,
                height: 500,
                ),
            
              Text(
                'okak',
                textDirection: TextDirection.ltr,
                style: TextStyle(fontSize: 35),
              ),
            
              SLWidget(pic: 'kotik5', txt: 'эвоно как...',),

              SLWidget(pic: 'kotik6',txt: 'вот оно че...',),

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
  const SLWidget({this.pic = '',this.txt = '|empty|'});

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.symmetric(vertical: 40),
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(
          width: 500, 
          height: 200
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/${pic}.jpg',
              width: 200,
              height: 200,
            ),
            Text(
              '${txt}', 
              style: TextStyle(fontSize: 35),
            )
          ],
        ),
      ),
    );
  }
}

class SFWifget extends StatefulWidget{
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
        'клацнуто раз: ${value}',
        style: TextStyle(fontSize: 24),  
      )
    );
  }
}