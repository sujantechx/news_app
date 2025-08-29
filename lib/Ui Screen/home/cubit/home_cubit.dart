import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repository/news_reposetry.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final BaseNewsRepository _newsRepository;

  HomeCubit({required BaseNewsRepository newsRepository})
      : _newsRepository = newsRepository,
        super(const HomeState());

  /// Fetches all initial data for the home screen concurrently for better performance.
  Future<void> loadInitialData() async {
    emit(state.copyWith(
      topHeadlinesStatus: DataStatus.loading,
      trendingNewsStatus: DataStatus.loading,
    ));
    try {
      // Fetch both APIs at the same time.
      final responses = await Future.wait([
        _newsRepository.getTopHeadlines(country: 'us'),
        _newsRepository.getTrendingNews(),
      ]);
      // Emit a single success state with all the data.
      emit(state.copyWith(
        topHeadlinesStatus: DataStatus.success,
        topHeadlinesArticles: responses[0].articles,
        trendingNewsStatus: DataStatus.success,
        trendingNewsArticles: responses[1].articles,
      ));
    } catch (e) {
      emit(state.copyWith(
        topHeadlinesStatus: DataStatus.failure,
        topHeadlinesError: e.toString(),
        trendingNewsStatus: DataStatus.failure,
        trendingNewsError: e.toString(),
      ));
    }
  }

  /// Search will update the main list of articles.
  Future<void> searchNews(String query) async {
    if (query.trim().isEmpty) return;
    emit(state.copyWith(topHeadlinesStatus: DataStatus.loading));
    try {
      final news = await _newsRepository.searchNews(query: query);
      emit(state.copyWith(
        topHeadlinesStatus: DataStatus.success,
        topHeadlinesArticles: news.articles,
      ));
    } catch (e) {
      emit(state.copyWith(
        topHeadlinesStatus: DataStatus.failure,
        topHeadlinesError: e.toString(),
      ));
    }
  }
}