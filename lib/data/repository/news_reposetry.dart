// lib/data/repository/news_repository.dart

import '../../model/news_model.dart';
import '../remote/api_helper.dart';
import '../remote/urls.dart';

// INTERFACE
abstract class BaseNewsRepository {
  Future<NewsModel> getTopHeadlines({required String country, String? category});
  Future<NewsModel> searchNews({required String query});
  Future<NewsModel> getTrendingNews({String sources = "bbc-news,the-verge"});
}

// IMPLEMENTATION
class NewsRepositoryImpl implements BaseNewsRepository {
  final BaseApiClient _apiClient;

  NewsRepositoryImpl({required BaseApiClient apiClient}) : _apiClient = apiClient;

  Future<NewsModel> _fetchNews(String url, Map<String, String> params) async {
    try {
      final response = await _apiClient.get(url: url, params: params);
      return NewsModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<NewsModel> getTopHeadlines({required String country, String? category}) {
    final params = {'country': country};
    if (category != null) {
      params['category'] = category;
    }
    return _fetchNews(ApiConstants.TOP_HEADLINES_URL, params);
  }

  @override
  Future<NewsModel> searchNews({required String query}) {
    return _fetchNews(ApiConstants.EVERYTHING_URL, {'q': query});
  }

  @override
  Future<NewsModel> getTrendingNews({String sources = "bbc-news,the-verge"}) {
    return _fetchNews(ApiConstants.EVERYTHING_URL, {
      'sources': sources,
      'sortBy': 'popularity',
    });
  }
}