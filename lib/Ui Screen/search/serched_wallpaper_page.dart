// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:news_app/model/news_model.dart';
//
// import '../../util/helpper/text_style.dart';
// import '../detels_news.dart';
// import 'cubit/search_cubit.dart';
// import 'cubit/search_state.dart';
//
// class SerchedWallpaperPage extends StatefulWidget {
//   String query;
//   SerchedWallpaperPage({required this.query});
//
//
//
//   @override
//   State<SerchedWallpaperPage> createState() => _SerchedWallpaperPageState();
// }
//
// class _SerchedWallpaperPageState extends State<SerchedWallpaperPage> {
//   ScrollController? scrollController;
//   num totalWallPageCount=0;
//   int totalNoPage=1;
//   int pageCount=1;
//
//   List<NewsModel>allWallpapers=[];
//   @override
//   void initState() {
//     scrollController=ScrollController();
//     scrollController!.addListener((){
//       if(scrollController!.position.pixels==scrollController!.position.maxScrollExtent){
//         print("Ende of List");
//         totalNoPage=totalWallPageCount~/15+1;
//         if(totalWallPageCount>pageCount){
//           pageCount++;
//           BlocProvider.of<SearchCubit>(context).getSearchWallpapers(query: widget.query,);
//         }else{
//           print("You\'ve reached the end of the list caegory wallpaper");
//         }
//       }
//     });
//     // TODO: implement initState
//     super.initState();
//     BlocProvider.of<SearchCubit>(context).getSearchWallpapers(query: widget.query);
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocListener<SearchCubit,SearchState>(
//         listener: (context, state) {
//           if(state is SearchLoadingState){
//
//           }else if(state is SearchErrorState){
//
//           } else if(state is SearchLoadedState){
//             totalWallPageCount=state.totalWallpaper;
//             allWallpapers.addAll(state.listPhoto);
//             setState(() {
//
//             });
//           }
//         },
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 18.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(height: 20,),
//                 Text(widget.query,style: mTextStyle24(mFontWeight: FontWeight.bold),),
//                 Text("${totalWallPageCount}Wallpaper available",style: mTextStyle16(),),
//
//                 Expanded(child: Container(
//
//                   child: GridView.builder(
//                     controller: scrollController,
//                     shrinkWrap: true,
//                     gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       mainAxisSpacing: 11,
//                       crossAxisSpacing: 11,
//                       childAspectRatio: 3/4,
//
//                     ),
//                     itemCount:allWallpapers.length,
//                     itemBuilder: (_, index) {
//                       var eachPhoto=allWallpapers[index];
//                       return InkWell(
//                         onTap: () {
//                           Navigator.push(context, MaterialPageRoute(builder: (context) => DetelsWallpaper(imgModel: eachPhoto.src!),));
//
//                         },
//                           // child: WallpaperBgWidget(imgUrl: eachPhoto.src!.portrait!));
//                     },),
//                 ),)
//               ],
//             ),
//           ),
//         )
//         ,
//        /* builder: (_, state) {
//
//         if(state is SearchLoadingState){
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         }else if(state is SearchErrorState){
//           return Center(
//             child: Text(state.errorMsg),
//           );
//         }
//         else if(state is SearchLoadedState){
//           totalWallPageCount=state.totalWallpaper;
//           allWallpapers.addAll(state.listPhoto);
//           return Center(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 18.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(height: 20,),
//                   Text(widget.query,style: mTextStyle25(mFontWeight: FontWeight.bold),),
//                   Text("${state.totalWallpaper}Wallpaper available",style: mTextStyle16(),),
//
//                   Expanded(child: Container(
//
//                     child: GridView.builder(
//                       controller: scrollController,
//                       shrinkWrap: true,
//                         gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 2,
//                           mainAxisSpacing: 11,
//                           crossAxisSpacing: 11,
//                           childAspectRatio: 3/4,
//
//                         ),
//                         itemCount:allWallpapers.length,
//                         itemBuilder: (_, index) {
//                         var eachPhoto=allWallpapers[index];
//                           return WallpaperBgWidget(imgUrl: eachPhoto.src!.portrait!);
//                         },),
//                   ),)
//                 ],
//               ),
//             ),
//           );
//         }
//         return Container();
//       },*/
//       )
//     );
//   }
// }
