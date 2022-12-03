import 'package:flutter/material.dart';
import 'package:takemeout/utils/project_variables.dart';
import 'package:takemeout/views/chat_page_tab.dart';
import 'package:takemeout/views/home_page_tab.dart';
import 'package:takemeout/views/map_page_tab.dart';
import 'package:takemeout/views/profile_page_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        bottomNavigationBar: BottomAppBar(
          notchMargin: 10,
          shape: const CircularNotchedRectangle(),
          child: TabBar(
            indicatorColor: ProjectColors.splashColor,
            labelColor: ProjectColors.labelColor,
            controller: _tabController,
            tabs: const [
              Tab(
                text: 'Home',
              ),
              Tab(text: 'Map'),
              Tab(
                text: 'Chat',
              ),
              Tab(text: 'Profile')
            ],
          ),
        ),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
          title: const Text(
            'Take Me Out',
            style: ProjectStyles.titleStyle,
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const [
            HomePageTab(),
            MapPageTab(),
            ChatPageTab(),
            ProfilePageTab(),
          ],
        ),
      ),
    );
  }
}
