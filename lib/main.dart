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
            backgroundColor: const Color.fromARGB(255, 52, 80, 124),
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
                        image: const DecorationImage(image: AssetImage("assets/cover.jpg"), fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Lagipula Hidup Akan Berakhir", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                          SizedBox(height: 10),
                          Text("Hindia - Album • 2023", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white70)),
                        ],
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
                  onTap: () {
                    // NAVIGASI KE HALAMAN PLAYER
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlayerScreen(songTitle: song['title']!, artist: song['artist']!),
                      ),
                    );
                  },
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

class PlayerScreen extends StatelessWidget {
  final String songTitle;
  final String artist;

  const PlayerScreen({super.key, required this.songTitle, required this.artist});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2B3A67), Colors.black], 
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.keyboard_arrow_down, size: 35)),
                  const Column(
                    children: [
                      Text("MEMAINKAN DARI ALBUM", style: TextStyle(fontSize: 10, letterSpacing: 1.2)),
                      Text("Lagipula Hidup Akan Berakhir", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                    ],
                  ),
                  const Icon(Icons.more_vert),
                ],
              ),
              const Spacer(),
              Container(
                height: 350,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(image: AssetImage("assets/cover.jpg"), fit: BoxFit.cover),
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(songTitle, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      Text(artist, style: const TextStyle(fontSize: 16, color: Colors.white70)),
                    ],
                  ),
                  const Icon(Icons.add_circle_outline, size: 30),
                ],
              ),
              const SizedBox(height: 20),
              const LinearProgressIndicator(value: 0.4, backgroundColor: Colors.white24, valueColor: AlwaysStoppedAnimation(Colors.white)),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("1:52", style: TextStyle(fontSize: 12, color: Colors.grey)),
                  Text("4:33", style: TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.shuffle, color: Colors.green),
                  const Icon(Icons.skip_previous, size: 45),
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                    child: const Icon(Icons.play_arrow, color: Colors.black, size: 35),
                  ),
                  const Icon(Icons.skip_next, size: 45),
                  const Icon(Icons.timer_outlined),
                ],
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.devices, size: 20, color: Colors.white70),
                  Row(
                    children: [
                      Icon(Icons.share_outlined, size: 20, color: Colors.white70),
                      SizedBox(width: 20),
                      Icon(Icons.queue_music, size: 20, color: Colors.white70),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}