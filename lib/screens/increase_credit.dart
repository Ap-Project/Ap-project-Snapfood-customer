import 'package:flutter/material.dart';

class increaseCredit extends StatefulWidget {
  @override
  _increaseCreditState createState() => _increaseCreditState();
}

class _increaseCreditState extends State<increaseCredit> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      width: 250.0,
      margin: EdgeInsets.only(left: 30.0, top: 25.0),
      child: Column(
        children: <Widget>[
          Text(
            "Increase Credit",
            style: TextStyle(fontSize: 20.0, color: Colors.orangeAccent),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Card(
              color: Colors.orange[200],
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 75.0,
                      width: 45.0,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFD3D3D3)),
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white70,
                      ),
                      child: Column(
                        children: <Widget>[
                          InkWell(
                            child: Icon(
                              Icons.keyboard_arrow_up,
                              color: Colors.orange,
                            ),
                            onTap: () {},
                            splashColor: Colors.black45,
                          ),
                          Text(
                            "0", //index
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Color(0xFFD3D3D3),
                            ),
                          ),
                          InkWell(
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.orange,
                            ),
                            onTap: () {},
                            splashColor: Colors.black45,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 30.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Increase \$",
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        Text(
                          "Decrease \$",
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    // Spacer(),
                    GestureDetector(
                      child: Icon(
                        Icons.cancel,
                        color: Colors.red,
                      ),
                      onTap: () {},
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
    ;
  }
}
