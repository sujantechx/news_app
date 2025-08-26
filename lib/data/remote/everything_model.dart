class SourceModel{
  String name;
  String id;

  SourceModel({
    required this.name,
    required this.id,
});
  factory SourceModel.fromJson(Map<String,dynamic>json){
    return SourceModel(
        name: json['name'],
        id: json['id']);
  }
}

class ArticlesModel{
  String author;
  String content;
  String description;
  String publishedAt;
  SourceModel source;
  String title;
  String url;
  String urlToImage;

  ArticlesModel({
    required this.author,
    required this.content,
    required this.description,
    required this.publishedAt,
    required this.source,
    required this.title,
    required this.url,
    required this.urlToImage
});
factory ArticlesModel.fromJson(Map<String,dynamic>json){
  return ArticlesModel(
      author: json['author'],
      content:  json['content'],
      description: json['description'] ,
      publishedAt:  json['publishedAt'],
      source:SourceModel.fromJson(json['source']),
      title:  json['title'],
      url: json['url'] ,
      urlToImage:  json['urlToImage']);
}
}

class EverythingModel {
  List<ArticlesModel> articles;
  String status;
  String totalResults;

  EverythingModel({
    required this.articles,
    required this.status,
    required this.totalResults,
});
  factory EverythingModel.fromJson(Map<String,dynamic>json){
    List<ArticlesModel> mArticles=[];
    for(Map<String,dynamic> eachArticle in json['articles'] ){
      mArticles.add(ArticlesModel.fromJson(eachArticle));
    }
    return EverythingModel(
        status: json['status'],
        totalResults: json['totalResults'],
      articles:mArticles,
    );

  }
}