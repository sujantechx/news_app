import 'package:equatable/equatable.dart';
import '../../../model/news_model.dart';

/// Enum to track the status of each independent data fetch.
enum DataStatus { initial, loading, success, failure }

class HomeState extends Equatable {
  // Properties for Top Headlines / Main List
  final DataStatus topHeadlinesStatus;
  final List<Article> topHeadlinesArticles;
  final String topHeadlinesError;

  // Properties for Trending News
  final DataStatus trendingNewsStatus;
  final List<Article> trendingNewsArticles;
  final String trendingNewsError;

  const HomeState({
    this.topHeadlinesStatus = DataStatus.initial,
    this.topHeadlinesArticles = const [],
    this.topHeadlinesError = '',
    this.trendingNewsStatus = DataStatus.initial,
    this.trendingNewsArticles = const [],
    this.trendingNewsError = '',
  });

  /// Creates a copy of the state with updated values. This is crucial for immutable state management.
  HomeState copyWith({
    DataStatus? topHeadlinesStatus,
    List<Article>? topHeadlinesArticles,
    String? topHeadlinesError,
    DataStatus? trendingNewsStatus,
    List<Article>? trendingNewsArticles,
    String? trendingNewsError,
  }) {
    return HomeState(
      topHeadlinesStatus: topHeadlinesStatus ?? this.topHeadlinesStatus,
      topHeadlinesArticles: topHeadlinesArticles ?? this.topHeadlinesArticles,
      topHeadlinesError: topHeadlinesError ?? this.topHeadlinesError,
      trendingNewsStatus: trendingNewsStatus ?? this.trendingNewsStatus,
      trendingNewsArticles: trendingNewsArticles ?? this.trendingNewsArticles,
      trendingNewsError: trendingNewsError ?? this.trendingNewsError,
    );
  }

  @override
  List<Object> get props => [
    topHeadlinesStatus,
    topHeadlinesArticles,
    topHeadlinesError,
    trendingNewsStatus,
    trendingNewsArticles,
    trendingNewsError,
  ];
}