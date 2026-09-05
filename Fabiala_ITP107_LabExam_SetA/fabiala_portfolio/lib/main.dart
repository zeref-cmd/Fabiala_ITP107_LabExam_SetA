

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const PortfolioApp());
}



class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fabiala | Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.link,
          secondary: AppColors.heart,
          surface: AppColors.surface,
        ),
        textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
        fontFamily: GoogleFonts.inter().fontFamily,
      ),
      home: const PortfolioHomePage(),
    );
  }
}



class AppColors {
  static const Color background = Color(0xFF000000); // true black, IG dark mode
  static const Color surface = Color(0xFF121212); 
  static const Color divider = Color(0xFF262626); 
  static const Color textPrimary = Color(0xFFFAFAFA);
  static const Color textSecondary = Color(0xFF8E8E8E); 
  static const Color link = Color(0xFF3897F0); 
  static const Color heart = Color(0xFFED4956); 

  static const List<Color> igGradient = [
    Color(0xFFF58529),
    Color(0xFFDD2A7B),
    Color(0xFF8134AF),
    Color(0xFF515BD4),
  ];
}



class ProfileData {
  static const String username = 'jhon.fabiala';
  static const String fullName = 'Jhon Michael D. Fabiala';
  static const String tagline = 'Web Designer • BSIT Student';
  static const String subtitle = 'ITP107 Laboratory Examination Portfolio';
  static const String website = 'fabiala.dev';

  static const String ageValue = '20';
  static const String sectionValue = '3 IT-B';
  static const String programValue = 'BSIT';

  static const String aboutMeContent =
      'BSIT student passionate about mobile app development '
      'and clean UI design. Currently exploring Flutter, '
      'Dart, and cross-platform engineering. Always building, '
      'always learning. 🚀';

  static const String skillsContent =
      'App Development • Designing • Firebase • Java • Python • Git • '
      'UI/UX Design • REST APIs • Problem Solving';
}

// ============================================================
// HOME SCREEN (STATE)
// ============================================================

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  int _selectedTab = 0;

  
  static const ImageProvider _avatarProvider = AssetImage('assets/images/avatar.png');

  
  void _handleSingleTap() {
    final formattedDate = _formatDate(DateTime.now());
    debugPrint('=======================================================');
    debugPrint(' GESTURE EVENT      : SINGLE TAP');
    debugPrint(' ACTION             : Display current examination date');
    debugPrint(' OUTPUT             : $formattedDate');
    debugPrint('=======================================================');
  }

  void _handleDoubleTap() {
    const professorName = 'Albert Q. Alforja';
    debugPrint('=======================================================');
    debugPrint(' GESTURE EVENT      : DOUBLE TAP');
    debugPrint(' ACTION             : Display ITP107 professor\'s full name');
    debugPrint(' OUTPUT             : $professorName');
    debugPrint('=======================================================');
  }

  void _handleLongPress() {
    const studentName = 'Jhon Michael D. Fabiala';
    debugPrint('=======================================================');
    debugPrint(' GESTURE EVENT      : LONG PRESS');
    debugPrint(' ACTION             : Display student\'s full name');
    debugPrint(' OUTPUT             : $studentName');
    debugPrint('=======================================================');
  }

  String _formatDate(DateTime dt) {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    final month = months[dt.month - 1];
    final hour12 = dt.hour % 12 == 0 ? 12 : dt.hour % 12;
    final period = dt.hour >= 12 ? 'PM' : 'AM';
    final minute = dt.minute.toString().padLeft(2, '0');
    return '$month ${dt.day}, ${dt.year} — $hour12:$minute $period';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // ---------- Top App Bar ----------
            SliverAppBar(
              pinned: true,
              backgroundColor: AppColors.background,
              elevation: 0,
              leading: const Icon(Icons.lock_outline, size: 18, color: AppColors.textPrimary),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ProfileData.username,
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.keyboard_arrow_down, size: 18, color: AppColors.textPrimary),
                ],
              ),
              centerTitle: true,
              actions: const [
                Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Icon(Icons.add_box_outlined, color: AppColors.textPrimary),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 16.0),
                  child: Icon(Icons.menu, color: AppColors.textPrimary),
                ),
              ],
            ),

            // ---------- Profile Header ----------
            SliverToBoxAdapter(
              child: ProfileHeader(
                avatarProvider: _avatarProvider,
              ),
            ),

            SliverToBoxAdapter(
              child: ProfileTabs(
                selectedIndex: _selectedTab,
                onTabSelected: (index) => setState(() => _selectedTab = index),
              ),
            ),

            // ---------- Feed ----------
            // Order: About Me -> Skills -> Interactive "Click Me" post
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Column(
                  children: [
                    TextPostCard(
                      title: 'About Me',
                      icon: Icons.person_outline,
                      content: ProfileData.aboutMeContent,
                      time: '2 HOURS AGO',
                      likeCount: '47',
                      avatarProvider: _avatarProvider,
                    ),
                    TextPostCard(
                      title: 'Skills',
                      icon: Icons.code,
                      content: ProfileData.skillsContent,
                      time: '5 HOURS AGO',
                      likeCount: '112',
                      avatarProvider: _avatarProvider,
                    ),
                    InteractivePostCard(
                      avatarProvider: _avatarProvider,
                      onTap: _handleSingleTap,
                      onDoubleTap: _handleDoubleTap,
                      onLongPress: _handleLongPress,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(avatarProvider: _avatarProvider),
    );
  }
}


class ProfileHeader extends StatelessWidget {
  final ImageProvider avatarProvider;

  const ProfileHeader({
    super.key,
    required this.avatarProvider,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),

          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: AppColors.igGradient,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.background,
                  ),
                  child: CircleAvatar(
                    radius: 39,
                    backgroundColor: Colors.transparent,
                    backgroundImage: avatarProvider,
                  ),
                ),
              ),
              const SizedBox(width: 22),
              Expanded(child: StatItem(value: ProfileData.ageValue, label: 'Age')),
              Expanded(child: StatItem(value: ProfileData.sectionValue, label: 'Section')),
              Expanded(child: StatItem(value: ProfileData.programValue, label: 'Program')),
            ],
          ),
          const SizedBox(height: 12),

          // ---- Name + Bio ----
          Text(
            ProfileData.fullName,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            ProfileData.tagline,
            style: GoogleFonts.inter(color: AppColors.textPrimary, fontSize: 13),
          ),
          Text(
            ProfileData.subtitle,
            style: GoogleFonts.inter(color: AppColors.textSecondary, fontSize: 13),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.link, size: 13, color: AppColors.link),
              const SizedBox(width: 4),
              Text(
                ProfileData.website,
                style: GoogleFonts.inter(
                  color: AppColors.link,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),

          // ---- Follow / Message Buttons ----
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.link,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Text(
                    'Follow',
                    style: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 13),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.textPrimary,
                    side: const BorderSide(color: AppColors.divider),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Text(
                    'Message',
                    style: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 13),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.divider),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.person_add_alt, size: 18, color: AppColors.textPrimary),
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class StatItem extends StatelessWidget {
  final String value;
  final String label;

  const StatItem({super.key, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: GoogleFonts.inter(color: AppColors.textSecondary, fontSize: 12),
        ),
      ],
    );
  }
}



class ProfileTabs extends StatelessWidget {
  static const List<String> labels = ['Portfolio', 'About Me', 'Skill'];

  final int selectedIndex;
  final ValueChanged<int> onTabSelected;

  const ProfileTabs({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.background,
        border: Border(top: BorderSide(color: AppColors.divider)),
      ),
      child: Row(
        children: List.generate(labels.length, (index) {
          final bool active = selectedIndex == index;
          return Expanded(
            child: GestureDetector(
              onTap: () => onTabSelected(index),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: active ? AppColors.textPrimary : Colors.transparent,
                      width: 1.5,
                    ),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  labels[index],
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: active ? FontWeight.w700 : FontWeight.w500,
                    color: active ? AppColors.textPrimary : AppColors.textSecondary,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}



class BottomNavBar extends StatelessWidget {
  final ImageProvider avatarProvider;

  const BottomNavBar({super.key, required this.avatarProvider});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.background,
        border: Border(top: BorderSide(color: AppColors.divider)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Icon(Icons.home, color: AppColors.textPrimary),
          const Icon(Icons.search, color: AppColors.textSecondary),
          const Icon(Icons.add_box_outlined, color: AppColors.textSecondary),
          const Icon(Icons.favorite_border, color: AppColors.textSecondary),
          CircleAvatar(radius: 12, backgroundImage: avatarProvider),
        ],
      ),
    );
  }
}



class _PostHeader extends StatelessWidget {
  final ImageProvider avatarProvider;
  final Widget? trailingBadge;

  const _PostHeader({required this.avatarProvider, this.trailingBadge});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: [
          CircleAvatar(radius: 16, backgroundImage: avatarProvider),
          const SizedBox(width: 10),
          Expanded(
            child: Row(
              children: [
                Text(
                  ProfileData.username,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                    fontSize: 13,
                  ),
                ),
                if (trailingBadge != null) ...[
                  const SizedBox(width: 6),
                  trailingBadge!,
                ],
              ],
            ),
          ),
          const Icon(Icons.more_vert, color: AppColors.textPrimary, size: 20),
        ],
      ),
    );
  }
}



class _ReactionRow extends StatelessWidget {
  const _ReactionRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.favorite_border, color: AppColors.textPrimary, size: 24),
        const SizedBox(width: 14),
        const Icon(Icons.mode_comment_outlined, color: AppColors.textPrimary, size: 23),
        const SizedBox(width: 14),
        Transform.rotate(
          angle: -0.5,
          child: const Icon(Icons.send_outlined, color: AppColors.textPrimary, size: 22),
        ),
        const Spacer(),
        const Icon(Icons.bookmark_border, color: AppColors.textPrimary, size: 24),
      ],
    );
  }
}



class TextPostCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String content;
  final String time;
  final String likeCount;
  final ImageProvider avatarProvider;

  const TextPostCard({
    super.key,
    required this.title,
    required this.icon,
    required this.content,
    required this.time,
    required this.likeCount,
    required this.avatarProvider,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      margin: const EdgeInsets.only(bottom: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _PostHeader(avatarProvider: avatarProvider),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Card(
              color: AppColors.surface,
              elevation: 0,
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(color: AppColors.divider),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(icon, color: AppColors.link, size: 20),
                        const SizedBox(width: 8),
                        Text(
                          title,
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      content,
                      style: GoogleFonts.inter(
                        color: AppColors.textPrimary,
                        fontSize: 13,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: const _ReactionRow(),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 4),
            child: Text(
              '$likeCount likes',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
                fontSize: 13,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              time,
              style: GoogleFonts.inter(color: AppColors.textSecondary, fontSize: 11),
            ),
          ),
          const SizedBox(height: 14),
          const Divider(color: AppColors.divider, height: 1),
        ],
      ),
    );
  }
}



class InteractivePostCard extends StatelessWidget {
  final ImageProvider avatarProvider;
  final VoidCallback onTap;
  final VoidCallback onDoubleTap;
  final VoidCallback onLongPress;

  const InteractivePostCard({
    super.key,
    required this.avatarProvider,
    required this.onTap,
    required this.onDoubleTap,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _PostHeader(
            avatarProvider: avatarProvider,
            trailingBadge: const Icon(Icons.bolt, size: 14, color: Color(0xFFF58529)),
          ),

          AspectRatio(
            aspectRatio: 900 / 600,
            child: Image.asset('assets/images/post_preview.png', fit: BoxFit.cover),
          ),

          Card(
            margin: EdgeInsets.zero,
            color: AppColors.background,
            elevation: 0,
            shape: const RoundedRectangleBorder(),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _ReactionRow(),
                  const SizedBox(height: 10),
                  Text(
                    '58 likes',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 6),
                  RichText(
                    text: TextSpan(
                      style: GoogleFonts.inter(color: AppColors.textPrimary, fontSize: 13, height: 1.4),
                      children: const [
                        TextSpan(
                          text: 'jhon.fabiala  ',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        TextSpan(
                          text: 'Testing gesture events for my ITP107 Lab Exam 👇 '
                              'Tap, double tap, or long press the button below '
                              'and check the Debug Console for structured output.',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'JUST NOW',
                    style: GoogleFonts.inter(color: AppColors.textSecondary, fontSize: 11),
                  ),
                  const SizedBox(height: 16),

                  Center(
                    child: GestureDetector(
                      onTap: onTap,
                      onDoubleTap: onDoubleTap,
                      onLongPress: onLongPress,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: AppColors.igGradient,
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'Click Me',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            letterSpacing: 0.4,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: Text(
                      'Tap · Double Tap · Long Press → check Debug Console',
                      style: GoogleFonts.inter(color: AppColors.textSecondary, fontSize: 11),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 14),
          const Divider(color: AppColors.divider, height: 1),
        ],
      ),
    );
  }
}
