// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   String asset, asset2;

//   setImage(myAsset) {
//     if (asset == "isi") {
//       setState(() {
//         print(asset);

//         return asset = myAsset;
//       });
//     } else if (asset2 == "isi") {
//       setState(() {
//         print(asset2);

//         return asset2 = myAsset;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         color: Colors.green,
//         child: Padding(
//           padding: const EdgeInsets.only(top: 8.0),
//           child: Stack(
//             children: [
//               Container(
//                 child: SvgPicture.asset(
//                   "assets/bg.svg",
//                 ),
//               ),
//               Positioned(
//                   left: 115,
//                   child: (asset == null)
//                       ? InkWell(
//                           onTap: () {
//                             asset = "isi";
//                           },
//                           child: Container(
//                             color: Colors.white,
//                             width: 60,
//                             height: 60,
//                           ),
//                         )
//                       : InkWell(
//                           onTap: () {
//                             asset = "isi";
//                           },
//                           child: SvgPicture.asset(
//                             asset,
//                             width: 60,
//                             height: 60,
//                           ),
//                         )),
//               Positioned(
//                   left: 285,
//                   child: (asset2 == null)
//                       ? InkWell(
//                           onTap: () {
//                             asset2 = "isi";
//                           },
//                           child: Container(
//                             color: Colors.white,
//                             width: 60,
//                             height: 60,
//                           ),
//                         )
//                       : InkWell(
//                           onTap: () {
//                             asset2 = "isi";
//                           },
//                           child: SvgPicture.asset(
//                             asset2,
//                             width: 60,
//                             height: 60,
//                           ),
//                         ))
//             ],
//           ),
//         ),
//       ),
//       bottomSheet: Container(
//         height: 80,
//         color: Colors.white,
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     setImage("assets/img1.svg");
//                   });
//                 },
//                 child: Container(
//                   width: 40,
//                   height: 40,
//                   color: Colors.red,
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     setImage("assets/img2.svg");
//                   });
//                 },
//                 child: Container(
//                   width: 40,
//                   height: 40,
//                   color: Colors.yellow,
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     setImage("assets/img3.svg");
//                   });
//                 },
//                 child: Container(
//                   width: 40,
//                   height: 40,
//                   color: Colors.blue,
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     setImage("assets/img4.svg");
//                   });
//                 },
//                 child: Container(
//                   width: 40,
//                   height: 40,
//                   color: Colors.pink,
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
