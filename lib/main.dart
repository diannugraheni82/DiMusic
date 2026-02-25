import 'package:flutter/material.dart';

void main() {
  runApp(const DiMusic());
}

class DiMusic extends StatelessWidget {
  const DiMusic({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const DiMusicAlbum(),
    );
  }
}

class DiMusicAlbum extends StatelessWidget {
  const DiMusicAlbum({super.key});

  final List<Map<String, String>> songs = const [
    {"title": "Janji Palsu", "artist": "Hindia"},
    {"title": "Matahari Tenggelam", "artist": "Hindia"},
    {"title": "Satu Hari Lagi", "artist": "Hindia"},
    {"title": "Kami Khawatir, Kawan", "artist": "Hindia"},
    {"title": "Bunuh Idolamu", "artist": "Hindia"},
    {"title": "Forgot Password", "artist": "Hindia, Nadin Amizah"},
    {"title": "Masalah Masa Depan", "artist": "Hindia"},
    {"title": "Jangan Jadi Pahlawan", "artist": "Hindia, Teddy Adhitya"},
    {"title": "Nabi Palsu", "artist": "Hindia"},
    {"title": "WAWANCARA LIAR PT.2", "artist": "Hindia, Matter Mos"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 420,
            pinned: true,
            backgroundColor: Color.fromARGB(255, 52, 80, 124),
            leading: const Icon(Icons.arrow_back),
            title: const Text("Lagipula Hidup Akan Berakhir", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            centerTitle: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color.fromARGB(255, 52, 80, 124), Colors.black],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 60),
                    Container(
                      height: 220,
                      width: 220,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(color: Colors.black54, blurRadius: 30, offset: Offset(0, 10))
                        ],
                        image: const DecorationImage(image: AssetImage("assets/cover.jpg"),fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Lagipula Hidup Akan Berakhir", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                SizedBox(width: 8),
                                Text("Hindia - Album • 2023", style: TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final song = songs[index];
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  title: Text(song['title']!, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
                  subtitle: Text(song['artist']!, style: const TextStyle(color: Colors.grey, fontSize: 13)),
                  trailing: const Icon(Icons.more_vert, color: Colors.grey),
                  onTap: () {},
                );
              },
              childCount: songs.length,
            ),
          ),
        ],
      ),
    );
  }
}