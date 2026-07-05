import 'package:flutter/material.dart';

class UniversityLink {
  final String title;
  final String url;
  final IconData icon;
  final String description;
  final Color themeColor;

  const UniversityLink({
    required this.title,
    required this.url,
    required this.icon,
    required this.description,
    this.themeColor = const Color(0xFF0D47A1),
  });
}

class LinkCategory {
  final String name;
  final IconData headerIcon;
  final List<UniversityLink> links;

  const LinkCategory({
    required this.name,
    required this.headerIcon,
    required this.links,
  });
}

// Grouped mapping of all 10 official Bugema University links
const List<LinkCategory> universityLinkCategories = [
  LinkCategory(
    name: 'Primary Portals',
    headerIcon: Icons.star,
    links: [
      UniversityLink(
        title: 'Official Website',
        url: 'https://bugemauniv.ac.ug/',
        icon: Icons.language,
        description: 'Main university public homepage and general news.',
        themeColor: Color(0xFF0D47A1),
      ),
    ],
  ),
  LinkCategory(
    name: 'Academic & Staff Portals',
    headerIcon: Icons.school,
    links: [
      UniversityLink(
        title: 'Student Portal (ERMS)',
        url: 'https://erms.bugemauniv.ac.ug/student/login/',
        icon: Icons.badge,
        description: 'Access academic records, registration, and clearances.',
        themeColor: Color(0xFF1B5E20),
      ),
      UniversityLink(
        title: 'Staff Portal (ERMS)',
        url: 'https://erms.bugemauniv.ac.ug/staff/login/',
        icon: Icons.supervised_user_circle,
        description: 'Internal portal for university staff operations.',
        themeColor: Color(0xFF2E7D32),
      ),
    ],
  ),
  LinkCategory(
    name: 'Digital Learning',
    headerIcon: Icons.computer,
    links: [
      UniversityLink(
        title: 'E-Learning (ODeL)',
        url: 'https://elearning.bugemauniv.ac.ug/',
        icon: Icons.cast_for_education,
        description: 'Attend online classes, submit assignments, and view course notes.',
        themeColor: Color(0xFFE65100),
      ),
    ],
  ),
  LinkCategory(
    name: 'Financial Services',
    headerIcon: Icons.account_balance_wallet,
    links: [
      UniversityLink(
        title: 'Online Payments',
        url: 'https://payments.bugemauniv.ac.ug/payments/',
        icon: Icons.payment,
        description: 'Pay tuition, functional fees, and other charges securely.',
        themeColor: Color(0xFFB71C1C),
      ),
      UniversityLink(
        title: 'Payment Status Tracker',
        url: 'https://payments.bugemauniv.ac.ug/payments/status/',
        icon: Icons.track_changes,
        description: 'Verify your clearance status and check transaction histories.',
        themeColor: Color(0xFFD32F2F),
      ),
    ],
  ),
  LinkCategory(
    name: 'University Libraries',
    headerIcon: Icons.local_library,
    links: [
      UniversityLink(
        title: 'Main E-Library Portal',
        url: 'http://lib.bugemauniv.ac.ug',
        icon: Icons.menu_book,
        description: 'Access digital libraries, global repositories, and digital resources.',
        themeColor: Color(0xFF4A148C),
      ),
      UniversityLink(
        title: 'Library Catalog (Koha OPAC)',
        url: 'https://koha.bugemauniv.ac.ug',
        icon: Icons.find_in_page,
        description: 'Search physical book availability and inventory locations.',
        themeColor: Color(0xFF6A1B9A),
      ),
    ],
  ),
  LinkCategory(
    name: 'Research & Publications',
    headerIcon: Icons.science,
    links: [
      UniversityLink(
        title: 'Institutional Repository (BUIR)',
        url: 'https://buir.bugemauniv.ac.ug/xmlui/',
        icon: Icons.inventory_2,
        description: 'Access historical university thesis papers and projects.',
        themeColor: Color(0xFF006064),
      ),
      UniversityLink(
        title: 'Scholarly Journals (OJS)',
        url: 'https://journal.bugemauniv.ac.ug/',
        icon: Icons.assignment,
        description: 'Read peer-reviewed research papers and publications.',
        themeColor: Color(0xFF00838F),
      ),
    ],
  ),
];