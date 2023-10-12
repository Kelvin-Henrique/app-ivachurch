import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iva_app/home/login/presetation/pages/cadastro.page.dart';
import 'package:iva_app/home/login/presetation/pages/login.page.dart';

class SlideInButton extends StatefulWidget {
  final Widget child;
  final double delay;
  final Duration duration;

  // ignore: use_key_in_widget_constructors
  const SlideInButton({
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

class BemVindoPage extends StatefulWidget {
  final List<String> welcomeMessages = [
    "Olá,",
    "seja bem-vindo",
  ];

  BemVindoPage({Key? key}) : super(key: key);

  @override
  _BemVindoPageState createState() => _BemVindoPageState();
}

class _BemVindoPageState extends State<BemVindoPage> {
  final List<String> backgroundImages = [
    'assets/images/img_home.jpg',
    'assets/images/img_home2.jpg',
  ];
  int currentBackgroundImageIndex = 0;

  @override
  void initState() {
    super.initState();

    Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        currentBackgroundImageIndex =
            (currentBackgroundImageIndex + 1) % backgroundImages.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Image.asset(
            backgroundImages[currentBackgroundImageIndex],
            height: 700,
            fit: BoxFit.cover,
            colorBlendMode: BlendMode.darken,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/logo.png',
                  color: Colors.yellow,
                  height: 200,
                  width: 460,
                ),
                const SizedBox(height: 5),
                TypewriterAnimatedTextKit(
                  speed: const Duration(milliseconds: 100),
                  totalRepeatCount: 1,
                  pause: const Duration(seconds: 1),
                  displayFullTextOnTap: true,
                  text: widget.welcomeMessages,
                  textStyle: const TextStyle(
                    fontSize: 36,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                SlideInButton(
                  delay: 0.5, // Atraso em segundos antes da animação começar
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      minimumSize: const Size(200, 50),
                    ),
                    child: const Text('LOGIN'),
                  ),
                ),
                const SizedBox(height: 20),
                SlideInButton(
                  delay: 1.0, // Atraso em segundos antes da animação começar
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CadastroPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      minimumSize: const Size(200, 50),
                    ),
                    child: const Text('CADASTRE-SE'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        color: Colors.black,
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.facebook, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.twitter, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.instagram, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

/* import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iva_app/home/login/presetation/pages/cadastro.page.dart';
import 'package:iva_app/home/login/presetation/pages/login.page.dart';

class SlideInButton extends StatefulWidget {
  final Widget child;
  final double delay;
  final Duration duration;

  // ignore: use_key_in_widget_constructors
  const SlideInButton({
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

class BemVindoPage extends StatelessWidget {
  final List<String> welcomeMessages = [
    "Olá,",
    "seja bem-vindo",
  ];

   BemVindoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/img_home2.jpg'), // Substitua pelo caminho da sua imagem de fundo
            fit: BoxFit.cover, // Pode ajustar o modo de exibição da imagem, se necessário
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5), // Ajuste a opacidade para controlar o escurecimento
              BlendMode.darken, // Isso aplica o filtro apenas ao fundo
            ),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/logo.png',
                color: Colors.yellow,
                height: 200,
                width: 460,
              ),
              const SizedBox(height: 5),
              TypewriterAnimatedTextKit(
                speed: const Duration(milliseconds: 100),
                totalRepeatCount: 1,
                pause: const Duration(seconds: 1),
                displayFullTextOnTap: true,
                text: welcomeMessages,
                textStyle: const TextStyle(
                  fontSize: 36,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
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
                    minimumSize: const Size(200, 50),
                  ),
                  child: const Text('LOGIN'),
                ),
              ),
              const SizedBox(height: 20),
              SlideInButton(
                delay: 1.0, // Atraso em segundos antes da animação começar
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CadastroPage(),
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    minimumSize: const Size(200, 50),
                  ),
                  child: const Text('CADASTRE-SE'),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        color: Colors.black,
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.facebook, color: Colors.white),
              onPressed: () {
              },
            ),
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.twitter, color: Colors.white),
              onPressed: () {
              },
            ),
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.instagram, color: Colors.white),
              onPressed: () {
              },
            ),
          ],
        ),
      ),
    );
  }
}
 */