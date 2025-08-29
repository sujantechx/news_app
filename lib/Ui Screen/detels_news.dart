// import 'package:flutter/material.dart';
// import 'package:news_app/model/news_model.dart';
// import 'package:wallpaper/model/wallpaper_model.dart';
// import 'package:wallpaper/utl/text_style.dart';
// class DetelsWallpaper extends StatelessWidget {
//   NewsModel imgModel;
//
//    DetelsWallpaper({ required this.imgModel});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Stack(
//           children: [
//             ///image full screen
//             Positioned.fill(
//                 child: Image.network(
//                   imgModel.portrait!,fit: BoxFit.cover,)
//             ),
//             ///Bottom Icon row
//             Positioned(
//               bottom: 20,
//               left: 0,
//               right: 0,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                  getActionBtn( title: "Info", icon: Icons.info_outline, onTap: null),
//                  getActionBtn( title: "Save", icon: Icons.download, onTap: null),
//                  getActionBtn(title: "Apply", icon: Icons.wallpaper,bgColor: Colors.blue, onTap: null),
//
//                 ],
//               ),
//             )
//
//           ],
//         )
//     );
//   }
//   Widget getActionBtn({
//     required VoidCallbackAction? onTap,
//     required String title,
//     required IconData icon,
//     Color? bgColor
// }){
//     return Column(
//       children: [
//         Container(
//           height: 60,
//           width: 60,
//           padding: EdgeInsets.all(12),
//
//           decoration: BoxDecoration(
//               color: bgColor!=null ?Colors.blueAccent: Colors.white.withOpacity(0.4),
//               borderRadius: BorderRadius.circular(12)
//           ),
//           child: Center(
//              child:  Icon(icon,color: Colors.white,)),),
//         SizedBox(height: 10,),
//         Text(title,style: mTextStyle12(textColor: Colors.white),)
//             ],
//           );
//   }
// }
