import 'package:flutter/material.dart';

class Fec extends ChangeNotifier {
  List<String> _words = [];
  List<String> get words => _words;

   final List<String> imageUrls = [      'https://images.workpointnews.com/workpointnews/2022/10/21131911/1666333147_18067_.jpg',      'https://lumiere-a.akamaihd.net/v1/images/bp2_main_poster_billingth_2fbd779e.jpeg',      'https://www.thailandplus.tv/wp-content/uploads/2022/12/S__4187184.jpg',      'https://upload.wikimedia.org/wikipedia/en/c/c0/Monster_High_The_Movie_poster.jpg',      'https://lh3.googleusercontent.com/bKYlKeibD5y3RkM3_JqJBkOnf0yJTdp_gLqGufGOLviMhug_xLMKwUH5nOwPb-GUgIHSjeG2GDZvGr7K_J5B9BWzMGbp7yTwGg=w260',      'https://assets-prd.ignimgs.com/2023/01/24/shzam2-vert-main-2764x4096-dom-1674589983500.jpg',      'https://lumiere-a.akamaihd.net/v1/images/ant-man-andthewasp-poster-th_64899835.jpeg',      'https://f.ptcdn.info/042/080/000/rr9f9oyvliNZj7mgIEd-o.png'    ];
    final List<String> imageNames = [      'บัวผัน ฟันยับ',      'wakanda forever',      'white monkey',      'Imonster high',      'ขุน-พันธ์ 3',      'shazam 2',      'ant man3',      'scream 6'    ];

  void toggleFav(String word) {
    final isExits = _words.contains(word);
    if (isExits) {
      _words.remove(word);
    } else {
      _words.add(word);
    }
    notifyListeners();
  }


  bool isExits(String word) {
    final isExits = _words.contains(word);
    return isExits;
  }

  void claearFav() {
    _words = [];
    notifyListeners();
  }

  getFavorites() {}
}
