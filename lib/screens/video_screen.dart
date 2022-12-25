import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:youtube_clone/data.dart';
import 'package:youtube_clone/screens/nav_screens.dart';
import 'package:youtube_clone/widgets/video_card.dart';
import 'package:youtube_clone/widgets/video_info.dart';

class VideoScreen extends StatefulWidget {
  VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  ScrollController? _scrollController;
  @override

  void initState(){ //scrollcontrolleri yeniden build icin
    super.initState();
    _scrollController=ScrollController();
  }

  void dispose(){  //duzenleyici yapilandirmak icin
    _scrollController?.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> context.read(miniPlayerControllerProvider).state.animateToHeight(state: PanelState.MAX),
        //basildiginda mini playeri okur durumu animasyon seklinde panelin max goruntusune ayarlar
      child: Scaffold(
        body: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: CustomScrollView(
            controller: _scrollController,
            shrinkWrap: true,
            slivers: [
              SliverToBoxAdapter(
                child: Consumer(
                  builder: (context, watch, _) {
                    final selectedVideo = watch(selectedVideoProvider).state;
                    return SafeArea(
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Image.network(
                                selectedVideo!.thumbnailUrl,
                                height: 220.0,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              IconButton(
                                icon: const Icon(Icons.keyboard_arrow_down),
                                onPressed: () => context
                                    .read(miniPlayerControllerProvider)
                                    .state
                                    .animateToHeight(
                                        state: PanelState
                                            .MIN), //butona basıldıgında video controlleri panetlin durumunun minumum degerine ayarlar
                              ),
                            ],
                          ),
                          const LinearProgressIndicator(
                            value: 0.4,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.red,
                            ), //kırmızı bi cizgi goruntusu
                          ),
                          VideoInfo(video: selectedVideo),
                          //secilen videonun video bigilerini getiren method
                        ],
                      ),
                    );
                  },
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate( //alt videolari listelemek icin
                  (context, index) {
                    final video = suggestedVideos[index];  //
                    return VideoCard(video: video,hasPadding:true,// cerceveleri etkinlestirdik
                    onTap: ()=> _scrollController!.animateTo(0, duration: const Duration(milliseconds: 200), curve: Curves.easeIn,),
                        //onerilen videolari 200 ms bekleyerek yeni videoyu acmak
                    );
                  },
                  childCount: suggestedVideos.length, //data da tutulan videolar kadar donucek
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
