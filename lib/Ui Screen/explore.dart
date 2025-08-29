import 'package:flutter/material.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          _buildAppBar(),
          _buildHeaderAndTabs(),
          _buildNewsCardList(),
        ],
      ),
    );
  }

  /// Builds the top app bar with title and notification icon.
  SliverAppBar _buildAppBar() {
    return SliverAppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      pinned: true,
      centerTitle: true,
      leading: const Icon(Icons.arrow_back, color: Colors.black),
      title: const Text(
        'Explore',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_none, color: Colors.black),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: _buildSearchBar(),
      ),
    );
  }

  /// Builds the search bar.
  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Let's see what happend today",
          hintStyle: TextStyle(color: Colors.grey.shade500),
          prefixIcon: Icon(Icons.search, color: Colors.grey.shade500),
          filled: true,
          fillColor: Colors.grey.shade100,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  /// Builds the main header text and the category tabs.
  Widget _buildHeaderAndTabs() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Text
            const Text.rich(
              TextSpan(
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  height: 1.3,
                ),
                children: [
                  TextSpan(text: 'Read More '),
                  TextSpan(
                    text: 'News',
                    style: TextStyle(color: Colors.blue),
                  ),
                  TextSpan(text: ' and See What Happen On '),
                  TextSpan(
                    text: 'Another World',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Category Tabs
            DefaultTabController(
              length: 2,
              child: Container(
                height: 40,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TabBar(
                  indicator: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.grey.shade600,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: const [
                    Tab(text: 'Exclusive'),
                    Tab(text: 'Live'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the scrollable list of news cards.
  Widget _buildNewsCardList() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
              (context, index) {
            // This would be your news article data
            return const NewsCard();
          },
          childCount: 5, // Display 5 cards for demonstration
        ),
      ),
    );
  }
}

/// A reusable widget for a single news card.
class NewsCard extends StatelessWidget {
  const NewsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with category tags
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  'https://images.unsplash.com/photo-1534796636912-3b95b3ab5986?q=80&w=2942&auto=format&fit=crop',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: Row(
                  children: [
                    _buildCategoryChip('Nature'),
                    const SizedBox(width: 8),
                    _buildCategoryChip('Astronomical'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Title
          const Text(
            "The New Earth Planet Already Discovered! It's Near The Neptune",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 12),
          // Publisher info and stats
          Row(
            children: [
              const CircleAvatar(
                radius: 12,
                backgroundImage: NetworkImage(
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/1/17/CNBC_logo.svg/1200px-CNBC_logo.svg.png'),
              ),
              const SizedBox(width: 8),
              const Text('Cnbc News', style: TextStyle(fontWeight: FontWeight.bold)),
              const Text(' • March 2023', style: TextStyle(color: Colors.grey)),
              const Spacer(),
              _buildStatIcon(Icons.favorite_border, '4.2M'),
              const SizedBox(width: 16),
              _buildStatIcon(Icons.message_outlined, '502K'),
            ],
          )
        ],
      ),
    );
  }

  /// Helper for category chips on the image.
  Widget _buildCategoryChip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.black.withOpacity(0.4),
      labelStyle: const TextStyle(color: Colors.white, fontSize: 12),
      visualDensity: VisualDensity.compact,
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
    );
  }

  /// Helper for the like and comment stat icons.
  Widget _buildStatIcon(IconData icon, String count) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.grey),
        const SizedBox(width: 4),
        Text(count, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}