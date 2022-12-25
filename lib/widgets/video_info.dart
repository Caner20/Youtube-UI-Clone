import 'package:flutter/material.dart';
import 'package:youtube_clone/data.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:youtube_clone/data.dart';

class VideoInfo extends StatelessWidget {
  final Video video;

  const VideoInfo({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0), //dis cevre boslugu 16px
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            video.title,
            style:
                Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 15.0),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            '${video.viewCount} views · ${timeago.format(video.timestamp)}',
            style:
                Theme.of(context).textTheme.caption!.copyWith(fontSize: 14.0),
          ),
          const Divider(), //videonun altındaki bosluk
          _ActionRow(video: video),
          const Divider(),
          _AuthorInfo(user: video.author) //videonun yazarini getiren method
        ],
      ),
    );
  }
}

class _ActionRow extends StatelessWidget {
  final Video video;

  const _ActionRow({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      //aralarinda belli bosluklu ayirdik
      children: [
        _buildAction(context, Icons.thumb_up_outlined, video.likes),
        //begen butonu
        _buildAction(context, Icons.thumb_up_outlined, video.dislikes),
        _buildAction(context, Icons.reply_outlined, 'Share'),
        _buildAction(context, Icons.download_outlined, 'Download'),
        _buildAction(context, Icons.library_add_outlined, 'Save'),
      ],
    );
  }

  Widget _buildAction(BuildContext context, IconData icon, String label) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        mainAxisSize: MainAxisSize.min, //boyutunu min ayarladik
        children: [
          Icon(icon),
          const SizedBox(height: 6.0), //cerceve tanimladik
          Text(
            label,
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(color: Colors.white), //beyaz
          ),
        ],
      ),
    );
  }
}

class _AuthorInfo extends StatelessWidget {
  final User user;

  const _AuthorInfo({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>print('Navigate to profile'),
      child: Row(
        children: [
          CircleAvatar(
            //avatar icin
            foregroundImage: NetworkImage(
                user.profileImageUrl), //on yuzunu network ımage le cektik
          ),
          const SizedBox(
            width: 8.0,
          ), //avatarla text lerin arasindaki bosluk
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                    child: Text(
                  user.username, //kullanicinin kullanici adini getir
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 15.0),
                )),
                Flexible(
                  child: Text(
                    '${user.subscribers} subscribers ',
                    // kullanicinin abonelerini getir
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontSize: 14.0),
                  ),
                ),
              ],
            ),
          ),
          TextButton(  //SUBSCRIBE BUTONU ICIN
            onPressed: () {},
            child: Text(
              'SUBSCRIBE',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.red),
            ),
          )
        ],
      ),
    );
  }
}
