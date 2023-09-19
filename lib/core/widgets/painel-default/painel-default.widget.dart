import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PainelDefault extends StatelessWidget{
  const PainelDefault({Key? key}) : super(key: key);

  @override 

  Widget build (BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Image.asset('assets/images/logoIva.png', fit: BoxFit.cover, height: 50.0,),
          backgroundColor: Colors.black,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(decoration: const BoxDecoration(
                color: Colors.black
              ),
                child: Column( children: [
                  Image.asset('assets/images/logoBranco.png', fit: BoxFit.cover, height: 108.0,),
                  const SizedBox(height: 10.0,),
                  Row (children: [
                    const FaIcon(FontAwesomeIcons.locationDot, color: Colors.yellow,size: 12,),
                    const SizedBox(height: 13,),
                    const Text(" Campus Diadema", style: TextStyle(color: Colors.yellow, fontSize: 12),)

                  ],)
                ],
                ),
                
              
              ),
              Column(
                children: [
                  ElevatedButton.icon(style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    onPrimary: const Color.fromARGB(255, 255, 255, 255),
                    ),
                    onPressed: (){}, 
                    icon: const Icon(Icons.person, color: Colors.yellow), 
                    label: const Text('ATUALIZAR CADASTRO'),
                  ),
                  ElevatedButton.icon(style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    onPrimary: const Color.fromARGB(255, 255, 255, 255),
                    ),
                    onPressed: (){}, 
                    icon: const FaIcon(FontAwesomeIcons.bookBible, color: Colors.yellow), 
                    label: const Text('       DEVOCIONAL            '),
                  ),
                  ElevatedButton.icon(style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    onPrimary: Colors.white,
                    ),
                    onPressed: (){} , 
                    icon: const FaIcon(FontAwesomeIcons.church, color: Colors.yellow), 
                    label: const Text('       NOSSA IGREJA       '),
                  ),
                  ElevatedButton.icon(style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    onPrimary: Colors.white,
                    ),
                    onPressed: (){}, 
                    icon: const FaIcon(FontAwesomeIcons.peopleRoof, color: Colors.yellow), 
                    label: const Text('GRUPOS DE CONEXÃO'),
                  ),
                  ElevatedButton.icon(style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    onPrimary: Colors.white,
                    ),
                    onPressed: (){} , 
                    icon: const FaIcon(FontAwesomeIcons.peopleGroup, color: Colors.yellow), 
                    label: const Text('       VOLUNTÁRIOS       '),
                  ),
                  ElevatedButton.icon(style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    onPrimary: Colors.white,
                    ),
                    onPressed: (){}, 
                    icon: const FaIcon(FontAwesomeIcons.handHoldingDollar, color: Colors.yellow), 
                    label: const Text('      GENEROSIDADE       '),
                  ),
                 ElevatedButton.icon(style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    onPrimary: Colors.white,
                    ),
                    onPressed: (){}, 
                    icon: const Icon(Icons.attach_money, color: Colors.yellow), 
                    label: const Text('BALANÇO FINANCEIRO'),
                  ),
                  ElevatedButton.icon(style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    onPrimary: Colors.white,
                    ),
                    onPressed: (){} , 
                    icon: const Icon(Icons.school_outlined, color: Colors.yellow), 
                    label: const Text('         IVA COLLEGE         '),
                  ),
                  ElevatedButton.icon(style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    onPrimary: Colors.white,
                    ),
                    onPressed: (){} , 
                    icon: const FaIcon(FontAwesomeIcons.personPraying, color: Colors.yellow), 
                    label: const Text('  PEDIDOS DE ORAÇÃO  '),
                  ),
                  ElevatedButton.icon(style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    onPrimary: Colors.white,
                    ),
                    onPressed: (){} , 
                    icon: const FaIcon(FontAwesomeIcons.clock, color: Colors.yellow), 
                    label: const Text(' HORÁRIOS DE CULTOS '),
                  ),
                  ElevatedButton.icon(style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    onPrimary: Colors.white,
                    ),
                    onPressed: (){} , 
                    icon: const FaIcon(FontAwesomeIcons.locationDot, color: Colors.yellow), 
                    label: const Text('  NOSSOS ENDEREÇOS  '),
                  ),
                  ElevatedButton.icon(style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    onPrimary: Colors.white,
                    ),
                    onPressed: (){} , 
                    icon: const FaIcon(FontAwesomeIcons.whatsapp, color: Colors.yellow), 
                    label: const Text('           WHATSAPP           '),
                  ),
                  ElevatedButton.icon(style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    onPrimary: Colors.white,
                    ),
                    onPressed: (){} , 
                    icon: const Icon(Icons.calendar_month, color: Colors.yellow), 
                    label: const Text('            EVENTOS            '),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}