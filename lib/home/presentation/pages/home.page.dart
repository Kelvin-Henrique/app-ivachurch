import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iva_app/home/login/presetation/pages/cadastro.page.dart';
import 'package:iva_app/home/login/presetation/pages/login.page.dart';

class SlideInButton extends StatefulWidget {
  final Widget child;
  final double delay;
  final Duration duration;

  SlideInButton({
    required this.child,
    this.delay = 0.0,
    this.duration = const Duration(milliseconds: 500),
  });

  @override
  _SlideInButtonState createState() => _SlideInButtonState();
}

class _SlideInButtonState extends State<SlideInButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: widget.duration, vsync: this);

    final curvedAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0), // Deslizar de baixo para cima
      end: Offset.zero,
    ).animate(curvedAnimation);

    // Adicione um atraso se necessário
    if (widget.delay > 0.0) {
      Future.delayed(Duration(milliseconds: (widget.delay * 1000).toInt()), () {
        _animationController.forward();
      });
    } else {
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class HomePage extends StatelessWidget {
  final List<String> welcomeMessages = [
    "Olá,",
    "seja bem-vindo",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/logo.png',
              color: Colors.yellow,
              height: 200,
              width: 460,
            ),
            SizedBox(height: 5),
            TypewriterAnimatedTextKit(
              speed: Duration(milliseconds: 100),
              totalRepeatCount: 1,
              pause: Duration(seconds: 1),
              displayFullTextOnTap: true,
              text: welcomeMessages,
              textStyle: TextStyle(
                fontSize: 36,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            SlideInButton(
              delay: 0.5, // Atraso em segundos antes da animação começar
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                )); 
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  minimumSize: Size(200, 50),
                ),
                child: Text('LOGIN'),
              ),
            ),
            SizedBox(height: 20),
            SlideInButton(
              delay: 1.0, // Atraso em segundos antes da animação começar
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CadastroPage(),
                ));
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  minimumSize: Size(200, 50),
                ),
                child: Text('CADASTRE-SE'),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        color: Colors.black,
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: FaIcon(FontAwesomeIcons.facebook, color: Colors.white),
              onPressed: () {
                // Lógica para abrir o link do Facebook
              },
            ),
            IconButton(
              icon: FaIcon(FontAwesomeIcons.twitter, color: Colors.white),
              onPressed: () {
                // Lógica para abrir o link do Twitter
              },
            ),
            IconButton(
              icon: FaIcon(FontAwesomeIcons.instagram, color: Colors.white),
              onPressed: () {
                // Lógica para abrir o link do Instagram
              },
            ),
          ],
        ),
      ),
    );
  }
}

/* import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_modular/flutter_modular.dart';


class HomePage extends StatelessWidget {
  final List<String> welcomeMessages = [
    "Olá,",
    "seja bem-vindo",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/logo.png',
              color: Colors.yellow,
              height: 200,
              width: 460,
            ),
            SizedBox(height: 5), // Reduzi a distância para 5 pixels
            TypewriterAnimatedTextKit(
              speed: Duration(milliseconds: 100),
              totalRepeatCount: 1,
              pause: Duration(seconds: 1),
              displayFullTextOnTap: true,
              text: welcomeMessages,
              textStyle: TextStyle(
                fontSize: 36,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Lógica para ação do botão "Entrar"
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                minimumSize: Size(200, 50),
              ),
              child: Text('ENTRAR'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Lógica para ação do botão "Cadastrar-se"
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                minimumSize: Size(200, 50),
              ),
              child: Text('CADASTRE-SE'),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        color: Colors.black,
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: FaIcon(FontAwesomeIcons.facebook, color: Colors.white),
              onPressed: () {
                // Lógica para abrir o link do Facebook
              },
            ),
            IconButton(
              icon: FaIcon(FontAwesomeIcons.twitter, color: Colors.white),
              onPressed: () {
                // Lógica para abrir o link do Twitter
              },
            ),
            IconButton(
              icon: FaIcon(FontAwesomeIcons.instagram, color: Colors.white),
              onPressed: () {
                // Lógica para abrir o link do Instagram
              },
            ),
            
          ],
        ),
      ),
    );
  }
}
 */