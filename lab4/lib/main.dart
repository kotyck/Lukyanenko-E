import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.grey,
      body: ListView(
        padding: EdgeInsets.only(top: 200),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Image.asset(
                "assets/images/kotik.jpg",
                width: 500,
                height: 500,
                ),
            
              Text(
                'okak',
                textDirection: TextDirection.ltr,
                style: TextStyle(fontSize: 24),
              ),
            
              Padding(
                padding: EdgeInsets.only(top: 600),
                child: ConstrainedBox(
                  constraints: BoxConstraints.tightFor(
                    width: 500, 
                    height: 200
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/kotik5.jpg',
                        width: 200,
                        height: 200,
                        ),
                      Text('эвоно как...', 
                      style: TextStyle(fontSize: 35),
                      )
                    ],
                  ),

                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(vertical: 50),
                child: ConstrainedBox(
                  constraints: BoxConstraints.tightFor(
                    width: 500, 
                    height: 200
                  ),
                  
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/kotik6.jpg',
                        width: 200,
                        height: 200,
                        ),
                      Text('вот оно че...', 
                      style: TextStyle(fontSize: 35),
                      )
                    ],
                  ),

                ),
              ),
            ],
          )
        ],
      ),
    ),
  )
);
}
