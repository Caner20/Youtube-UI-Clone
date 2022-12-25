import 'package:flutter/material.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:youtube_clone/data.dart';
import 'package:youtube_clone/screens/nav_screens.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VideoCard extends StatelessWidget {
  final Video video;
  final bool hasPadding;
  final VoidCallback? onTap;  //geri dondurmeyen tiklandiginda

  const VideoCard({super.key, required this.video,this.hasPadding=false,this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read(selectedVideoProvider).state=video; //basildiginda secilen videoyu okuyucu getirsin durumunu videoyla guncelle
        context.read(miniPlayerControllerProvider).state.animateToHeight(state: PanelState.MAX);
        //controller'a animasyon tanimladik durumunu panel durumuna maksimum yukseklikte yapicak
        if(onTap!=null) onTap!();//tıklanmadiginda pasif
      },
      child: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(
                    horizontal: hasPadding ? 12.0:0,),  //yatay olarak simetrik hizaladik 12px
                child: Image.network(
                  video.thumbnailUrl,
                  height: 220.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 8.0,
                right: hasPadding ? 20.0: 8.0,
                child: Container(
                  padding: const EdgeInsets.all(4.0),
                  color: Colors.black,
                  child: Text(
                    video.duration,
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => print('Navigate of Profile'),
                  child: CircleAvatar(
                    foregroundImage: NetworkImage(video.author.profileImageUrl),
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                    Flexible(child: Text(video.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 15.0),
                    )
                    ),
                    Flexible(
                      child: Text(
                        '${video.author.username} · ${video.viewCount} views · ${timeago.format(video.timestamp)} ', //video basligini-hangisin gorundugunu-kac dakika-ve kac sure once yuklendi
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 14.0),
                      ),
                    ),
                    //kullanici adini getirir
                  ],
                  ),
                ),
                GestureDetector(  //hareket dedektoru
                onTap : () {},  //dokunuldugunda
                child :Icon(Icons.more_vert,size: 20.0)  //secenek butonunun boyutunu ve kendisin verdik
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
