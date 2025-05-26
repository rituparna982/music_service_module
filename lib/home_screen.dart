import 'package:flutter/material.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<String> _titles = ['Home', 'News', 'TrackBox', 'Projects'];
  final List<IconData> _icons = [
    Icons.home,
    Icons.newspaper,
    Icons.music_note,
    Icons.shopping_bag_outlined,
  ];

  final List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages.addAll([
      _homeContent(),
      _newsContent(),
      _trackBoxContent(),
      _projectsContent(),
    ]);
  }

  final List<ServiceCardData> services = [
    ServiceCardData(
      title: 'Music Production',
      subtitle: 'Custom instrumentals & film scoring',
      iconPath: 'assets/music.png',
      bgPath: 'assets/bg_music.jpeg',
    ),
    ServiceCardData(
      title: 'Mixing & Mastering',
      subtitle: 'Make your tracks Radio-ready',
      iconPath: 'assets/mix.png',
      bgPath: 'assets/bg_mixing.jpeg',
    ),
    ServiceCardData(
      title: 'Lyrics Writing',
      subtitle: 'Turn feelings into lyrics',
      iconPath: 'assets/lyrics.png',
      bgPath: 'assets/bg_lyrics.jpg',
    ),
    ServiceCardData(
      title: 'Vocals',
      subtitle: 'Vocals that bring your lyrics to life',
      iconPath: 'assets/vocals.png',
      bgPath: 'assets/bg_vocals.jpeg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFA90140), Color(0xFF550120)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: AppBar(
            title: Text('Music Services', style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
          ),
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        color: Colors.grey[900],
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(_titles.length, (index) {
            bool isSelected = _selectedIndex == index;
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    _icons[index],
                    color: isSelected ? Color(0xFFA90140) : Colors.white70,
                  ),
                  SizedBox(height: 4),
                  Text(
                    _titles[index],
                    style: TextStyle(
                      color: isSelected ? Color(0xFFA90140) : Colors.white70,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _homeContent() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFA90140), Color(0xFF550120)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          padding: EdgeInsets.all(16),
          child: _topHeader(),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(16),
            color: Colors.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hire hand-picked Pros for popular music services",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: services.length,
                    itemBuilder: (context, index) {
                      return ServiceCard(service: services[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _topHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.search, color: Colors.white70),
                    hintText: "Search 'Punjabi Lyrics'",
                    hintStyle: TextStyle(color: Colors.white54),
                    border: InputBorder.none,
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(width: 10),
            CircleAvatar(
              backgroundColor: Colors.purple,
              child: Icon(Icons.person, color: Colors.white),
            ),
          ],
        ),
        SizedBox(height: 30),
        Center(
          child: Column(
            children: [
              Text("Claim your", style: TextStyle(fontSize: 18, color: Colors.white)),
              Text("Free Demo",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
              Text("for custom Music Production", style: TextStyle(color: Colors.white70)),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                child: Text("Book Now", style: TextStyle(color: Colors.black)),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _newsContent() {
    return Container(
      color: Colors.black,
      alignment: Alignment.center,
      child: Text(
        'Latest music industry news and updates.',
        style: TextStyle(fontSize: 18.0, color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _trackBoxContent() {
    return Container(
      color: Colors.black,
      alignment: Alignment.center,
      child: Text(
        'Your personal space to manage tracks and ideas.',
        style: TextStyle(fontSize: 18.0, color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _projectsContent() {
    return Container(
      color: Colors.black,
      alignment: Alignment.center,
      child: Text(
        'Manage your ongoing music projects.',
        style: TextStyle(fontSize: 18.0, color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class ServiceCardData {
  final String title, subtitle, iconPath, bgPath;
  ServiceCardData({
    required this.title,
    required this.subtitle,
    required this.iconPath,
    required this.bgPath,
  });
}

class ServiceCard extends StatelessWidget {
  final ServiceCardData service;
  const ServiceCard({required this.service});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => DetailScreen(serviceName: service.title)),
        );
      },
      child: Container(
        height: 60,
        margin: EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(service.bgPath),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken),
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            SizedBox(width: 16),
            CircleAvatar(
              backgroundColor: Colors.white24,
              child: Image.asset(service.iconPath, height: 20, width: 20),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(service.title,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                  Text(service.subtitle, style: TextStyle(fontSize: 12, color: Colors.white70)),
                ],
              ),
            ),
            Icon(Icons.play_arrow, size: 16, color: Colors.white),
            SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}
