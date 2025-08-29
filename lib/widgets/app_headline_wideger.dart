// lib/presentation/home/cubit/home_state.dart

import 'package:equatable/equatable.dart';
import '../../../model/news_model.dart';

// Enum to track the status of each data fetch
enum DataStatus { initial, loading, success, failure }

class HomeState extends Equatable {
  // State for Top Headlines / Main List
  final DataStatus topHeadlinesStatus;
  final List<Article> topHeadlinesArticles;
  final String topHeadlinesError;

  // State for Trending News
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

  // copyWith method to easily create a new state object with updated values
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