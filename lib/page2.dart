import 'package:flutter/material.dart';
import 'package:major_app/page1.dart';
import 'package:major_app/page3.dart';
import 'package:major_app/page4.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';

import 'class/fav.dart';


class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  int _selectedIndex = 0;

  final List<String> imageUrls = [
    'https://images.workpointnews.com/workpointnews/2022/10/21131911/1666333147_18067_.jpg',
    'https://lumiere-a.akamaihd.net/v1/images/bp2_main_poster_billingth_2fbd779e.jpeg',
    'https://www.thailandplus.tv/wp-content/uploads/2022/12/S__4187184.jpg',
    'https://upload.wikimedia.org/wikipedia/en/c/c0/Monster_High_The_Movie_poster.jpg',
    'https://lh3.googleusercontent.com/bKYlKeibD5y3RkM3_JqJBkOnf0yJTdp_gLqGufGOLviMhug_xLMKwUH5nOwPb-GUgIHSjeG2GDZvGr7K_J5B9BWzMGbp7yTwGg=w260',
    'https://assets-prd.ignimgs.com/2023/01/24/shzam2-vert-main-2764x4096-dom-1674589983500.jpg',
    'https://lumiere-a.akamaihd.net/v1/images/ant-man-andthewasp-poster-th_64899835.jpeg',
    'https://f.ptcdn.info/042/080/000/rr9f9oyvliNZj7mgIEd-o.png'
  ];

  final List<String> imageNames = [
    'บัวผัน ฟันยับ',
    'wakanda forever',
    'white monkey',
    'Imonster high',
    'ขุน-พันธ์ 3',
    'shazam 2',
    'ant man3',
    'scream 6'
  ];


  @override
Widget build(BuildContext context) {
  final provider = Provider.of<Fec>(context);
  return Scaffold(
     appBar: AppBar(
        title: const Text("Movie"),
      ),
    backgroundColor: Colors.black12,
    body: GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
      ),
      itemCount: imageUrls.length,
      itemBuilder: (context, index) {
        final word = imageUrls[index];

        return Card(
          child: Column(
            children: [
              Expanded(
                child: Image.network(
                  imageUrls[index],
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      imageNames[index],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        provider.toggleFav(word);
                      },
                      icon: provider.isExits(word)
                          ? const Icon(Icons.favorite, color: Colors.red)
                          : const Icon(Icons.favorite_border),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    ),

    //6.ส่วนของ Tapbar ตะวัน
    bottomNavigationBar: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue[700],
      selectedFontSize: 13,
      unselectedFontSize: 13,
      iconSize: 30,
      currentIndex: _selectedIndex,
      onTap: (int index) {
        setState(() {
          _selectedIndex = index;
          if (_selectedIndex == 0) {
            //home 
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Page1()));
          } else if (_selectedIndex == 2) {
            //fev
             final route = MaterialPageRoute(builder: (context) => const FavPage());
                  Navigator.push(context, route);
          } else if (_selectedIndex == 3) {
          //My Account
           Navigator.push(context,
            MaterialPageRoute(builder: (context) => const EditProfilePage()));
          } 
        });
      },
      items: const [
        BottomNavigationBarItem(
          label: "Home",
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: "Movie",
          icon: Icon(Icons.movie),
        ),
        BottomNavigationBarItem(
          label: "Favorite",
          icon: Icon(Icons.favorite),
        ),
        BottomNavigationBarItem(
          label: "My Account",
          icon: Icon(Icons.account_circle_outlined),
        ),
      ],
    ),
    
  );
}



}

