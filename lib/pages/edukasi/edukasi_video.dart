import 'package:flutter/material.dart';
import 'package:reproeduser/pages/edukasi/edukasi_artikel.dart';
import 'package:reproeduser/pages/route/route_context.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import '../home/home.dart';
import '../models/edukasi_models.dart';
import '../widgets/theme.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  final List<String> _videoList = [
    'assets/videos/edukasi/exmpale.mp4',
    'assets/videos/edukasi/exmpale.mp4',
    'assets/videos/edukasi/exmpale.mp4',
    'assets/videos/edukasi/exmpale.mp4',
    'assets/videos/edukasi/exmpale.mp4',
    'assets/videos/edukasi/exmpale.mp4',
  ];

  // ADDING VIDEO YA (JANGAN DI COMMENT YANG ATAS KALO GAMAU EROR HEHEHE 🙏🙏🙏🙏)

  int _currentVideoIndex = 0;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer(_videoList[_currentVideoIndex]);
  }

  Future<void> _initializeVideoPlayer(String videoPath) async {
    _videoPlayerController = VideoPlayerController.asset(videoPath);

    try {
      await _videoPlayerController.initialize();
      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        aspectRatio: _videoPlayerController.value.aspectRatio,
        looping: true,
      );

      setState(() {});
    } catch (error) {
      // ignore: avoid_print
      print('Error initializing video player: $error');
    }
  }

  void _playVideo(String videoPath) async {
    await _videoPlayerController.dispose();
    _chewieController?.dispose();
    await _initializeVideoPlayer(videoPath);
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Video Edukasi',
          style: boldBlackTextStyle.copyWith(fontSize: 15),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: Colors.black,
            ),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Home()),
            );
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.pushReplacement(
                        EdukasiArtikel(listEdukasi: listEdukasi));
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: Colors.teal[600],
                    minimumSize: const Size(115, 25),
                  ),
                  child: Text(
                    'Artikel',
                    style: mediumWhiteTextStyle.copyWith(fontSize: 12),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: Colors.teal[600],
                    minimumSize: const Size(115, 25),
                  ),
                  child: Text(
                    'Video Edukasi',
                    style: mediumWhiteTextStyle.copyWith(fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: _chewieController != null &&
                      _chewieController!
                          .videoPlayerController.value.isInitialized
                  ? Chewie(
                      controller: _chewieController!,
                    )
                  : const CircularProgressIndicator(),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: _videoList.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  margin:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Video ${index + 1}'),
                        const SizedBox(height: 12),
                        const Text(
                            maxLines: 3,
                            'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliqui p ex ea commodo  con')
                      ],
                    ),
                    contentPadding: const EdgeInsets.all(8),
                    onTap: () {
                      setState(() {
                        _currentVideoIndex = index;
                        _playVideo(_videoList[_currentVideoIndex]);
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
