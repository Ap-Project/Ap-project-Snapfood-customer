import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:customer_app/screens/bottom_sheet.dart';
import 'package:customer_app/screens/increase_credit.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: followButton(),
      body: Stack(
        children: <Widget>[
          ClipPath(
            child: Container(
              color: Colors.orangeAccent.withOpacity(0.8),
            ),
            clipper: GetClipper(),
          ),
          Positioned(
            width: MediaQuery.of(context).size.width,
            top: MediaQuery.of(context).size.height / 6.0,
            // left: 76.0,
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      width: 150.0,
                      height: 150.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(".peg"),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(80.0),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5.0,
                            color: Colors.orange,
                            offset: Offset(5.0, 6.0),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 20.0,
                      right: 20.0,
                      child: InkWell(
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 28.0,
                        ),
                        onTap: () {
                          // showModalBottomSheet(
                          //     context: context,
                          //     builder: ((builder) => BottomShhetWidget()));
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 18.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 50.0,
                    ),
                    Text(
                      "Ghazal Laghaee",
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45,
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    InkWell(
                      child: Icon(
                        Icons.person_pin,
                        size: 18.0,
                        color: Colors.orangeAccent,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 50.0,
                    ),
                    Text(
                      "Client",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    InkWell(
                      child: Icon(
                        Icons.wallet_membership,
                        size: 18.0,
                        color: Colors.orangeAccent,
                      ),
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: ((builder) => increaseCredit()));
                      },
                    ),
                  ],
                ),
                Divider(
                  height: 30.0,
                  color: Colors.orangeAccent,
                ),
                Container(
                  width: 350.0,
                  height: 60.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            "6",
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 2.0,
                          ),
                          Text(
                            "Favorite Restaurants",
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      VerticalDivider(
                        width: 70.0,
                        color: Colors.orange,
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            "2",
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 2.0,
                          ),
                          Text(
                            "My Comments",
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 20.0,
                  color: Colors.orange,
                ),
                Container(
                  color: Colors.orangeAccent,
                  width: MediaQuery.of(context).size.width,
                  height: 130.0,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Card(
                          // color: Colors.amber,
                          margin: EdgeInsets.symmetric(horizontal: 10.0),
                          elevation: 5.0,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Comment 1",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange,
                                  ),
                                ),
                                SizedBox(
                                  height: 7.0,
                                ),
                                Text(
                                  "Wonderful application and tasty foods =)",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Card(
                          // color: Colors.amber,
                          margin: EdgeInsets.symmetric(horizontal: 10.0),
                          elevation: 5.0,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Comment 2",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange,
                                  ),
                                ),
                                SizedBox(
                                  height: 7.0,
                                ),
                                Text(
                                  "Fantastic application and tasty foods  =)",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 3,
                          height: 40.0,
                          color: Colors.white,
                        ),
                        //popular restaurants
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GetClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height / 2.2);
    path.lineTo(size.width + 125.0, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
