import 'package:flutter/material.dart';
import 'package:major_app/page2.dart';
import 'package:major_app/page4.dart';
import 'package:provider/provider.dart';
import 'class/fav.dart';
import 'page1.dart';

class FavPage extends StatelessWidget {
  const FavPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _selectedIndex = 0;
    final provider = Provider.of<Fec>(context);
    final words = provider.words;

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Favorite"),
      ),
      backgroundColor: Colors.black12,
      body: words.isNotEmpty
    ? GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
        ),
        itemCount: words.length,
        itemBuilder: (context, index) {
          final word = words[index];
          return Card(
            child: Column(
              children: [
                Stack(
                  children: [
                    Expanded(
                      child: Image.network(
                        provider.imageUrls[index],
                        width: 200,
                        height: 210,
                        fit: BoxFit.cover,
                      ),
                    ),
                    if (provider.imageUrls[index].isEmpty || provider.imageNames[index].isEmpty)
                      const Center(
                        child: Text(
                          "don't I have any favourites yet",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        provider.imageNames[index],
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
      )
    : const Center(
        child: Text(
          "don't I have any favourites yet",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        
      ),


      //6.ส่วนของ Tapbar ตะวัน
      bottomNavigationBar: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
        return BottomNavigationBar(
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
              } else if (_selectedIndex == 1) {
                 //movie
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Page2()));
                // add code to navigate to the Movie page
              } else if (_selectedIndex == 2) {
                //My Account
              
              }else if (_selectedIndex == 3) {
                //My Account
                 Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const EditProfilePage()));
                // add code to navigate to the My Account page
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
        );
      }),
    );
  }
}
