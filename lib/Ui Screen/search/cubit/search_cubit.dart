//
//
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:wallpaper/UI%20part/search/cubit/search_state.dart';
// import 'package:wallpaper/data/repository/wallpaper_reposetry.dart';
// import 'package:wallpaper/model/wallpaper_model.dart';
//
// class SearchCubit extends Cubit<SearchState>{
//
//   WallpaperRepository wallpaperRepository;
//   SearchCubit({required this.wallpaperRepository}):super(SearchInitialState());
//
//   void getSearchWallpapers({required String query,String color="",int page=1})async{
//     emit(SearchLoadingState());
//     try{
//       var mData=await wallpaperRepository.getSearchWallpapers(query, page: page,color: color);
//       WallpaperDataModel wallpaperDataModel=WallpaperDataModel.fromJson(mData);
//       emit(SearchLoadedState(listPhoto: wallpaperDataModel.photos, totalWallpaper: wallpaperDataModel.total_results!));
//     }catch(e){
//       emit(SearchErrorState(errorMsg: e.toString()));
//     }
//   }
//
// }