import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iva_app/core/widgets/painel-default/painel-default.widget.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PainelDefault(
      child: Column(
        children: [
          SizedBox(height: 20),
          Container(
            height: 220,
            width: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: CarouselSlider(
              options: CarouselOptions(
                height: 250,
                aspectRatio: 16 / 9,
                viewportFraction: 1.0, // Largura da visualização de cada item
                initialPage: 0,
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 5),
                autoPlayAnimationDuration: Duration(milliseconds: 1500),
                autoPlayCurve: Curves.fastOutSlowIn,
              ),
              items: [
                GestureDetector(
                  onTap: () async {

                    
                  
                    const url = 'https://www.flickr.com/photos/ivadiadema/albums'; // Substitua pelo URL desejado
                      await launch(url); 

                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset(
                      'assets/images/carrosel_1.png',
                      fit: BoxFit.cover,
                      height: 200.0,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    const url = 'https://www.google.com/maps/place/Av.+Sete+de+Setembro,+658+-+Centro,+Diadema+-+SP,+09912-010/@-23.6901177,-46.6163709,17z/data=!4m6!3m5!1s0x94ce44f40d0f3e63:0x697d9aa5ef109a7a!8m2!3d-23.6901177!4d-46.6163709!16s%2Fg%2F11c278mdx2?entry=ttu'; 
                    await launch(url);
                    
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset(
                      'assets/images/carrosel_2.png',
                      fit: BoxFit.cover,
                      height: 200.0,
                    ),
                  ),
                ),
                /* GestureDetector(
                  onTap: () async {
                    const url = 'https://seu-outro-link.com'; // Substitua pelo segundo URL desejado
                    if (await canLaunch(url)) {
                      await launch(url);
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset(
                      'assets/images/carrocel_3.png',
                      fit: BoxFit.cover,
                      height: 200.0,
                    ),
                  ),
                ), */
              ],
            ),
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(right: 15, left: 10),
                width: 170,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: FaIcon(
                        FontAwesomeIcons.peopleRoof,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text("GC", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
                    Text("GRUPO DE CONEXÃO", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 10),),
                    
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 10),
                width: 170,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: FaIcon(
                        FontAwesomeIcons.peopleCarryBox,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                    Text("", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
                    Text("VOLUNTÁRIOS", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          /* Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(right: 15, left: 10),
                width: 170,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [/* 
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: FaIcon(
                        FontAwesomeIcons.peopleRoof,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text("GC", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
                    Text("GRUPO DE CONEXÃO", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 10),), */
                    
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 10),
                width: 170,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [/* 
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: FaIcon(
                        FontAwesomeIcons.peopleCarryBox,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                    Text("", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
                    Text("VOLUNTÁRIOS", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),), */
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(right: 15, left: 10),
                width: 170,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [/* 
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: FaIcon(
                        FontAwesomeIcons.peopleRoof,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text("GC", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
                    Text("GRUPO DE CONEXÃO", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 10),), */
                    
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 10),
                width: 170,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    /* Container(
                      margin: EdgeInsets.only(top: 10),
                      child: FaIcon(
                        FontAwesomeIcons.peopleCarryBox,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                    Text("", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
                    Text("", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),), */
                  ],
                ),
              ),
            ],
          ), */
        ],
      ),
    );
  }
}
