import 'package:flutter/material.dart';
import 'package:youtube_clone/data.dart';
import 'package:youtube_clone/widgets/widgets.dart';


class HomeScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
          slivers: [
          CustomSliverAppBar(),
          SliverPadding(
            padding: const EdgeInsets.only(bottom:60.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
              final video =videos[index];
              return VideoCard(video:video);
            },
                childCount: videos.length,
            ),
            ),
          ),
        ],
      ),
    );
  }

}
