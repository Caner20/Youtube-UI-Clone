import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_clone/data.dart';

class ShortsScreen extends StatefulWidget {
  static const String id = 'ShortsScreen';
  @override
  _ShortsScreenState createState() => _ShortsScreenState();
}

YTData ytData = YTData(); //veritabanini kullanmak icin nesne urettik

class _ShortsScreenState extends State<ShortsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
            itemCount: ytData.shortsList.length, //item sayacimiz veritabani boyutunca donücek
            itemBuilder: (context, index) {
              return ShortsList(  //shortlist'i dondur veritabanindan
                name: ytData.shortsList.values.elementAt(index).elementAt(0), //name i shorlstten gelen deger 0.indekse atıyoruz
                profilePic:
                ytData.shortsList.values.elementAt(index).elementAt(1), //nesneyi dondur indeksten gelen degeri bul 1.indekse ata
                vid: ytData.shortsList.values.elementAt(index).elementAt(2),  //gif'i ayarladik
                caption: ytData.shortsList.values.elementAt(index).elementAt(3),  //alttaki yazinin degerini dondurduk
                likes: ytData.shortsList.values.elementAt(index).elementAt(4),  //..
                comments:
                ytData.shortsList.values.elementAt(index).elementAt(5),   //..
              );
            }),
      ),
    );
  }
}

class ShortsList extends StatefulWidget {
  final String name;
  final String profilePic;
  final String vid;
  final String caption;
  final String likes;
  final String comments;
  ShortsList(
      {required this.name,
        required this.caption,
        required this.comments,
        required this.likes,
        required this.vid,
        required this.profilePic});

  @override
  _ShortsListState createState() => _ShortsListState();
}

class _ShortsListState extends State<ShortsList> {
  bool isLike = false;   //begeni degerini ilk basta false ayarladik
  bool isDislike = false; //begenme degerini ilk basta false ayarladik

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;  //oynaticiyi aldığı baglam uzerinde genisligini alıp double w ye atadik
    double h = MediaQuery.of(context).size.height;  //oynaticiyi aldığı baglam uzerinde yuksekligini alıp double h

    return Stack(
      children: [
        Container(
          width: w,  //genisligini getirdik
          height: h,  //yuksekligin getirdik h field'i ile
          child: Image.asset(
            widget.vid,
            fit: BoxFit.cover, //koydugumuz widget'i gorsele kapsamasini sagladik
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 25.0, left: 15.0, right: 15, bottom: 8),  //kenar boslukları ekledi
          //yukaridan 25px , soldan 15px , sagdan 15px , asağidan 8px
          child: Column(
            children: [
              Row(   //satir hizalama icin
                mainAxisAlignment: MainAxisAlignment.spaceBetween, //hizalamayi belli bosluklu yaptık
                children: [
                  GestureDetector(  //hareket sistemini
                    onTap: () {
                      Navigator.pop(context);  //basildiginda geri gitmesi icin (pop) girilen parametreye
                    },
                    child: Icon(    //sensore icon eklemek icin widget cagirdik
                      Icons.arrow_back_rounded,  //icona degerini veridk
                      color: Colors.white,      //rengini beyaz
                      size: 32,                 //boyutunu 32 olarak ayarladik
                    ),
                  ),
                  Icon(  //kamere iconu icin
                    Icons.camera_alt_outlined,
                    color: Colors.white,
                    size: 32,
                  )
                ],
              ),
              SizedBox(
                height: h * 0.275, //boyutunu ayarlamak icin yuksekligini  0.275 le carptik degerini dusurduk
              ),
              Row(   //yatay hizalamada
                mainAxisAlignment: MainAxisAlignment.end,  //hizalamayı en sona yaptik
                children: [
                  Container(
                    child: Column(  //dikey hizalama da
                      children: [
                        Icon(  //icon widgeti ekledik
                          CupertinoIcons.ellipsis,//... icin ikon
                          color: Colors.white,   //rengi beyaz
                          size: 30,           //boyutu 30px
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(   //boyut kutusu widgeti
                height: 28,  //yuksekligi 28px
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(   //hareket algilayicisi widget'i
                    onTap: () {   //basildiginda sunlari yap
                      setState(() {  //durumunu
                        isLike = !isLike;  //like 'in tersi yap ve tekrar like ata
                      });
                    },
                    child: Container(
                      child: Column(
                        children: [
                          Icon(
                            Icons.thumb_up,  //begenme dusu icin icon
                            color: isLike ? Colors.blue : Colors.white,  //eger like ise mavi degil ise beyaz yap rengini
                            size: 30,  //boyutu 30px
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.likes,  //widget.likes ı geirdik text olarak
                            style: TextStyle( //yazi sitilini
                              color: Colors.white,  //rengini beyaz
                              fontSize: 16,      //yazi boyutunu 16
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 28,
              ),
              Row(  //yatay hizalama da
                mainAxisAlignment: MainAxisAlignment.end,  //hizalama konumu en son
                children: [
                  GestureDetector(  // hareket algilayicisi widget'i
                    onTap: () {
                      setState(() {   //Basildiginda durumunu dislike botununun tersi olarak geri ata
                        isDislike = !isDislike;
                      });
                    },
                    child: Container(
                      child: Column(
                        children: [
                          Icon(
                            Icons.thumb_down,  //dislike iconu
                            color: isDislike ? Colors.blue : Colors.white,  //eger basildiginda true olursa mavi : beyaz yaptik
                            size: 30, //boyutu 30
                          ),
                          SizedBox(
                            height: 10,  //kutu boyutunun yuksekligi 10px
                          ),
                          Text(
                            'Dislike',    //yazi olarak 'dislike atadik'
                            style: TextStyle(  //yazi sitilinin
                              color: Colors.white,  //rengini beyaz
                              fontSize: 16,      //yazı boyutunu 16 olarak ayarladik
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(  //altaki icin yukseklik kutusu ayarladik 28px
                height: 28,
              ),
              Row( //yatay hizalamda en sona atadik
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      child: Column(
                        children: [
                          Icon(
                            Icons.message_rounded,  //mesaj iconu
                            color: Colors.white,
                            size: 30,
                          ),
                          SizedBox(  //yuksekligi 10px
                            height: 10,
                          ),
                          Text(
                            widget.comments,   //yorumlar widget'i
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 28,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      child: Column(
                        children: [
                          Icon(
                            CupertinoIcons.arrowshape_turn_up_right_fill,  //gonder butonu iconu CupertinoIcons sinifindan
                            color: Colors.white,
                            size: 30,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Share', //texi olarak share atadik
                            style: TextStyle(
                              color: Colors.white, //beyaz
                              fontSize: 16, //boyutu 16
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(  //boyut kutusu widget'i 10px
                height: 10, //
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, //aralarinda orantılı bosluk olucak
                children: [
                  Container(
                    width: w * 0.6,   //genisligi atanan w*0.6 kadar
                    child: Column( //dusey sutun
                      crossAxisAlignment: CrossAxisAlignment.start,   //yatay hizalamasi icin baslangic yeri
                      children: [
                        Text(
                          widget.caption,  //altyazi widget'i
                          style: TextStyle(  //yazı sitili
                            color: Colors.white,  //rengi beyaz
                            fontSize: 18,   //yazi tipi boyutu 18
                          ),
                        ),
                        SizedBox(       //avatar icin boyut kutusu yukseklik 10px
                          height: 10,
                        ),
                        Row(
                          children: [
                            CircleAvatar(  //daire avatar widget'i
                              radius: 15,  //kenar yumusamasi 15px
                              backgroundColor: Colors.white,  //arka plan rengi beyaz
                              child: CircleAvatar(  //cocuk widget
                                radius: 12.5,
                                backgroundImage: AssetImage(widget.profilePic), //arka plan resmi
                                // asset ve database de tanimlanan profilePic widget'i cagirdik
                              ),
                            ),
                            SizedBox(  //text'i icin kutu genisligi 8 px
                              width: 8,
                            ),
                            Text(
                              widget.name,   //widget.name ile database den ismini getirdik
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 36,
                    width: 36,
                    color: Colors.white,
                    child: Stack(  //arka arkaya gelicek icerikler icin
                      children: [
                        Center(
                          child: Container(
                            height: 32,  //daha kucuk oranlar aralarda gecis griligi var
                            width: 32,
                            child: Image.asset(  //ımage.asset uzantısından.gif leri cekiyor
                              'dosyalar/images/',
                              fit: BoxFit.cover,  //kutumuza uygun siperliyor kendini
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}




