import 'package:flutter/material.dart';
import 'package:iva_app/home/login/data/models/usuario.model.dart';
import 'package:iva_app/home/login/data/repositories/cadastro.repository.dart';
import 'package:iva_app/home/login/presetation/pages/login.page.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({Key? key}) : super(key: key);

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  var cadastroRepository = CadastroRepository();
  final TextEditingController _celularController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _nomeCompletoController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _passwordVisible = false;
  double _passwordStrength = 0.0;

  bool _hasMinLength = false;
  bool _hasUppercase = false;
  bool _hasSpecialChar = false;
  bool _hasNumber = false;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _updatePasswordStrength(String password) {
    _hasMinLength = password.length >= 8;
    _hasUppercase = password.contains(RegExp(r'[A-Z]'));
    _hasSpecialChar = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    _hasNumber = password.contains(RegExp(r'[0-9]'));
    int criteriaMet = 0;
    if (_hasMinLength) criteriaMet++;
    if (_hasUppercase) criteriaMet++;
    if (_hasSpecialChar) criteriaMet++;
    if (_hasNumber) criteriaMet++;
    _passwordStrength = criteriaMet / 4.0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: <Widget>[
                Image.asset(
                  'assets/images/logoIva.png',
                  fit: BoxFit.cover,
                  height: 60.0,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "CADASTRO",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    backgroundColor: Colors.black,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 35),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Nome Completo',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  controller: _nomeCompletoController,
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Celular',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  controller: _celularController,
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  controller: _emailController,
                ),
                const SizedBox(height: 16),
                TextField(
                  obscureText: !_passwordVisible,
                  onChanged: (password) {
                    _updatePasswordStrength(password);
                  },
                  decoration: InputDecoration(
                    hintText: 'Digite a Senha',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  ),
                  controller: _senhaController,
                ),
                const SizedBox(height: 16),
                LinearProgressIndicator(
                  value: _passwordStrength,
                  backgroundColor: Colors.grey,
                ),
                const SizedBox(height: 8),
                _buildPasswordCriteria(
                    'Pelo menos 8 caracteres', _hasMinLength),
                _buildPasswordCriteria(
                    'Pelo menos uma letra maiúscula', _hasUppercase),
                _buildPasswordCriteria(
                    'Pelo menos um caractere especial', _hasSpecialChar),
                _buildPasswordCriteria('Pelo menos um número', _hasNumber),
                const SizedBox(height: 16),
                TextField(
                  obscureText: !_passwordVisible,
                  controller: _confirmPasswordController,
                  onChanged: (confirmPassword) {},
                  decoration: InputDecoration(
                    hintText: 'Confirme a Senha',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    UsuarioModel dadosUsuario = UsuarioModel(
                        nome: _nomeCompletoController.text,
                        celular: _celularController.text,
                        email: _emailController.text,
                        senha: _senhaController.text);
                    cadastroRepository
                        .cadastrarUsuario(dadosUsuario)
                        .then((value) {
                      if (value) {
                        sucessoCadastro();
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.yellow,
                    onPrimary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  child: const Text(
                    'CADASTRAR',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  sucessoCadastro() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Cadastro"),
            content: const Text("Cadastro realizado com sucesso!"),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: const Text("OK"))
            ],
          );
        });
  }

  Widget _buildPasswordCriteria(String text, bool isMet) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(
            isMet ? Icons.check_circle : Icons.circle,
            color: isMet ? Colors.green : Colors.red,
          ),
          const SizedBox(width: 8),
          Text(text),
        ],
      ),
    );
  }
}
