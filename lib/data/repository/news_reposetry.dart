import '../../model/news_model.dart';
import '../remote/api_helper.dart';
import '../remote/urls.dart';

class NewsRepository {
  final ApiHelper apiHelper;

  NewsRepository({required this.apiHelper});

  /// Fetch Top Headlines (Country-based)
  Future<NewsModel> getTopHeadlines({String country = "us"}) async {
    final data = await apiHelper.getAPI(
      url: AppUrls.HEADLINES_URL,
      params: {'country': country},
    );
    return NewsModel.fromJson(data);
  }


  /// Search News Articles
  Future<NewsModel> searchNews(String query) async {
    final data = await apiHelper.getAPI(
      url: AppUrls.EVERYTHING_URL,
      params: {'q': query},
    );
    return NewsModel.fromJson(data);
  }

  Future<NewsModel> fetchTrendingNews({String language = "en"}) async {
    final data = await apiHelper.getAPI(
      url: AppUrls.TRENDING_NEWS_URL,
      params: {
        'language': language,
        'sortBy': 'popularity', //  Works here
        'q': 'latest',          //  Ensures trending/latest news
      },
    );
    return NewsModel.fromJson(data);
  }
}
