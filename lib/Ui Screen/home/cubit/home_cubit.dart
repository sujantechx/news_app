import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repository/news_reposetry.dart';
import '../../../model/news_model.dart';
import 'home_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final NewsRepository newsRepository;

  NewsCubit({required this.newsRepository}) : super(NewsInitial());

  /// ✅ Fetch trending news
  Future<void> fetchTrendingNews() async {
    emit(NewsLoading());
    try {
      final NewsModel trendingNews = await newsRepository.fetchTrendingNews();
      emit(TrendingNewsLoaded(trendingNews: [trendingNews]));
    } catch (e) {
      emit(NewsError(message: e.toString()));
    }
  }

  /// ✅ Search for news articles
  Future<void> searchNews(String query) async {
    emit(NewsLoading());
    try {
      final NewsModel news = await newsRepository.searchNews(query);
      emit(NewsLoaded(news: [news]));
    } catch (e) {
      emit(NewsError(message: e.toString()));
    }
  }

  /// ✅ Fetch top headlines
  Future<void> fetchTopHeadlines({String country = "in"}) async {
    emit(NewsLoading());
    try {
      final NewsModel news = await newsRepository.getTopHeadlines(country: country);
      emit(NewsLoaded(news: [news]));
    } catch (e) {
      emit(NewsError(message: e.toString()));
    }
  }
}
