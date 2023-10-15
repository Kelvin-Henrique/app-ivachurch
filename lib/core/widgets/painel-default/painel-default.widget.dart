/* import 'package:flutter/material.dart';
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
      ),
    );
  }
} */
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iva_app/home/presentation/pages/bem-vindo.page.dart';

class PainelDefault extends StatefulWidget {
  final Function? onTap;
  final Widget? child;
  final bool menuOpen;
  final bool? backButton;
  const PainelDefault({this.onTap, this.menuOpen = false,  this.child, this.backButton}) : super();

  @override
  _PainelDefaultState createState() => new _PainelDefaultState();
}

class _PainelDefaultState extends State<PainelDefault> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Scaffold(
          appBar: AppBar(
            leading: widget.backButton == true
                ? IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      Modular.to.pushNamed('/bem-vindo');
                    },
                  )
                : null,
            iconTheme: Theme.of(context).iconTheme,
            elevation: 0,
            centerTitle: true,
            title: Container(
              width: 90,
              child: Image.asset(
                "assets/images/logo.png",
                width: 50,
                height: 60
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                ),
                onPressed: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BemVindoPage()),
                    );
                },
              ),
            ],
            backgroundColor: Colors.black,
            
          ),
          body: Center(
            child: widget.child,
          ),
          
        ));
  }
}
