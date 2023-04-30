import 'package:dosale_sale_or_donate_old_book/donate_books.dart';
import 'package:dosale_sale_or_donate_old_book/home.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:badges/badges.dart';
import 'package:path/path.dart' as Path;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:badges/badges.dart' as badges;
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';


Uri gmailUrl = Uri.parse('mailto:test@example.org?subject=Greetings&body=Hello%20World');


class RecentBooks extends StatefulWidget {
  const RecentBooks({Key? key}) : super(key: key);

  @override
  _RecentBooksState createState() => _RecentBooksState();
}

class _RecentBooksState extends State<RecentBooks> {

  // Showing Cart Item
  int _count = 0;

  // Bottom Navigation Bar
  int _selectedIndex = 0;
  PageController pageController = PageController();


  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      '',
      style: optionStyle,
    ),
    Text(
      '',
      style: optionStyle,
    ),
    Text(
      '',
      style: optionStyle,
    ),
    Text(
      '',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.jumpToPage(index);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // Appbar

      appBar: AppBar(
          toolbarHeight: 80,
          centerTitle: true,
          elevation: 1,

          backgroundColor: const Color(0xFF03576e),
          title: Column(children: [
            Text(
              "DOSALE",
              style: GoogleFonts.oswald(
                color: const Color(0xfff7ff00),
                textStyle: Theme.of(context).textTheme.headlineLarge,
                fontSize: 30,
                fontWeight: FontWeight.w700,
                // fontStyle: FontStyle.italic,
                letterSpacing: 3.0,
              ),
              // style: TextStyle(color: Color(0xfff7ff00), fontSize: 30.0, fontWeight: FontWeight.bold, fontFamily: 'Montserrat' ),
            ),
            // const Text(
            //   "",
            //   style: TextStyle(color: Colors.white, fontSize: 10.0),
            // ),
            // Text(
            //   "GO BACK",
            //   style: GoogleFonts.lato(
            //     color: const Color(0xff72ffff),
            //     textStyle: Theme.of(context).textTheme.headlineSmall,
            //     fontSize: 15,
            //     fontWeight: FontWeight.w500,
            //     // fontStyle: FontStyle.italic,
            //     letterSpacing: 1.0,
            //   ),
            // ),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              width: 100,
              height: 40,
              alignment: Alignment.center,
              decoration: const BoxDecoration (
              ),
              child: TextButton(
                // frame36xLQ (103:768)
                onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>const Home()));
                },
                style: TextButton.styleFrom (
                  padding: EdgeInsets.zero,
                ),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  width: 100,
                  height: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 6, 0),
                        width: 20,
                        height: 25,
                        child: Image.asset(
                          'assets/cab-booking/images/vector-35i.png',
                          width: 15,
                          height: 25,
                        ),
                      ),

                      const Text(
                        // detailsNuv (103:767)
                        'GO BACK',
                        style: TextStyle (
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          height: 1.325,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ],
                  ),
                ),

              ),
            ),
          ]),


          actions: [
            badges.Badge(
              position: BadgePosition.topEnd(top: 15, end: 13),
              // animationDuration: Duration(milliseconds: 300),
              // animationType: BadgeAnimationType.slide,

              badgeStyle: badges.BadgeStyle(
                shape: badges.BadgeShape.circle,
                badgeColor: Colors.transparent,
                padding: const EdgeInsets.all(5),
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(color: Colors.transparent, width: 2),
                // borderGradient: badges.BadgeGradient.linear(
                //     colors: [Colors.red, Colors.black]),
                // badgeGradient: badges.BadgeGradient.linear(
                //   colors: [Colors.blue, Colors.yellow],
                //   begin: Alignment.topCenter,
                //   end: Alignment.bottomCenter,
                // ),
                elevation: 0,
              ),


              badgeAnimation: const badges.BadgeAnimation.rotation(
                animationDuration: Duration(seconds: 1),
                colorChangeAnimationDuration: Duration(seconds: 1),
                loopAnimation: false,
                curve: Curves.fastOutSlowIn,
                colorChangeAnimationCurve: Curves.easeInCubic,
              ),

              badgeContent: Text(
                '$_count',
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, ),
              ),
              child: IconButton(
                  icon: const Icon(Icons.shopping_cart, size: 23,),
                  padding: const EdgeInsets.only(top:32 , right: 0,),
                  onPressed: () {}),
            ),
          ]
      ),

      // Body

      backgroundColor: const Color(0xff180f38),
      body: ListView(

          children: [

            // Heading

            const Padding(
              padding: EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 1),
              child: Text("\nRecent Books",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  )
              ),
            ),


            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [


                  // Recent Books Photos
                  Container(
                    // frame24yLt (103:658)
                      margin: const EdgeInsets.fromLTRB(0, 0, 2, 20),
                      alignment: Alignment.center,
                      width: 391,
                      decoration: BoxDecoration (
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),

                      child: Column(
                        children: <Widget>[
                          Row(
                            children: [
                              Container(
                                // rectangleJPA (103:659)
                                alignment: Alignment.center,
                                margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                                child: SizedBox(
                                  width: 200,
                                  height: 300,
                                  child: Image.asset(
                                    'assets/images/apj.png',
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(top: 0, left: 10, right: 0, bottom: 50),
                                    child: Text("Wings Of Fire:\nAutobiography\nof Abdul Kalam\nby Arun Tiwari,\nA. P. J. Abdul\nKalam",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        )
                                    ),
                                  ),
                                  Container(
                                    // frame30s2G (103:686)
                                    margin: const EdgeInsets.fromLTRB(10, 0, 0, 20),
                                    width: 130,
                                    height: 50,

                                    child: TextButton(
                                      onPressed: () => setState(() {
                                        // _count++;
                                      }
                                      ),
                                      style: TextButton.styleFrom (
                                          padding: EdgeInsets.zero,
                                          backgroundColor: Colors.transparent,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(15.0),
                                            // side: BorderSide(color: Colors.red)
                                          )
                                      ),
                                      child: const Center(

                                        child: Center(
                                          child: Text(
                                            'Price: ₹199.00',
                                            textAlign: TextAlign.center,
                                            style: TextStyle (
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              height: 1.325,
                                              color: Color(0xfff4fc03),

                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // frame30s2G (103:686)
                                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    width: 80,
                                    height: 30,

                                    child: TextButton(
                                      onPressed: () => setState(() {
                                        _count++;
                                      }),
                                      style: TextButton.styleFrom (
                                          padding: EdgeInsets.zero,
                                          backgroundColor: const Color(0xff90978f),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(15.0),
                                            // side: BorderSide(color: Colors.red)
                                          )
                                      ),
                                      child: const Center(

                                        child: Center(
                                          child: Text(
                                            'BUY NOW',
                                            textAlign: TextAlign.center,
                                            style: TextStyle (
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700,
                                              height: 1.325,
                                              color: Color(0xffffffff),

                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          Row(
                            children: [
                              Container(
                                // rectangleJPA (103:659)
                                alignment: Alignment.center,
                                margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                                child: SizedBox(
                                  width: 200,
                                  height: 300,
                                  child: Image.asset(
                                    'assets/images/mystery.png',
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(top: 0, left: 10, right: 0, bottom: 10),
                                    child: Text("A Flicker in the\nDark by Stacy\nWillingham",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        )
                                    ),
                                  ),
                                  Container(
                                    // frame30s2G (103:686)
                                    margin: const EdgeInsets.fromLTRB(10, 0, 0, 20),
                                    width: 130,
                                    height: 50,

                                    child: TextButton(
                                      onPressed: () => setState(() {
                                        // _count++;
                                      }),
                                      style: TextButton.styleFrom (
                                          padding: EdgeInsets.zero,
                                          backgroundColor: Colors.transparent,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(15.0),
                                            // side: BorderSide(color: Colors.red)
                                          )
                                      ),
                                      child: const Center(

                                        child: Center(
                                          child: Text(
                                            'Price: ₹699.00',
                                            textAlign: TextAlign.center,
                                            style: TextStyle (
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              height: 1.325,
                                              color: Color(0xfff4fc03),

                                            ),
                                          ),

                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // frame30s2G (103:686)
                                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    width: 80,
                                    height: 30,

                                    child: TextButton(
                                      onPressed: () => setState(() {
                                        _count++;
                                      }),
                                      style: TextButton.styleFrom (
                                          padding: EdgeInsets.zero,
                                          backgroundColor: const Color(0xff90978f),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(15.0),
                                            // side: BorderSide(color: Colors.red)
                                          )
                                      ),
                                      child: const Center(

                                        child: Center(
                                          child: Text(
                                            'BUY NOW',
                                            textAlign: TextAlign.center,
                                            style: TextStyle (
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700,
                                              height: 1.325,
                                              color: Color(0xffffffff),

                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),


                          Row(
                            children: [
                              Container(
                                // rectangleJPA (103:659)
                                alignment: Alignment.center,
                                margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                                child: SizedBox(
                                  width: 200,
                                  height: 300,
                                  child: Image.asset(
                                    'assets/images/sci-fi.png',
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ),

                              Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(top: 0, left: 10, right: 0, bottom: 50),

                                    child: Text("The Martian by\nAndy Weir",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        )
                                    ),
                                  ),
                                  Container(
                                    // frame30s2G (103:686)
                                    margin: const EdgeInsets.fromLTRB(10, 0, 0, 20),
                                    width: 130,
                                    height: 50,

                                    child: TextButton(
                                      onPressed: () => setState(() {
                                        // _count++;
                                      }),
                                      style: TextButton.styleFrom (
                                          padding: EdgeInsets.zero,
                                          backgroundColor: Colors.transparent,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(15.0),
                                            // side: BorderSide(color: Colors.red)
                                          )
                                      ),
                                      child: const Center(

                                        child: Center(
                                          child: Text(
                                            'Price: ₹1199.00',
                                            textAlign: TextAlign.center,
                                            style: TextStyle (
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              height: 1.325,
                                              color: Color(0xfff4fc03),

                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // frame30s2G (103:686)
                                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    width: 80,
                                    height: 30,

                                    child: TextButton(
                                      onPressed: () => setState(() {
                                        _count++;
                                      }),
                                      style: TextButton.styleFrom (
                                          padding: EdgeInsets.zero,
                                          backgroundColor: const Color(0xff90978f),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(15.0),
                                            // side: BorderSide(color: Colors.red)
                                          )
                                      ),
                                      child: const Center(

                                        child: Center(
                                          child: Text(
                                            'BUY NOW',
                                            textAlign: TextAlign.center,
                                            style: TextStyle (
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700,
                                              height: 1.325,
                                              color: Color(0xffffffff),

                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),


                        ],
                      )
                  ),




                  // Seller Section => Button


                  Divider(height: 10, thickness: 2, color: Colors.red,),

                  Column(
                    children: [

                      const Padding(
                        padding: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
                        child: Text("Donate Your Old Book with Us !!",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            )
                        ),
                      ),

                      Row(
                        children: [
                          Container(
                            // rectangleJPA (103:659)
                            alignment: Alignment.center,
                            margin: const EdgeInsets.fromLTRB(28, 20, 10, 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            height: 170,
                            child: SizedBox(
                              width: 200,
                              height: 150,
                              child: Image.asset(
                                'assets/book-types/images/donate.png',
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                          Container(
                            // frame30s2G (103:686)
                            margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                            width: 110,
                            height: 50,

                            child: TextButton(
                              onPressed: (){
                                Navigator.push(context,MaterialPageRoute(builder: (context)=>const DonateBooks()));
                              },
                              style: TextButton.styleFrom (
                                  padding: EdgeInsets.zero,
                                  backgroundColor: Colors.yellow[400],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    // side: BorderSide(color: Colors.red)
                                  )
                              ),

                              child: const Center(

                                child: Center(
                                  child: Text(
                                    'DONATE',
                                    textAlign: TextAlign.center,
                                    style: TextStyle (
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      height: 1.325,
                                      color: Colors.black,

                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
            // PageView(
            //   controller: pageController,
            // )

          ]

      ),

      // Bottom Navigation Bar
      // bottomNavigationBar: BottomAppBar(
      //   color: const Color(0xff000000),
      //   shape: const CircularNotchedRectangle(),
      //   child: Container(
      //     height: 15.0,
      //   ),
      // ),


      // BottomNavigationBar

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Color(0xff319370),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.price_change_outlined),
            label: 'Sell',
            backgroundColor: Color(0xff57deba),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_outlined),
            label: 'Donate',
            backgroundColor: Color(0xfffad55c),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_rounded),
            label: 'Profile',
            backgroundColor: Color(0xff7d3ea4),
          ),
        ],
        // type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black38,
        // iconSize: 25,
        onTap: _onItemTapped,
      ),


      // // Floating Action Bar
      // floatingActionButton: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: [
      //       FloatingActionButton(
      //         onPressed: () => setState(() {
      //           _count--;
      //         }),
      //         tooltip: 'Decrement Counter',
      //         child: const Icon(Icons.delete),
      //         backgroundColor: Colors.black,
      //       ),
      //
      //       FloatingActionButton(
      //         onPressed: () => setState(() {
      //           _count++;
      //         }),
      //         tooltip: 'Increment Counter',
      //         child: const Icon(Icons.add),
      //         backgroundColor: Colors.black,
      //
      //       ),
      //     ]
      // ),
      //
      // // Floating Action Bar Location
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,






      // Drawer

      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: const Color(0xff060026),
          //other styles
        ),

        child: Drawer(
          elevation: 20.0,
          // backgroundColor: Color(0xFF032730),
          child: Column(

            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: const Text("21MCA2473"),
                accountEmail: const Text("PURNENDU BIKASH JANA"),
                decoration: const BoxDecoration(
                  color: Color(0xFF016b91),
                ),
                currentAccountPicture: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.transparent,
                  child: Image.asset('assets/images/me.jpg'),
                ),
              ),

              const ListTile(
                title: Text("Profile", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.white)),
                leading: Icon(Icons.person_2_outlined,color: Colors.white,),
              ),

              const Divider( height: 0.1, color: Color(0xffa9a9a9),),
              const ListTile(
                title: Text("Order", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.white)),
                leading: Icon(Icons.shopping_bag_outlined,color: Colors.white,),
              ),

              const Divider( height: 0.1, color: Color(0xffa9a9a9),),
              const ListTile(
                title: Text("Your Offer", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.white)),
                leading: Icon(Icons.local_offer_outlined,color: Colors.white,),
              ),

              const Divider( height: 0.1, color: Color(0xffa9a9a9),),
              ListTile(
                  title: const Text("Send Email", style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.white)),
                  leading: const Icon(Icons.contact_mail_outlined,color: Colors.white,),

                  onTap: () {
                    _launch(gmailUrl);
                  }
              ),
              const Divider( height: 0.1, color: Color(0xffa9a9a9),),
              ListTile(
                title: const Text("Connect Me", style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.white)),
                leading: const Icon(Icons.people_outline, color: Colors.white,),
                onTap: () => {launch("https://www.linkedin.com/in/ami-pbj/")},
              ),
              const Divider( height: 0.1, color: Color(0xffa9a9a9),),
              ListTile(
                  title: const Text("My Portfolio", style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.white)),
                  leading: const Icon(Icons.inbox,color: Colors.white,),

                  onTap: () => {launch('https://purnendu-pbj.in/')}
              ),
              const Divider( height: 0.1, color: Color(0xffa9a9a9),),
            ],
          ),
        ),
      ),
    );
  }
}



// Open Email App from Drawer
_launch(Uri url) async {
  await canLaunchUrl(url)
      ? await launchUrl(url)
      : ScaffoldMessenger.of(Path.context as BuildContext).showSnackBar(
      const SnackBar(
        content: Text('Could Open Email app !!'),
      ));
}
