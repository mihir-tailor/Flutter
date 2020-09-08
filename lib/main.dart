import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  String imageUrl;
  String word;
  bool color = false;
  Color pickerColor = new Color(0xff443a49);
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
  }

  void _handleOnPressed() {
    setState(() {
      color = !color;
      color ? _animationController.forward() : _animationController.reverse();
    });
  }

  void changeColor(Color color) {
    setState(() {
      pickerColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Code Generator"),
        leading: Icon(
          Icons.android,
          color: Colors.greenAccent,
        ),
        backgroundColor: Color.fromRGBO(0, 36, 124, 1),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.image,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      backgroundColor: Color.fromRGBO(0, 36, 124, 1),
      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Stack(
                  children: [
                    Center(
                      child: Container(
                        height: 200,
                        width: 200,
                        child: Image.asset('assets/frame.png'),
                      ),
                    ),
                    imageUrl != null
                        ? Center(
                            child: Container(
                              padding: EdgeInsets.only(top: 10),
                              height: 170,
                              width: 170,
                              child: FadeInImage.assetNetwork(
                                  placeholder: "assets/loading.gif",
                                  image: imageUrl),
                            ),
                          )
                        : Container()
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 40,
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      color: Colors.white70),
                  child: Center(
                    child: ListTile(
                      title: Container(
                        padding: EdgeInsets.only(bottom: 10),
                        child: TextFormField(
                          cursorColor: Colors.black,
                          onChanged: (value) {
                            setState(() {
                              word = value;
                            });
                          },
                          decoration: new InputDecoration(
                              icon: Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Icon(
                                  Icons.textsms,
                                  color: Colors.black87,
                                ),
                              ),
                              hintText: "Enter Here",
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  left: 15, bottom: 11, top: 11, right: 15)),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                AnimatedContainer(
                  padding: EdgeInsets.all(10),
                  duration: Duration(milliseconds: 300),
                  width: 300,
                  height: color == false ? 70 : 280,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 51, 145, 1),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: SingleChildScrollView(
                      child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.only(right: 100),
                            child: Row(
                              children: [
                                Text(
                                  "COLOR",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                AnimatedContainer(
                                  duration: Duration(milliseconds: 450),
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: pickerColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                          IconButton(
                            splashColor: Colors.transparent,
                            icon: AnimatedIcon(
                              icon: AnimatedIcons.menu_arrow,
                              color: Colors.white,
                              progress: _animationController,
                            ),
                            onPressed: () {
                              _handleOnPressed();
                            },
                          )
                        ],
                      ),
                      color == true
                          ? Container(
                              height: 200,
                              child: MaterialPicker(
                                pickerColor: pickerColor,
                                onColorChanged: changeColor,
                                enableLabel: true,
                              ),
                            )
                          : Container()
                    ],
                  )),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 50),
                      height: 70,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          color: Color.fromRGBO(255, 144, 39, 1)),
                      child: FlatButton(
                        child: Text(
                          "Create QR",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          if (word != null) {}
                        },
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 50),
                      height: 70,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          color: Color.fromRGBO(0, 180, 245, 1)),
                      child: FlatButton(
                        child: Text(
                          "Save QR",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          if (word != null) {}
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
