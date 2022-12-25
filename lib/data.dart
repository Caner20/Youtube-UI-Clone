class User {
  final String username;
  final String profileImageUrl;
  final String subscribers;

  const User({
    required this.username,
    required this.profileImageUrl,
    required this.subscribers,
  });
}

const User currentUser = User(
  username: 'Marcus Ng',
  profileImageUrl:
  'https://yt3.ggpht.com/ytc/AAUvwniE2k5PgFu9yr4sBVEs9jdpdILdMc7ruiPw59DpS0k=s88-c-k-c0x00ffffff-no-rj',
  subscribers: '100K',
);

class Video {
  final String id;
  final User author;
  final String title;
  final String thumbnailUrl;
  final String duration;
  final DateTime timestamp;
  final String viewCount;
  final String likes;
  final String dislikes;

  const Video({
    required this.id,
    required this.author,
    required this.title,
    required this.thumbnailUrl,
    required this.duration,
    required this.timestamp,
    required this.viewCount,
    required this.likes,
    required this.dislikes,
  });
}

final List<Video> videos = [
  Video(
    id: 'x606y4QWrxo',
    author: currentUser,
    title: 'Flutter Clubhouse Clone UI Tutorial | Apps From Scratch',
    thumbnailUrl: 'https://i.ytimg.com/vi/x606y4QWrxo/0.jpg',
    duration: '8:20',
    timestamp: DateTime(2021, 3, 20),
    viewCount: '10K',
    likes: '958',
    dislikes: '4',
  ),
  Video(
    author: currentUser,
    id: 'vrPk6LB9bjo',
    title:
    'Build Flutter Apps Fast with Riverpod, Firebase, Hooks, and Freezed Architecture',
    thumbnailUrl: 'https://i.ytimg.com/vi/vrPk6LB9bjo/0.jpg',
    duration: '22:06',
    timestamp: DateTime(2021, 2, 26),
    viewCount: '8K',
    likes: '485',
    dislikes: '8',
  ),
  Video(
    id: 'ilX5hnH8XoI',
    author: currentUser,
    title: 'Flutter Instagram Stories',
    thumbnailUrl: 'https://i.ytimg.com/vi/ilX5hnH8XoI/0.jpg',
    duration: '10:53',
    timestamp: DateTime(2020, 7, 12),
    viewCount: '18K',
    likes: '1k',
    dislikes: '4',
  ),
];

final List<Video> suggestedVideos = [
  Video(
    id: 'rJKN_880b-M',
    author: currentUser,
    title: 'Flutter Netflix Clone Responsive UI Tutorial | Web and Mobile',
    thumbnailUrl: 'https://i.ytimg.com/vi/rJKN_880b-M/0.jpg',
    duration: '1:13:15',
    timestamp: DateTime(2020, 8, 22),
    viewCount: '32K',
    likes: '1.9k',
    dislikes: '7',
  ),
  Video(
    id: 'HvLb5gdUfDE',
    author: currentUser,
    title: 'Flutter Facebook Clone Responsive UI Tutorial | Web and Mobile',
    thumbnailUrl: 'https://i.ytimg.com/vi/HvLb5gdUfDE/0.jpg',
    duration: '1:52:12',
    timestamp: DateTime(2020, 8, 7),
    viewCount: '190K',
    likes: '9.3K',
    dislikes: '45',
  ),
  Video(
    id: 'h-igXZCCrrc',
    author: currentUser,
    title: 'Flutter Chat UI Tutorial | Apps From Scratch',
    thumbnailUrl: 'https://i.ytimg.com/vi/h-igXZCCrrc/0.jpg',
    duration: '1:03:58',
    timestamp: DateTime(2019, 10, 17),
    viewCount: '358K',
    likes: '20k',
    dislikes: '85',
  ),
];

//Short icin kullandigim veritabani (baska bir videodan dahil edildi)

class YTData {

  var filter = [
    'Explore',
    'All',
    'Conversation',
    'Comedy',
    'Humans',
    'Universe',
    'Games',
    'Flutter',
    'Candy',
    'Music',
    'Mixes',
    'Painting',
    'Aircrafts',
    'Recently Uploaded',
    'Live'
  ];


  var vidList = {
    0: [
      'I summoned a forbidden Minecraft Boss - Part 37',
      'https://i.ytimg.com/vi/yB4Q3ezW9fM/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLDd4CMesg5YZs0M2KmhZ8yqKh5rKA',
      'PewDiePie',
      '7,340,803',
      'Nov 29, 2019',
      'https://yt3.ggpht.com/ytc/AAUvwnga3eXKkQgGU-3j1_jccZ0K9m6MbjepV0ksd7eBEw=s88-c-k-c0x00ffffff-no-rj',
      '15:53'
    ],
    1: [
      'Flutter Animation Tutorial #6 - Animation Controllers',
      'https://i.ytimg.com/vi/k5BDKI7R6ag/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLDzo6krNYqE99M0anvkyOCCrs18KQ',
      'The Net Ninja',
      '10,892',
      'Aug 6, 2020',
      'https://yt3.ggpht.com/ytc/AAUvwni-Wm0ZBDYJYFwySP2esxgc8s9mKiwmI3yJrmjlHQ=s88-c-k-c0x00ffffff-no-rj',
      '21:29',
    ],
    2: [
      'Digital Business Card UI using Flutter | Time-lapse',
      'https://i.ytimg.com/vi/wfiQbEdNLQU/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLCi4quMzqi9uRe4hMQnsvDjSWZw3g',
      'DevBees',
      '110',
      'Mar 30, 2021',
      'https://yt3.ggpht.com/ytc/AAUvwngdpJTfdbXnkHMJ9vYEv7aEuZf-m---p2UqqI7I=s48-c-k-c0x00ffffff-no-rj',
      '4:17',
    ],
    3: [
      '25 AMAZING MAGIC TRICKS ANYONE CAN DO',
      'https://i.ytimg.com/vi/SNfO2r-2XVc/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLASdXrEt1mn0YRAzZ7k1-DOgonMKQ',
      '5-Minute Crafts',
      '510,690',
      'Feb 5, 2019',
      'https://yt3.ggpht.com/ytc/AAUvwnicrG9RNUfo_lxIwy179qaAChmgaWrOs6Y4_r7CKg=s88-c-k-c0x00ffffff-no-rj',
      '14:53',
    ],
    4: [
      'Elektronomia - Sky High pt. || [NCS Release]',
      'https://i.ytimg.com/vi/lG6HVrrXup8/hqdefault.jpg?sqp=-oaymwEcCNACELwBSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLCZL9WCKQKfXCk22RI1GOjodeNvpQ',
      'NoCopyrightSounds',
      '4.8M',
      '4 months ago',
      'https://yt3.ggpht.com/ytc/AAUvwnhFuyxDVb5Ls5HDKyBdydj39h9pBkx5I1VhQ7UL5Q=s68-c-k-c0x00ffffff-no-rj',
      '4:08',
    ],
    5: [
      'Material UI Tutorial #3 - Buttons',
      'https://i.ytimg.com/vi/1at8XzyeEVA/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLCw-xgc4eCC4-GGXayg4IJ0_cYEWw',
      'The Net Ninja',
      '10,297',
      'Mar 16, 2021',
      'https://yt3.ggpht.com/ytc/AAUvwni-Wm0ZBDYJYFwySP2esxgc8s9mKiwmI3yJrmjlHQ=s88-c-k-c0x00ffffff-no-rj',
      '8:27',
    ],
    6: [
      'WhatsApp UI timelapse | Whatsapp UI clone | Flutter timelapse (Part 1)',
      'https://i.ytimg.com/vi/_qIXVlA9tyA/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLDeZLRgXsB57MSCvLWReXTFaIHF_g',
      'DevBees',
      '184',
      'May 8, 2021',
      'https://yt3.ggpht.com/ytc/AAUvwngdpJTfdbXnkHMJ9vYEv7aEuZf-m---p2UqqI7I=s48-c-k-c0x00ffffff-no-rj',
      '4:06',
    ],
    7: [
      '27 EASY MAGIC TRICKS',
      'https://i.ytimg.com/vi/xqAoloAGlCE/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLAgqxO-n16Ckkd4OwplPJmtnUqw4A',
      '5-Minute Crafts',
      '39,433,213',
      'Jan 18, 2019',
      'https://yt3.ggpht.com/ytc/AAUvwnicrG9RNUfo_lxIwy179qaAChmgaWrOs6Y4_r7CKg=s88-c-k-c0x00ffffff-no-rj',
      '17:53',
    ],
    8: [
      'Chat App - Light & Dark Theme UI Kit - Flutter',
      'https://i.ytimg.com/vi/0sTfmQMODqQ/hqdefault.jpg?sqp=-oaymwEcCNACELwBSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLA9iwpEMpGfBWYsMSObPtpdCd6Y3A',
      'The Flutter Way',
      '13K',
      '4 weeks ago',
      'https://yt3.ggpht.com/ytc/AAUvwngOS8ETkWL7RrYwfXX2hMdJ7VjO-juYYl8F1OG1=s176-c-k-c0x00ffffff-no-rj',
      '4:48'
    ],
    9: [
      'Gym Boys | Comedy | Karikku',
      'https://i.ytimg.com/vi/b-U75D5d75s/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLBRL5smpDwBPNm7xmDoFXit6GC0xQ',
      'Karikku',
      '23M',
      '1 year ago',
      'https://yt3.ggpht.com/ytc/AAUvwnjipJKbPXIbI0KeW_o49gCuiHLaJZVdHrPn1WWeBw=s88-c-k-c0x00ffffff-no-rj',
      '12:35',
    ],
  };


  var shortsList = {
    0: [
      'Gumball_Fan',
      'dosyalar/images/cry_jgp.jpg',
      'dosyalar/images/gumball.gif',
      'Gumball İzlemeyen Kaldı mı?',
      '20M',
      '20K',
    ],
    1: [
      'Sıla Pek',
      'dosyalar/images/foto.jpg',
      'dosyalar/images/rubiksCube.gif',
      'Harika Rubik Küpü',
      '2.5K',
      '100',
    ],
    2: [
      'Zeyn',
      'dosyalar/images/foto1.jpg',
      'dosyalar/images/minions.gif',
      'Minions are ❤',
      '50M',
      '10K'
    ],
    3: [
      'Osman Çek',
      'dosyalar/images/foto2.jpg',
      'dosyalar/images/fire.gif',
      'Yanmaya ne dersin?',
      '10M',
      '30K',
    ]
  };
}
