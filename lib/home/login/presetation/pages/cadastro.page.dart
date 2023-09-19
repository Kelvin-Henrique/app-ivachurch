import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: CadastroPage(),
  ));
}

class CadastroPage extends StatefulWidget {
  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
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
    // Lógica para calcular a força da senha
    // Implemente sua própria lógica aqui para avaliar a senha
    // A variável _passwordStrength deve ser um valor entre 0.0 e 1.0
    // 0.0 indica fraca, 1.0 indica forte
    // Atualize _passwordStrength e os critérios conforme necessário

    // Exemplo simples: verificar se a senha tem pelo menos 8 caracteres
    _hasMinLength = password.length >= 8;

    // Exemplo: verificar se a senha contém pelo menos uma letra maiúscula
    _hasUppercase = password.contains(RegExp(r'[A-Z]'));

    // Exemplo: verificar se a senha contém pelo menos um caractere especial
    _hasSpecialChar = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

    // Exemplo: verificar se a senha contém pelo menos um número
    _hasNumber = password.contains(RegExp(r'[0-9]'));

    // Calcular a força da senha com base nos critérios
    int criteriaMet = 0;
    if (_hasMinLength) criteriaMet++;
    if (_hasUppercase) criteriaMet++;
    if (_hasSpecialChar) criteriaMet++;
    if (_hasNumber) criteriaMet++;

    // Atualizar a força da senha (um quarto do progresso por critério)
    _passwordStrength = criteriaMet / 4.0;

    // Atualizar a interface do usuário
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
        padding: EdgeInsets.all(20.0),
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16),
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
                SizedBox(height: 35),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Nome Completo',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Celular',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 16),
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
                ),
                SizedBox(height: 16),
                LinearProgressIndicator(
                  value: _passwordStrength,
                  backgroundColor: Colors.grey,
                ),
                SizedBox(height: 8),
                _buildPasswordCriteria(
                    'Pelo menos 8 caracteres', _hasMinLength),
                _buildPasswordCriteria(
                    'Pelo menos uma letra maiúscula', _hasUppercase),
                _buildPasswordCriteria(
                    'Pelo menos um caractere especial', _hasSpecialChar),
                _buildPasswordCriteria('Pelo menos um número', _hasNumber),
                SizedBox(height: 16),
                TextField(
                  obscureText: !_passwordVisible,
                  controller: _confirmPasswordController,
                  onChanged: (confirmPassword) {
                    // Você pode adicionar aqui a lógica para verificar se a senha e a confirmação são iguais
                  },
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
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Verificar se a senha e a confirmação de senha são iguais
                    if (_passwordController.text !=
                        _confirmPasswordController.text) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('ERRO'),
                            content: Text(
                                'A senha e a confirmação de senha não são iguais.'),
                            actions: <Widget>[
                              TextButton(
                                child: Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.yellow,
                    onPrimary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  child: Text(
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

  Widget _buildPasswordCriteria(String text, bool isMet) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(
            isMet ? Icons.check_circle : Icons.circle,
            color: isMet ? Colors.green : Colors.red,
          ),
          SizedBox(width: 8),
          Text(text),
        ],
      ),
    );
  }
}