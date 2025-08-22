import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/util/app_routes/app_routes.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(
                "https://st2.depositphotos.com/3797065/11089/i/450/depositphotos_110891588-stock-photo-news-and-press-concept-breaking.jpg"
              ),fit: BoxFit.contain)
            ),
          ),

          Positioned(
            bottom: 50,left: 5,right: 5,
              child: Container(
                // height: double.infinity,
                width: double.infinity,
                decoration:  BoxDecoration(
                    color:Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(21)
                ),
                child: Column(
                  children: [
                    SizedBox(height: 20,),

                    Text("Don't Miss What Happen In \n Another Part Of The World",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold
                    ),),
                    SizedBox(height: 20,),
                    Text("Hear,see,watch something in the world using Tidings and \n "
                        "sher it with your famil or friend",
                    style: TextStyle(
                      fontSize: 16,
                    ),),
                    SizedBox(height: 20,),
                    ElevatedButton(onPressed: (){
                      Navigator.pushReplacementNamed(context, AppRoutes.dashbord);
                    },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          minimumSize: Size(double.infinity, 50)
                        ),
                        child: Text("Get Started"))


                  ],
                ),
              ))
        ],
      ),
    );
  }
}
