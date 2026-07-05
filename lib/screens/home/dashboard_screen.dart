import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../constants/links.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  // Safe URL launcher function following the latest package specs
  Future<void> _launchPortalUrl(BuildContext context, String urlString) async {
    final Uri url = Uri.parse(urlString);
    try {
      // Launch in an external application (default system browser)
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Could not launch portal: $urlString')),
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error opening link: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA), // Light modern background
      appBar: AppBar(
        title: const Text(
          'BU Gateway Hub',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color(0xFF0D47A1), // Official BU Blue
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
        itemCount: universityLinkCategories.length,
        itemBuilder: (context, categoryIndex) {
          final category = universityLinkCategories[categoryIndex];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section Category Headers
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  top: 16.0,
                  bottom: 8.0,
                ),
                key: ValueKey(category.name),
                child: Row(
                  children: [
                    Icon(
                      category.headerIcon,
                      color: const Color(0xFF0D47A1),
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      category.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2C3E50),
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
              // Grid layout for links within this specific category
              GridView.builder(
                shrinkWrap: true,
                physics:
                    const NeverScrollableScrollPhysics(), // Let ListView handle scrolling
                itemCount: category.links.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.15,
                ),
                itemBuilder: (context, linkIndex) {
                  final link = category.links[linkIndex];

                  return Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: InkWell(
                      onTap: () => _launchPortalUrl(context, link.url),
                      borderRadius: BorderRadius.circular(12),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: link.themeColor.withValues(
                                alpha: 0.1,
                              ),
                              child: Icon(link.icon, color: link.themeColor),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              link.title,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF333333),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              link.description,
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.black.withValues(alpha: 0.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
