import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../util/helpper/text_style.dart';

class AppHeadlineWideger extends StatelessWidget {
  String imgUrl;
  String headLine;
  String author;
   AppHeadlineWideger({
     required this.imgUrl,
     required this.headLine ,
     required this.author});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(34)
      ),
      child: Column(
        children: [
          Expanded(child: ClipRRect(
      borderRadius: BorderRadius.circular(34),
              child: Image.network(imgUrl,fit: BoxFit.fill,))),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Treading NO.1",
                  style: mTextStyle16(textColor: Colors.grey)),
              Text("2 day ago", style: mTextStyle16(textColor: Colors.grey)),
            ],
          ),
          Text(headLine,
              style: mTextStyle20(mFontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(radius: 20,backgroundColor: Colors.blueAccent,),
              SizedBox(width: 10,),
              Text(author,
                  style: mTextStyle18(textColor: Colors.grey)),
              Expanded(child: Container()),
              Icon(Icons.more_horiz)
            ],
          ),
        ],
      ),
    );
  }
}
