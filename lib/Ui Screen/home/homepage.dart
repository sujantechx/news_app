
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

import '../../model/news_model.dart';
import 'cubit/home_cubit.dart';
import 'cubit/home_state.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().loadInitialData();
  }

  /// Navigates to the detail screen for a selected article.
  void _navigateToArticleDetail(Article article) {
    // TODO: Implement the navigation to your ArticleDetailScreen
    // Example: Navigator.push(context, MaterialPageRoute(builder: (_) => ArticleDetailScreen(article: article)));
    print("Navigate to: ${article.title}");
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text("Tapped on: ${article.title}")));
  }

  String _formatDate(String isoString) {
    if (isoString.isEmpty) return '';
    try {
      final dateTime = DateTime.parse(isoString);
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      final yesterday = DateTime(now.year, now.month, now.day - 1);
      final dateToCompare = DateTime(dateTime.year, dateTime.month, dateTime.day);

      if (dateToCompare == today) {
        return 'Today';
      } else if (dateToCompare == yesterday) {
        return 'Yesterday';
      } else {
        return DateFormat.yMMMMd().format(dateTime);
      }
    } catch (e) {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async => context.read<HomeCubit>().loadInitialData(),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.grey.shade100,
                floating: true,
                pinned: true,
                title: _buildHeader(),
                automaticallyImplyLeading: false,
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(70.0),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
                    child: _buildSearchBar(),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSectionHeader("Breaking News"),
                          const SizedBox(height: 12),
                          _buildBreakingNewsList(),
                          const SizedBox(height: 24),
                          _buildSectionHeader("Trending Now"),
                          const SizedBox(height: 12),
                          _buildTrendingNewsList(),
                          const SizedBox(height: 24),
                          _buildSectionHeader("Top Stories"),
                          const SizedBox(height: 12),
                          _buildAllNewsList(),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // UI Helper Widgets

  Widget _buildHeader() => Row(
    children: [
      const CircleAvatar(
          radius: 22,
          backgroundImage: CachedNetworkImageProvider("https://avatar.iran.liara.run/public/boy")),
      const SizedBox(width: 12),
      const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Hello,", style: TextStyle(color: Colors.black54, fontSize: 14)),
          SizedBox(height: 2),
          Text("Sujan", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
        ],
      ),
      const Spacer(),
      IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none, size: 28, color: Colors.black)),
    ],
  );

  Widget _buildSearchBar() => TextField(
    decoration: InputDecoration(
      hintText: "Search for topics...",
      prefixIcon: const Icon(Icons.search),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
    ),
    onSubmitted: context.read<HomeCubit>().searchNews,
  );

  Widget _buildSectionHeader(String title) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      InkWell(
        onTap: () {},
        child: const Text("See all", style: TextStyle(fontSize: 14, color: Colors.blue, fontWeight: FontWeight.w600)),
      ),
    ],
  );

  Widget _buildErrorWidget(String message) => Center(child: Text("⚠ $message"));

  // --- Bloc-Connected & Shimmer Widgets ---

  Widget _buildBreakingNewsList() => BlocSelector<HomeCubit, HomeState, (DataStatus, List<Article>)>(
    selector: (state) => (state.topHeadlinesStatus, state.topHeadlinesArticles),
    builder: (context, data) {
      final status = data.$1;
      final articles = data.$2;
      if (status == DataStatus.loading) return _buildBreakingNewsShimmer();
      if (status == DataStatus.failure) return SizedBox(height: 200, child: _buildErrorWidget("Could not load news"));

      return SizedBox(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: articles.take(5).length,
          itemBuilder: (context, index) {
            final article = articles[index];
            return InkWell(
              onTap: () => _navigateToArticleDetail(article),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                margin: const EdgeInsets.only(right: 12),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: CachedNetworkImage(
                          imageUrl: article.urlToImage ?? '',
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(color: Colors.grey.shade300),
                          errorWidget: (context, url, error) => Container(color: Colors.grey.shade300, child: const Icon(Icons.error, color: Colors.white)),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: const LinearGradient(
                          colors: [Colors.transparent, Colors.black87],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.5, 1.0],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 16, left: 16, right: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(article.source.name, style: const TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 4),
                          Text(article.title, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold), maxLines: 2, overflow: TextOverflow.ellipsis),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    },
  );

  Widget _buildTrendingNewsList() => BlocSelector<HomeCubit, HomeState, (DataStatus, List<Article>)>(
    selector: (state) => (state.trendingNewsStatus, state.trendingNewsArticles),
    builder: (context, data) {
      final status = data.$1;
      final articles = data.$2;
      if (status == DataStatus.loading) return _buildTrendingNewsShimmer();
      if (status == DataStatus.failure) return SizedBox(height: 120, child: _buildErrorWidget("Could not load trends"));

      return SizedBox(
        height: 120,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: articles.length,
          itemBuilder: (context, index) {
            final article = articles[index];
            return InkWell(
              onTap: () => _navigateToArticleDetail(article),
              child: Container(
                width: 150,
                margin: const EdgeInsets.only(right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CachedNetworkImage(
                        imageUrl: article.urlToImage ?? '',
                        height: 80, width: 150, fit: BoxFit.cover,
                        placeholder: (context, url) => Container(height: 80, width: 150, color: Colors.grey.shade300),
                        errorWidget: (context, url, error) => Container(height: 80, width: 150, color: Colors.grey.shade300, child: const Icon(Icons.error)),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Expanded(child: Text(article.title, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500))),
                  ],
                ),
              ),
            );
          },
        ),
      );
    },
  );

  Widget _buildAllNewsList() => BlocBuilder<HomeCubit, HomeState>(
    buildWhen: (p, c) => p.topHeadlinesStatus != c.topHeadlinesStatus,
    builder: (context, state) {
      if (state.topHeadlinesStatus == DataStatus.loading) return _buildAllNewsShimmer();
      if (state.topHeadlinesStatus == DataStatus.failure) return _buildErrorWidget(state.topHeadlinesError);
      if (state.topHeadlinesArticles.isEmpty) return const Center(child: Text("No news found."));

      return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: state.topHeadlinesArticles.length,
        separatorBuilder: (context, index) => const Divider(height: 24),
        itemBuilder: (context, index) {
          final article = state.topHeadlinesArticles[index];
          return InkWell(
            onTap: () => _navigateToArticleDetail(article),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: CachedNetworkImage(
                    imageUrl: article.urlToImage ?? '',
                    width: 110, height: 110, fit: BoxFit.cover,
                    placeholder: (context, url) => Container(width: 110, height: 110, color: Colors.grey.shade300),
                    errorWidget: (context, url, error) => Container(width: 110, height: 110, color: Colors.grey.shade300, child: const Icon(Icons.error)),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: SizedBox(
                    height: 110,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(article.title, maxLines: 3, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(_formatDate(article.publishedAt), style: const TextStyle(color: Colors.grey, fontSize: 12)),
                            Text(article.source.name, style: const TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );

  // Shimmer Placeholder Widgets

  Widget _buildBreakingNewsShimmer() => Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        itemBuilder: (context, index) => Container(
          width: MediaQuery.of(context).size.width * 0.8,
          margin: const EdgeInsets.only(right: 12),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
        ),
      ),
    ),
  );

  Widget _buildTrendingNewsShimmer() => Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) => Container(
          width: 150,
          margin: const EdgeInsets.only(right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(height: 80, width: 150, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12))),
              const SizedBox(height: 6),
              Container(height: 8, width: 130, color: Colors.white),
              const SizedBox(height: 4),
              Container(height: 8, width: 80, color: Colors.white),
            ],
          ),
        ),
      ),
    ),
  );

  Widget _buildAllNewsShimmer() => Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(height: 110, width: 110, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12))),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 8, width: 80, color: Colors.white),
                const SizedBox(height: 8),
                Container(height: 8, width: double.infinity, color: Colors.white),
                const SizedBox(height: 4),
                Container(height: 8, width: double.infinity, color: Colors.white),
                const SizedBox(height: 4),
                Container(height: 8, width: 100, color: Colors.white),
                const SizedBox(height: 12),
                Container(height: 8, width: 50, color: Colors.white),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}