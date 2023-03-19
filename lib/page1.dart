import 'package:flutter/material.dart';
import 'package:major_app/page2.dart';
import 'package:major_app/page3.dart';
import 'package:major_app/page4.dart';

void main() {
  runApp(const Page1());
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomepage(),
    );
  }
}

class MyHomepage extends StatefulWidget {
  const MyHomepage({Key? key}) : super(key: key);

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //1.ส่วนของโลโก้ด้านบน แบม
      backgroundColor: Colors.black12,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 30),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(
                    Icons.movie_creation_rounded,
                    color: Colors.white,
                    size: 45,
                  ),
                  Icon(
                    Icons.three_k_plus,
                    color: Colors.white,
                    size: 45,
                  )
                ]),
          ),

          //2.ส่วนของรูปภาพใหญ่ด้านบนที่มีสามรูป อัญ
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 150,
                ),
                SizedBox(
                  height: 400,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(23)),
                            child: SizedBox(
                              width: 200,
                              height: 400,
                              child: Image.network(
                                  fit: BoxFit.cover,
                                  'https://images.workpointnews.com/workpointnews/2022/10/21131911/1666333147_18067_.jpg'),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            clipBehavior: Clip.antiAlias,
                            child: SizedBox(
                              width: 200,
                              height: 400,
                              child: Image.network(
                                  fit: BoxFit.cover,
                                  'https://www.thailandplus.tv/wp-content/uploads/2022/12/S__4187184.jpg'),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            clipBehavior: Clip.antiAlias,
                            child: SizedBox(
                              width: 200,
                              height: 400,
                              child: Image.network(
                                  fit: BoxFit.cover,
                                  'https://lumiere-a.akamaihd.net/v1/images/bp2_main_poster_billingth_2fbd779e.jpeg'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //3.ส่วนของตัวข้อความ "ตัวรอบถัดไป" ปอนด์
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'ตั๋วรอบถัดไป',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),

                //4.ส่วนของกรอบด้านล่าง อันนี้เป็นส่วนของรูปอนุมาน ฟลุ๊ค
                Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      color: Colors.grey,
                      height: 180,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceAround, //จัดพื้นหลังสีด้านหลัง
                        children: [
                          Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(23),
                            ),
                            child: Image.network(
                                'https://www.thailandplus.tv/wp-content/uploads/2022/12/S__4187184.jpg'),
                          ),

                          //ส่วนของข้อความในกรอบเล็กด่านล่าง
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            //ทำให้กรอบชำระเงินสีเขียวมาชิดซ้ายแบบสวยงาม
                            children: [
                              const Text(
                                'เมเจอร์ บิ๊กซี',
                                style: TextStyle(
                                    fontSize: 24, color: Colors.white),
                              ),
                              Text('หนุมาน',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey.shade300)),
                              const SizedBox(
                                height:
                                    10, //ระยะห่างระหว่างกรอบสีเขียวกับหนุมาน
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.green[500], //เปลี่ยนสีในกรอบ
                                    borderRadius: BorderRadius.circular(23)),
                                //ทำให้กรอบเป็นวงรี
                                child: const Text('ชำระเงินแล้ว',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black)),
                              ),
                            ],
                          ),

                          //ส่วนของข้อความตัวเลขที่นั่ง
                          Column(
                            children: [
                              const Text(
                                'เลขที่นั่ง',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                              Text('B10, B9',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey.shade300)),
                            ],
                          ),
                        ],
                      )),
                )
              ],
            ),
          ),

          //5.ส่วนของปุ่มซื้อด่วน น้ำ
          Positioned(
            bottom: 40,
            right: 10,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.amber,
              ),
              child: Row(
                children: const [
                  Icon(
                    Icons.shop,
                    size: 20,
                  ),
                  Text('ซื้อด่่วน', style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
          )
        ],
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
            if (_selectedIndex == 1) {
              //movie
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Page2()));
            } else if (_selectedIndex == 2) {
              //fev
              final route =
                  MaterialPageRoute(builder: (context) => const FavPage());
              Navigator.push(context, route);
            } else if (_selectedIndex == 3) {
              //Account
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
