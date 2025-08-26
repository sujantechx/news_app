import '../../../model/news_model.dart';

/// Base state for NewsCubit
abstract class NewsState {}

/// 🔹 Initial State
class NewsInitial extends NewsState {}

/// 🔹 Loading State
class NewsLoading extends NewsState {}

/// 🔹 Loaded State for general news & search results
class NewsLoaded extends NewsState {
  final List<NewsModel> news;
  NewsLoaded({required this.news});
}

/// 🔹 Loaded State for trending news
class TrendingNewsLoaded extends NewsState {
  final List<NewsModel> trendingNews;
  TrendingNewsLoaded({required this.trendingNews});
}

/// 🔹 Error State
class NewsError extends NewsState {
  final String message;
  NewsError({required this.message});
}
