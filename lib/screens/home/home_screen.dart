import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/links.dart';
import '../../constants/strings.dart';
import '../../widgets/category_header.dart';
import '../../widgets/link_card.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback onToggleTheme;
  final bool isDark;

  const HomeScreen({
    super.key,
    required this.onToggleTheme,
    required this.isDark,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Filter links based on search query
    final filteredLinks = allUniversityLinks.where((item) {
      final query = _searchQuery.toLowerCase();
      return item.title.toLowerCase().contains(query) ||
          item.description.toLowerCase().contains(query) ||
          item.category.toLowerCase().contains(query);
    }).toList();

    // Group filtered links by category
    final Map<String, List<LinkItem>> groupedLinks = {};
    for (var link in filteredLinks) {
      groupedLinks.putIfAbsent(link.category, () => []).add(link);
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Beautiful Sliver App Bar with rich gradients and welcome hero
          SliverAppBar(
            expandedHeight: 220.0,
            floating: false,
            pinned: true,
            stretch: true,
            backgroundColor: widget.isDark ? BUColors.cardDark : BUColors.primaryBlue,
            // When collapsed, display the title and a small logo
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'docs/assets/bu_logo_placeholder.png',
                  height: 28,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.school_rounded,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  BUStrings.appTitle,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(
                  widget.isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
                  color: Colors.white,
                ),
                onPressed: widget.onToggleTheme,
                tooltip: 'Toggle Theme',
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  // Rich Background Gradient
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: widget.isDark
                            ? [const Color(0xFF0F1E36), BUColors.backgroundDark]
                            : [BUColors.primaryBlue, const Color(0xFF1565C0)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                  // Abstract decorative shapes
                  Positioned(
                    top: -40,
                    right: -40,
                    child: Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                        color: BUColors.secondaryGold.withValues(alpha: 0.08),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -30,
                    left: -20,
                    child: Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.04),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  // Welcome message in the center
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Large logo in the header
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.1),
                                  blurRadius: 8,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Image.asset(
                              'docs/assets/bu_logo_placeholder.png',
                              height: 54,
                              width: 54,
                              errorBuilder: (context, error, stackTrace) => const Icon(
                                Icons.school_rounded,
                                color: BUColors.primaryBlue,
                                size: 36,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            BUStrings.welcomeMessage.toUpperCase(),
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                              color: BUColors.secondaryGold.withValues(alpha: 0.9),
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            BUStrings.slogan,
                            style: TextStyle(
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Persistent Search Bar underneath
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(64.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                alignment: Alignment.center,
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: widget.isDark ? BUColors.backgroundDark : Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: _searchController,
                    onChanged: (val) {
                      setState(() {
                        _searchQuery = val;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: BUStrings.searchPlaceholder,
                      hintStyle: TextStyle(
                        color: widget.isDark ? Colors.grey[500] : Colors.grey[400],
                        fontSize: 14,
                      ),
                      prefixIcon: Icon(
                        Icons.search_rounded,
                        color: widget.isDark ? BUColors.secondaryGold : BUColors.primaryBlue,
                      ),
                      suffixIcon: _searchQuery.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.clear_rounded, size: 20),
                              onPressed: () {
                                _searchController.clear();
                                setState(() {
                                  _searchQuery = '';
                                });
                              },
                            )
                          : null,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 13),
                    ),
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ),
            ),
          ),
          
          // Link List
          if (filteredLinks.isEmpty)
            SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search_off_rounded,
                        size: 64,
                        color: widget.isDark ? Colors.grey[700] : Colors.grey[300],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        BUStrings.noResults,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: widget.isDark ? Colors.grey[400] : Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          else
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  // Flattened categorized layout
                  // Let's iterate categories in order of relevance: Primary, Academic, Staff Portal, Learning, Finance, Library, Research
                  final categoriesInOrder = [
                    'Primary',
                    'Academic',
                    'Staff Portal',
                    'Learning',
                    'Finance',
                    'Library',
                    'Research',
                  ];
                  
                  // Filter out categories not present in groupedLinks
                  final activeCategories = categoriesInOrder
                      .where((cat) => groupedLinks.containsKey(cat))
                      .toList();
                  
                  // If there's any remaining category not in the standard list, add it at the end
                  for (var cat in groupedLinks.keys) {
                    if (!activeCategories.contains(cat)) {
                      activeCategories.add(cat);
                    }
                  }
                  
                  // Calculate layout items: category headers and link cards
                  final List<dynamic> layoutItems = [];
                  for (var cat in activeCategories) {
                    layoutItems.add(cat); // String represents category header
                    layoutItems.addAll(groupedLinks[cat]!); // LinkItem represents card
                  }
                  
                  if (index >= layoutItems.length) {
                    // Render footer at the end of the list
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 32),
                      child: Column(
                        children: [
                          Divider(indent: 32, endIndent: 32),
                          SizedBox(height: 16),
                          Text(
                            BUStrings.slogan,
                            style: TextStyle(
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            BUStrings.footerCopyright,
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  
                  final item = layoutItems[index];
                  if (item is String) {
                    return CategoryHeader(title: item);
                  } else if (item is LinkItem) {
                    return LinkCard(linkItem: item);
                  }
                  return const SizedBox.shrink();
                },
                childCount: () {
                  // Standard categories + their links + 1 for footer
                  final Map<String, List<LinkItem>> activeGrouped = {};
                  for (var link in filteredLinks) {
                    activeGrouped.putIfAbsent(link.category, () => []).add(link);
                  }
                  int count = activeGrouped.keys.length; // Headers
                  count += filteredLinks.length; // Cards
                  count += 1; // Footer
                  return count;
                }(),
              ),
            ),
        ],
      ),
    );
  }
}
