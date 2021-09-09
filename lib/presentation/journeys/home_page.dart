import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var images = [
    "images/3.jpg",
    "images/2.jpg",
    "images/3.jpg",
    "images/4.jpg",
    "images/5.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inspire"),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              CupertinoIcons.search,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
          child: ListView(
        padding: EdgeInsets.only(top: 16, bottom: 72),
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed("article_list");
            },
            child: Material(
              color: Colors.white,
              child: Column(
                children: [
                  CarouselSlider(
                    items: images.map((e) => Image.asset(e)).toList(),
                    options: CarouselOptions(
                      height: 200,
                      aspectRatio: 14 / 9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      // onPageChanged: callbackFunction,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  Container(
                    child: ListTile(
                      leading: SvgPicture.asset(
                        "images/notification.svg",
                        color: Colors.purple[800],
                        width: 24,
                      ),
                      title: Text(
                        "Information sur le COVID-19 RDC",
                        style: TextStyle(
                          color: Colors.purple[800],
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                      subtitle: Text("Lisez ici les dernieres info"),
                      trailing: Icon(CupertinoIcons.chevron_right),
                    ),
                  )
                ],
              ),
            ),
          ),
          CardMenu(
            bg: 0xFFFF9800,
            titleColor: Colors.black,
            title: "Lutte contre COVID-19",
            subTitle: "Guide pour lutter contre le covid 19",
            svg: "images/virus (1).svg",
            onTap: () {
              Navigator.of(context).pushNamed("care_page");
            },
          ),
          CardMenu(
            bg: 0xFF4f0ead,
            titleColor: Colors.orange,
            title: "Contactez-nous",
            subTitle:
                "Nous avons besoin de vos messages pour lutter contre le COVID19",
            svg: "images/virus.svg",
            onTap: () {
              Navigator.of(context).pushNamed("contact");
            },
          ),
          CardMenu(
            bg: 0xFF21CE99,
            titleColor: Colors.white,
            title: "Rejoindre notre communauté",
            subTitle: "Ensemble nous luttons la santé des uns pour les autres",
            svg: "images/communities.svg",
            onTap: () {
              Navigator.of(context).pushNamed("signup");
            },
          ),
        ],
      )),
      // body:
    );
  }
}

class CardMenu extends StatelessWidget {
  const CardMenu({
    Key? key,
    required this.title,
    required this.bg,
    required this.subTitle,
    required this.titleColor,
    required this.svg,
    required this.onTap,
  }) : super(key: key);

  final String svg;
  final int bg;
  final String title;
  final Color titleColor;
  final String subTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        //height: MediaQuery.of(context).size.height * 0.23,
        padding: EdgeInsets.all(16),
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 16,
        ),
        decoration: BoxDecoration(
          color: Color(bg),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(
              "$title",
              style: TextStyle(
                fontSize: 20,
                color: titleColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Container(
                child: SvgPicture.asset(
                  "$svg",
                  width: 72,
                  height: 72,
                  color: titleColor,
                ),
              ),
              title: Text(
                "$subTitle",
                style: TextStyle(
                  fontSize: 13,
                  color: titleColor,
                ),
              ),
              trailing: Icon(
                CupertinoIcons.chevron_right,
                color: titleColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
