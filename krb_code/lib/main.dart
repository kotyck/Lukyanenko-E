import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/services.dart'; 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Менеджер паролей',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _passwordController = TextEditingController();
  String? masterPasswordHash;

  Future<void> _loadMasterPassword() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/master_password.json');
    if (await file.exists()!) {
      String contents = await file.readAsString();
      masterPasswordHash = json.decode(contents)['hash'];
    }
  }

    void _saveMasterPassword(String password) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/master_password.json');
    await file.writeAsString(json.encode({'hash': _hashPassword(password)}));
  }

  void _login() {
    if (masterPasswordHash == null) {
      _showSetMasterPasswordDialog();
    } 
    else {
      final inputPasswordHash = _hashPassword(_passwordController.text);
      if (inputPasswordHash == masterPasswordHash) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => PasswordManagerScreen()),
        );
      } 
      else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Неверный мастер-пароль')));
      }
    }
  }

    void _showSetMasterPasswordDialog() {
    showDialog(
      context: context,
      builder: (context) {
        String newPassword = '';
        return AlertDialog(
          title: Text('Установить мастер-пароль'),
          content: TextField(
            onChanged: (value) => newPassword = value,
            decoration: InputDecoration(labelText: 'Мастер-пароль'),
            obscureText: true,
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                _saveMasterPassword(newPassword);
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Мастер-пароль установлен')));
              },
              child: Text('Сохранить'),
            ),
          ],
        );
      },
    );
  }

  String _hashPassword(String password) {
    return sha256.convert(utf8.encode(password)).toString();
  }

  @override
  Widget build(BuildContext context) {
    _loadMasterPassword();
    return Scaffold(
      appBar: AppBar(
        title: Text('Вход'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(250.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Мастер-пароль'),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                child: Text('Войти'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PasswordManagerScreen extends StatefulWidget {
  @override
  _PasswordManagerScreenState createState() => _PasswordManagerScreenState();
}

class _PasswordManagerScreenState extends State<PasswordManagerScreen> {
  List<Map<String, dynamic>> _passwords = [];

  @override
  void initState() {
    super.initState();
    _loadPasswords();
  }

  Future<void> _loadPasswords() async {

    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/passwords.json');
    if (await file.exists()) {
      String contents = await file.readAsString();
      setState(() {
        _passwords = List<Map<String, dynamic>>.from(jsonDecode(contents));
      });
    }
  }

  Future<void> _savePasswords() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/passwords.json');
    await file.writeAsString(json.encode(_passwords));
  }

  void _addPassword() {
    showDialog(
      context: context,
      builder: (context) {
        String login = '';
        String password = '';
        return AlertDialog(
          title: Text('Добавить новый пароль'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) => login = value,
                decoration: InputDecoration(labelText: 'Логин'),
              ),
              TextField(
                onChanged: (value) => password = value,
                decoration: InputDecoration(labelText: 'Пароль'),
                obscureText: true,
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _passwords.add({'login': login, 'password': password});
                  _savePasswords();
                });
                Navigator.of(context).pop();
              },
              child: Text('Сохранить'),
            ),
          ],
        );
      },
    );
  }

  void _deletePassword(int index) {
    setState(() {
      _passwords.removeAt(index);
      _savePasswords();
    });
  }

  void _copyPassword(String password) {
    Clipboard.setData(ClipboardData(text: password)).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Пароль скопирован в буфер обмена')));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Менеджер паролей'),
        actions: [
          IconButton(
            onPressed: _addPassword, 
            icon: Icon(Icons.add),
            alignment: Alignment.center,
          )
        ],
      ),
      body: ListView.builder(
        itemCount: _passwords.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_passwords[index]['login']!,selectionColor: Colors.blueAccent,),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.copy, color: Colors.blue),
                  onPressed: () => _copyPassword(_passwords[index]['password']!),
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () => _deletePassword(index),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
