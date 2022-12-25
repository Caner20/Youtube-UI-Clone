import 'package:flutter/material.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:youtube_clone/data.dart';
import 'package:youtube_clone/screens/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/screens/shorts.screen.dart';
import 'package:youtube_clone/screens/video_screen.dart';

final selectedVideoProvider = StateProvider<Video?>((ref) => null);

final miniPlayerControllerProvider =StateProvider.autoDispose<MiniplayerController>(
        (ref)=> MiniplayerController(),
);
//kucuk oynayici controller tanimladik MiniplayerController dondurucek

class NavScreen extends StatefulWidget {
  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  static const double _playerMinHeight =
      60.0; //mini oynaticinin minumum yukseklik

  int _selectedIndex = 0; //secienindeks baslangic degeri 0 olarak atadik

  final _screens = [    //sonradan degeri degismicek ekranlar ozelligi
    HomeScreen(),  //ana sayfa ekranini cagirdik
    ShortsScreen(), //shorts ekranini cagirdik
    //const Scaffold(body: Center(child: Text('En iyisi bu'))),
    //const Scaffold(body: Center(child: Text('Shorts'))),
    const Scaffold(body: Center(child: Text('Add'))),
    const Scaffold(body: Center(child: Text('Subscriptions'))),
    const Scaffold(body: Center(child: Text('Library'))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, watch, _) {
          final selectedVideo = watch(selectedVideoProvider).state; //izlenen secili video saglayicisin durumunu guncelle videoya at
          final miniPlayerController=watch(miniPlayerControllerProvider).state;
          //controllerin durumunu state yaptık ve degiskene atadik
          return Stack(
            children: _screens
                .asMap()
                .map((i, screen) => MapEntry(
                      //harita girisi girilen i
                      i,
                      Offstage(
                        offstage: _selectedIndex != i,
                        //sahne dişinda secili i olmadiginda
                        child: screen,
                      ),
                    ))
                .values
                .toList()
              ..add(
                Offstage(
                  offstage: selectedVideo==null,  //ilk basta null atadik alt kodda veri gelicek
                  child: Miniplayer(
                    controller: miniPlayerController,
                    minHeight: _playerMinHeight,
                    maxHeight: MediaQuery.of(context).size.height,
                    builder: (height, percentage) {
                      if(selectedVideo == null)  //eger secilen video yoksa null olsun
                        return const SizedBox.shrink();   //gizlensin

                      if(height<= _playerMinHeight+50.0) //eger yukseklik kucukse min degere 50px ekle
                      return Container(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        child: Column(
                          children: [
                            Row(children: [
                              Image.network(
                                selectedVideo.thumbnailUrl,height: _playerMinHeight -4.0,
                                  width: 120.0,  //secilen video url (Image) ve yuksekligini verdik
                                  fit: BoxFit.cover,  //navbara siperlenmesini istedik
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Flexible(child: Text(selectedVideo.title,  //secilen videonun ismini getir
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      )
                                      ),
                                      Flexible(
                                        child: Text(
                                          selectedVideo.author.username, //secilen videonun kullanici ismini getir
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context).textTheme.caption!.copyWith(fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      //kullanici adini getirir
                                    ],
                                  ),
                                ),
                              ),
                              IconButton(   //play butonu ekledik
                                icon: const Icon(
                                    Icons.play_arrow) ,
                                    onPressed: (){},
                              ),IconButton(   //kapatma butonu ekledik
                                icon: const Icon(
                                    Icons.close) ,
                                    onPressed: (){  //bu tusa basildiginda
                                    context  //context parametresini
                                        .read(selectedVideoProvider)  //okuyucu secildiginde
                                        .state=null;    //durumunu null yap
                                    },
                              ),
                            ],
                            ),
                          const LinearProgressIndicator(
                            value: 0.4,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.red,
                            ), //kırmızı bi cizgi goruntusu
                          ),
                        ],
                        ),
                      );
                      return VideoScreen();
                    },
                  ),
                ),
              ),
          );
        },
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        //barin tipini  sabit olarak ayaladik
        currentIndex: _selectedIndex,
        //secilen indeksi suanki indekse atadik
        onTap: (i) => setState(() => _selectedIndex = i),
        //secilen indeksi setstate yaptik
        selectedFontSize: 10.0,
        //secilen indeksin yazi boyutunu 10 px
        unselectedFontSize: 5.0,
        //secilmeyem indeksin yazi boyutunu 5 px
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.short_text),
            activeIcon: Icon(Icons.short_text),
            label: "Shorts",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            activeIcon: Icon(Icons.add_circle),
            label: "Add",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions_outlined),
            activeIcon: Icon(Icons.subscriptions),
            label: "Subscriptions",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library_outlined),
            activeIcon: Icon(Icons.video_library),
            label: "Library",
          ),
        ],
      ),
    );
  }
}
