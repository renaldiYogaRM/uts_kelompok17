import 'package:flutter/material.dart';
import 'package:news_flutter/page_news/news_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  String strKategori = 'terbaru', strTitle = "Berita Terkini - ANTARA News";
  TabController? tabController;

  @override
  void initState() {
    //tab layout controller
    tabController = TabController(initialIndex: 0, length: 6, vsync: this);
    tabController!.addListener(() {
      switch (tabController!.index) {
        case 0:
          {
            setState(() {
              strKategori = 'terbaru';
              strTitle = "Berita Terkini - ANTARA News";
            });
            break;
          }
        case 1:
          {
            setState(() {
              strKategori = 'politik';
              strTitle = "Politik - ANTARA News";
            });
            break;
          }
        case 2:
          {
            setState(() {
              strKategori = 'hukum';
              strTitle = "Hukum - ANTARA News";
            });
            break;
          }
        case 3:
          {
            setState(() {
              strKategori = 'ekonomi';
              strTitle = "Ekonomi - ANTARA News";
            });
            break;
          }
        case 4:
          {
            setState(() {
              strKategori = 'bola';
              strTitle = "Sepakbola - ANTARA News";
            });
            break;
          }
        case 5:
          {
            setState(() {
              strKategori = 'humaniora';
              strTitle = "Humaniora - ANTARA News";
            });
            break;
          }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(249, 238, 238, 238),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(249, 238, 238, 238),
        elevation: 0,
        title: Row(
          children: [
            Image.asset(
              'assets/logo_umkt.png',
              width: 40,
              height: 40,
              //fit: BoxFit.fill,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              strTitle,
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ],
        ),
      ),
      body: Row(
        children: [
          RotatedBox(
            quarterTurns: 1,
            child: TabBar(
              controller: tabController,
              indicatorColor: Color.fromARGB(255, 21, 0, 255),
              labelColor: Color.fromARGB(255, 21, 0, 255),
              unselectedLabelColor: Colors.grey,
              tabs: [
                getItem(
                  icon: const Icon(
                    Icons.local_fire_department_sharp,
                  ),
                  text: const Text(
                    textAlign: TextAlign.center,
                    "Berita\nUtama",
                  ),
                ),
                getItem(
                  icon: const Icon(
                    Icons.style_outlined,
                  ),
                  text: const Text(
                    textAlign: TextAlign.center,
                    "Gaya\nHidup",
                  ),
                ),
                getItem(
                  icon: const Icon(
                    Icons.computer,
                  ),
                  text: const Text(
                    "Teknologi",
                  ),
                ),
                getItem(
                  icon: const Icon(
                    Icons.business_sharp,
                  ),
                  text: const Text(
                    "Bisnis",
                  ),
                ),
                getItem(
                  icon: const Icon(
                    Icons.sports_baseball_outlined,
                  ),
                  text: const Text(
                    "Olahraga",
                  ),
                ),
                getItem(
                  icon: const Icon(
                    Icons.motorcycle_sharp,
                  ),
                  text: const Text(
                    "Otomotif",
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: NewsPage(
              kategori: strKategori,
            ),
          )
        ],
      ),
    );
  }

  getItem({required Icon icon, required Text text}) {
    return RotatedBox(
      quarterTurns: -1,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [icon, text],
        ),
      ),
    );
  }
}
