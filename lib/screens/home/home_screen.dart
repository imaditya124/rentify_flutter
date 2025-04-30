import 'package:flutter/material.dart';
import 'package:rentify/config/routes.dart';
import 'package:rentify/screens/account/account_screen.dart';
import 'package:rentify/screens/chat/chat_list.dart';
import 'package:rentify/screens/create_ad/create_ad_screen.dart';
import 'package:rentify/screens/my_ads/my_ads_screen.dart';
import 'package:rentify/widgets/bottom_nav_bar.dart';
import 'package:rentify/widgets/property_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const PropertyListScreen(),
    const ChatListScreen(),
    const CreateAdScreen(),
    const MyAdsScreen(),
    const AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}

class PropertyListScreen extends StatelessWidget {
  const PropertyListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: const Text('Rentify'),
          floating: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {},
            ),
          ],
        ),
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) => const PropertyCard(),
              childCount: 10,
            ),
          ),
        ),
      ],
    );
  }
}