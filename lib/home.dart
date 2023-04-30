import 'package:badges/badges.dart';
import 'package:dosale_sale_or_donate_old_book/recent_books.dart';
import 'package:path/path.dart' as Path;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:badges/badges.dart' as badges;
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';




Uri gmailUrl = Uri.parse('mailto:test@example.org?subject=Greetings&body=Hello%20World');



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

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
            const Text(
              "",
              style: TextStyle(color: Colors.white, fontSize: 10.0),
            ),
            Text(
              "SALE | DONATE",
              style: GoogleFonts.lato(
                color: const Color(0xff72ffff),
                textStyle: Theme.of(context).textTheme.headlineSmall,
                fontSize: 15,
                fontWeight: FontWeight.w500,
                // fontStyle: FontStyle.italic,
                letterSpacing: 3.0,
              ),
            ),
            const Text(
              "",
              style: TextStyle(color: Colors.white, fontSize: 10.0),
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

            // Flexible(flex: 1, child:Container(color:Colors.red)),
            CarouselSlider(
              items: [
                Container(
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10.0),
                    image: const DecorationImage(
                      image: NetworkImage("https://img.freepik.com/free-vector/illustrated-book-fair-background_52683-68230.jpg?w=1380&t=st=1680776584~exp=1680777184~hmac=68ace7d26def50fb08138a292c384cee00dd528d57d2c14436f4efc129ceccd2"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10.0),
                    image: const DecorationImage(
                      image: NetworkImage("https://img.freepik.com/premium-vector/modern-back-school-discount-green-3d-banner-with-telescope_7993-4578.jpg?w=1060"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10.0),
                    image: const DecorationImage(
                      image: NetworkImage("https://img.freepik.com/premium-photo/donation-box-with-school-supplies-old-wooden-table_104376-927.jpg?w=1800"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
              options: CarouselOptions(
                height: 200.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 1000),
                viewportFraction: 0.8,
                // reverse: true,
              ),

            ),


            // Heading

            Column(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                    width: double.infinity,
                    alignment: Alignment.center,

                    child: Text(
                      "World's largest platform to Sell and Donate your old books.",
                      style: GoogleFonts.lato(
                        color: const Color(0xffffffff),
                        textStyle: Theme.of(context).textTheme.headlineLarge,
                        fontSize: 27,
                        fontWeight: FontWeight.w700,
                        // fontStyle: FontStyle.italic,
                        letterSpacing: 1.0,
                      ),
                      // style: TextStyle(color: Color(0xfff7ff00), fontSize: 30.0, fontWeight: FontWeight.bold, fontFamily: 'Montserrat' ),
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    width: double.infinity,
                    alignment: Alignment.center,

                    child: Text(
                      "HELP POOR\nby\nDONATING\nyour OLD BOOK\nwith US 💚",
                      style: GoogleFonts.lato(
                        color: const Color(0xffcfe0fc),
                        textStyle: Theme.of(context).textTheme.headlineSmall,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        // fontStyle: FontStyle.italic,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),

            ]),


            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  // Heading 1 => Recent Books
                  Container(
                    // frame13nGQ (103:480)
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    width: double.infinity,
                    child: TextButton(
                      onPressed: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>const RecentBooks()));
                      },
                      style: TextButton.styleFrom (
                        padding: EdgeInsets.zero,
                      ),
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(0, 5.5, 0, 5.5),
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 196, 0),
                              child: const Text(
                                'Recent Books',
                                style: TextStyle (
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  height: 1.325,
                                  color: Color(0xffdee0df),
                                ),
                              ),
                            ),

                            const Text(
                              // seeallcYG (103:485)
                              'View More',
                              style: TextStyle (
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                height: 1.325,
                                color: Color(0xff6cff7b),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),


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

                    child: Row(
                      children: <Widget>[
                        Column(
                        children: [
                          Container(
                            // rectangleJPA (103:659)
                            alignment: Alignment.center,
                            margin: const EdgeInsets.fromLTRB(2, 0, 7.3, 10),
                            child: SizedBox(
                              width: 120,
                              height: 180,
                              child: Image.asset(
                                'assets/images/apj.png',
                                fit: BoxFit.fitHeight,
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

                        Column(
                          children: [
                            Container(
                              // rectangleJPA (103:659)
                              alignment: Alignment.center,
                              margin: const EdgeInsets.fromLTRB(2, 0, 7.3, 10),
                              child: SizedBox(
                                width: 120,
                                height: 180,
                                child: Image.asset(
                                  'assets/images/mystery.png',
                                  fit: BoxFit.fitHeight,
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


                        Column(
                          children: [
                            Container(
                              // rectangleJPA (103:659)
                              alignment: Alignment.center,
                              margin: const EdgeInsets.fromLTRB(2.1, 0, 7.3, 10),
                              child: SizedBox(
                                width: 120,
                                height: 180,
                                child: Image.asset(
                                  'assets/images/sci-fi.png',
                                  fit: BoxFit.fitHeight,
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
                    )
                  ),




                  // Heading 2 => Literary Genres
                  Container(
                    // frame14EXi (103:483)
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom (
                        padding: EdgeInsets.zero,
                      ),
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(0, 5.5, 0, 5.5),
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 207, 0),
                              child: const Text(
                                'Literary Genres',
                                style: TextStyle (
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  height: 1.325,
                                  color: Color(0xffdee0df),
                                ),
                              ),
                            ),

                            const Text(
                              // seeallcYG (103:485)
                              'See all',
                              style: TextStyle (
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                height: 1.325,
                                color: Color(0xff6cff7b),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Book Types Photo
                  Container(
                    // frame27MVr (103:662)
                    margin: const EdgeInsets.fromLTRB(45, 0, 45, 8),
                    alignment: Alignment.bottomCenter,
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // ellipse3GMv (103:489)
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(30),
                            color: const Color(0xffd9d9d9),
                            image: const DecorationImage (
                              fit: BoxFit.cover,
                              image: AssetImage (
                                'assets/book-types/images/sci-fi.png',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          // ellipse4ATJ (103:490)
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(30),
                            color: const Color(0xffd9d9d9),
                            image: const DecorationImage (
                              fit: BoxFit.cover,
                              image: AssetImage (
                                'assets/book-types/images/mystery.png',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          // ellipse5664 (103:492)
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(30),
                            color: const Color(0xffd9d9d9),
                            image: const DecorationImage (
                              fit: BoxFit.cover,
                              image: AssetImage (
                                'assets/book-types/images/biography.png',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          // ellipse6uZJ (103:491)
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(30),
                            color: const Color(0xffd9d9d9),
                            image: const DecorationImage (
                              fit: BoxFit.cover,
                              image: AssetImage (
                                'assets/book-types/images/comic.png',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),


                  // Book Types
                  Container(
                    // autogroupwqr62dv (2QYJcMY58pBxt3RV7UWQR6)
                    margin: const EdgeInsets.only(top: 5, left: 30, bottom: 30),
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // yellowcabZ84 (103:510)
                          margin: const EdgeInsets.fromLTRB(25, 0, 5, 0),
                          child: const Text(
                            'Sci-Fi',
                            textAlign: TextAlign.center,
                            style: TextStyle (
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 1.325,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                        Container(
                          // taxiH44 (103:512)
                          margin: const EdgeInsets.fromLTRB(30, 0, 5, 0),
                          child: const Text(
                            'Mystery',
                            textAlign: TextAlign.center,
                            style: TextStyle (
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 1.325,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),

                        Container(
                          // sedanzz4 (103:511)
                          margin: const EdgeInsets.fromLTRB(11, 0, 5, 0),
                          child: const Text(
                            'Biography',
                            textAlign: TextAlign.center,
                            style: TextStyle (
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 1.325,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(18, 0, 5, 0),
                          child: const Text(
                            // suv7on (103:493)
                            'Comic',
                            textAlign: TextAlign.center,
                            style: TextStyle (
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 1.325,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),



                  // Seller Section => Button

                  Container(
                    // frame30s2G (103:686)
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    width: 391,
                    height: 47,

                    child: TextButton(
                      onPressed: () => setState(() {
                        _count--;
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
                            'Sell Your Old Book with Us !!',
                            textAlign: TextAlign.center,
                            style: TextStyle (
                              fontSize: 20,
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

