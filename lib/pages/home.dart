import 'package:blur_bottom_bar/blur_bottom_bar.dart';
import 'package:coffee_app_ui/common/coffee_tile.dart';
import 'package:coffee_app_ui/common/coffee_type_options.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  // [ type, isSelected ]
  final List coffeeType = [
    ['Black', true],
    ['Cappucino', false],
    ['Latte', false],
    ['Tea', false]
  ];

  void coffeeTypeSelect(int index) {
    setState(() {
      for (int i = 0; i < coffeeType.length; i++) {
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: const Color.fromRGBO(32, 21, 32, 1), // app bg color
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.grid_view_rounded),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: Icon(Icons.person_rounded),
          )
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Text(
                    'Find the best coffee for you',
                    style: GoogleFonts.poppins(
                        fontSize: 36, fontWeight: FontWeight.w600),
                  ),
                ),
                // Search
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(color: Colors.orange)),
                        prefixIcon: const Icon(Icons.search_rounded),
                        hintText: 'Find Your Coffee...'),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 55,
                  child: ListView.builder(
                    itemCount: coffeeType.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CoffeeTypeOptions(
                        coffeeType: coffeeType[index][0],
                        isSelected: coffeeType[index][1],
                        onTap: () {
                          coffeeTypeSelect(index);
                        },
                      );
                    },
                  ),
                ),
                // List of coffee tiles
                SizedBox(
                  height: 350,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      CoffeeTile(
                          imagePath: 'assets/images/1.jpg',
                          name: 'Black Coffee',
                          price: '4.00'),
                      CoffeeTile(
                          imagePath: 'assets/images/2.jpg',
                          name: 'Black Coffee',
                          price: '5.00'),
                      CoffeeTile(
                          imagePath: 'assets/images/3.jpg',
                          name: 'Cappucino',
                          price: '6.00'),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 25.0,
                  ),
                  child: Text(
                    'Special for you',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
          // -- if blur bottom nav bar is preferred
          // -- package used : blur_bottom_bar
          BlurBottomView(
              filterX: 9,
              filterY: 21,
              opacity: 1,
              selectedItemColor: Colors.orange,
              backgroundColor: Colors.black45,
              currentIndex: _selectedIndex,
              onIndexChange: (val) {
                _onItemTapped(val);
              },
              bottomNavigationBarItems: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home_rounded,
                      size: 30,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.bag_fill), label: ''),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.heart_fill), label: ''),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.bell_fill), label: '')
              ])
        ],
      ),

      // -- if normal bottom navigation bar is preffered
      // -- stack can be removed from body
      // bottomNavigationBar: BottomNavigationBar(
      //   showSelectedLabels: false,
      //   showUnselectedLabels: false,
      //   type: BottomNavigationBarType.fixed,
      //   selectedItemColor: Colors.orange,
      //   backgroundColor: Colors.black.withOpacity(0.9),
      //   elevation: 3,
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(CupertinoIcons.house_alt_fill),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //         icon: Icon(CupertinoIcons.bag_fill), label: ''),
      //     BottomNavigationBarItem(
      //         icon: Icon(CupertinoIcons.heart_fill), label: ''),
      //     BottomNavigationBarItem(
      //         icon: Icon(CupertinoIcons.bell_fill), label: '')
      //   ],
      // ),
    );
  }
}
