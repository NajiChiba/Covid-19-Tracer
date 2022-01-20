// ignore_for_file: prefer_const_literals_to_create_immutables, unused_local_variable, prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, avoid_print, unused_import

import 'package:covid_contact_tracer/controllers/qr_controller.dart';
import 'package:covid_contact_tracer/screens/certiificat_det_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'scan_page/scan_screen.dart';
import 'wallet/wallet.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final QrController qrController = Get.put(QrController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var height_ = size.height;
    var width_ = size.width;

    void func(String svgName, double height) {
      print('height = $height');
    }

    List cards = [
      {
        'color': [
          Color(0xFFFFB251),
          Color(0xFFFFD166),
        ],
        'title': 'Scan a venue QR code',
        'description': 'Be aletred in case of\nexpoure in venue',
        'svgImg': 'phone_qr',
        'reverse': false,
        'func': func
      },
      {
        'color': [
          Color(0xFFEF476F),
          Color(0xFFFF6086),
        ],
        'title': 'You are COVID-19\npositive ?',
        'description': 'Tap here to scan the QR code',
        'svgImg': 'test',
        'reverse': true,
        'func': func
      },
      {
        'color': [
          Color(0xFF00CDAC),
          Color(0xFF06D6A0),
        ],
        'title': 'You are COVID-19\npositive ?',
        'description': 'Tap here to scan the QR code',
        'svgImg': 'phone_verif',
        'reverse': false,
        'func': func
      },
      {
        'color': [
          Color(0xFF00B9F6),
          Color(0xFF40CFFF),
        ],
        'title': 'Scan a venue QR code',
        'description': 'Be aletred in case of\nexpoure in venue',
        'svgImg': 'phone_qr',
        'reverse': true,
        'func': func
      }
    ];

    void navToWallete() {
      Get.to(Wallet());
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => ScanPage());
          print('Scan');
        },
        backgroundColor: Colors.transparent,
        elevation: 4,
        child: Container(
          width: width_,
          height: height_,
          padding: EdgeInsets.all(14),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  // Color(0xFF3BB2B8),
                  // Color(0xFF42E695),

                  Color(0xFF5063FF),
                  Color(0xFF5F6EE3),
                ]),
          ),
          child: SvgPicture.asset("assets/svgs/scan.svg"),
        ),
      ),
      backgroundColor: Color(0xFFFAF9FF),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          header(height_, width_),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title('Health pass'),
                space(15),
                card(
                  context,
                  [
                    Color(0xFF6374F8),
                    Color(0xFF6374F8),
                    Color(0xFF697AFF),
                  ],
                  'Open my wallet',
                  'Your test and vaccination\ncertificates',
                  'wallet',
                  true,
                  navToWallete,
                ),
                space(20),
                title('News'),
                space(15),
                vaccinationPrc(size),
                statistics(size),
                space(20),
                title('Contact tracing'),
                space(25),
                Column(
                  children: cards
                      .map((card_) => card(
                            context,
                            card_['color'],
                            card_['title'],
                            card_['description'],
                            card_['svgImg'],
                            card_['reverse'],
                            card_['func'],
                          ))
                      .toList(),
                ),
                space(60)
              ],
            ),
          )
        ]),
      ),
    );
  }

  Widget newsTitle(
      String title, Color color, double fontSize, FontWeight fontWeight) {
    return Text(
      title,
      style: GoogleFonts.poppins(
          fontSize: fontSize, fontWeight: fontWeight, color: color),
    );
  }

  Widget vaccinationPrc(Size size) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(11),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 6)
            ]),
        margin: EdgeInsets.only(bottom: 20),
        width: size.width,
        height: (size.height < 684) ? size.height * 0.26 : size.height * 0.22,
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xFF52AEBC)),
                  child: Icon(
                    Icons.flag,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                newsTitle("Vaccination converage", Color(0xFF52AEBC), 20,
                    FontWeight.w600),
              ],
            ),
            space(2),
            newsTitle('Update', Color(0xFF4B4848), 16, FontWeight.normal),
            space(8),
            newsTitle('89,7%', Colors.black, 48, FontWeight.w600),
          ],
        ));
  }

  Widget statistics(Size size) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(11),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 6)
            ]),
        margin: EdgeInsets.only(bottom: 20),
        width: size.width,
        height: (size.height < 684) ? size.height * 0.26 : size.height * 0.22,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xFFED7470)),
                  child: Icon(
                    Icons.flag,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                newsTitle("Other key figures", Color(0xFFED7470), 20,
                    FontWeight.w600),
              ],
            ),
            space(4),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        newsTitle("Completed vaccination", Color(0xFF6FC76D),
                            14, FontWeight.w500),
                        newsTitle("51,74M", Colors.black, 24, FontWeight.w700),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        newsTitle("New cases", Color(0xFFFF536D), 16,
                            FontWeight.w500),
                        newsTitle("195 790", Colors.black, 24, FontWeight.w700),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        newsTitle(
                            "Cases", Color(0xFF5364FF), 16, FontWeight.w500),
                        newsTitle("195 720", Colors.black, 24, FontWeight.w700),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }

  Widget space(double h) {
    return SizedBox(
      height: h,
    );
  }

  Widget title(String title) {
    return Text(
      title,
      style: GoogleFonts.roboto(
          fontSize: 26,
          fontWeight: FontWeight.w700,
          color: Colors.black.withOpacity(0.8)),
    );
  }

  Widget card(
    BuildContext context,
    List<Color> colors,
    String title,
    String description,
    String svgName,
    bool reverse,
    Function func,
  ) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        try {
          func(svgName);
        } catch (e) {
          func();
        }
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        width: size.width,
        height: (size.height < 684) ? size.height * 0.2 : size.height * 0.18,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: colors),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 15)
            ]),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            reverse
                ? textColumn(title, description)
                : svgImg(svgName, size.width),
            SizedBox(
              width: 8,
            ),
            !reverse
                ? textColumn(title, description)
                : svgImg(svgName, size.width),
          ],
        ),
      ),
    );
  }

  Widget textColumn(String title, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
        ),
        Text(
          description,
          style: GoogleFonts.poppins(
              color: Colors.white.withOpacity(0.65), fontSize: 16),
        ),
      ],
    );
  }

  Widget svgImg(String svgName, double width_) {
    return Expanded(
      flex: 2,
      child: Container(
          padding: EdgeInsets.only(bottom: (svgName == 'wallet') ? 20 : 0),
          child: SvgPicture.asset("assets/svgs/$svgName.svg")),
    );
  }

  Widget header(double height_, double width_) {
    return Container(
      // header
      height: height_ * 0.5,
      child: Stack(
        children: [
          Container(
            width: width_,
            height: height_ * 0.4,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/bg4.png'),
                    fit: BoxFit.fill)),
          ),
          Positioned(
            right: width_ * 0.4,
            bottom: -(height_ * 0.06),
            child: Container(
              width: width_ * 0.7,
              child: SvgPicture.asset("assets/svgs/virus.svg"),
            ),
          ),
          Positioned(
            right: width_ * 0.3,
            bottom: (height_ < 684) ? -(height_ * 0.1) : -(height_ * 0.06),
            child: Container(
              width: (height_ < 684) ? width_ * 0.7 : width_ * 0.75,
              child: SvgPicture.asset("assets/svgs/doc2.svg"),
            ),
          ),
          Positioned(
              top: height_ * 0.1,
              right: width_ * 0.1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "COVID-19",
                    style: GoogleFonts.poppins(
                        fontSize: 38,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Contact Tracing",
                    style:
                        GoogleFonts.poppins(fontSize: 24, color: Colors.white),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}