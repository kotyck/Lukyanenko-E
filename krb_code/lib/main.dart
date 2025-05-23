import 'dart:convert'; //для конвертирования данных в нужную кодировку
import 'dart:io'; //для ввода информации с текстовых полей
import 'package:flutter/material.dart'; //для работы приложения
import 'package:path_provider/path_provider.dart'; //для работы с путями 
import 'package:crypto/crypto.dart'; //для хеширования паролей
import 'package:flutter/services.dart';//для работы с буфером обмена

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

//класс экрана входа
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> { 
  final TextEditingController _passwordController = TextEditingController();
  String? masterPasswordHash;

  //функция для чтения мастер-пароля
  Future<void> _loadMasterPassword() async { 
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/master_password.json');
   if (await file.exists()) {
      String contents = await file.readAsString();
      masterPasswordHash = json.decode(contents)['hash'];
    }
  }

  //функция для записи мастер-пароля(активируется в том случае если он еще не задан)
  void _saveMasterPassword(String password) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/master_password.json');
    await file.writeAsString(json.encode({'hash': _hashPassword(password)}));
  }

  //функция для аутентификации
  void _login() {
    _loadMasterPassword();
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

  //функция для диалогового окна, предназначенного для записи мастер-пароля
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

//функия для хэширования паролей
String _hashPassword(String password) {
  return sha256.convert(utf8.encode(password)).toString();
}

//класс экрана менеджера паролей
class PasswordManagerScreen extends StatefulWidget {
  const PasswordManagerScreen({super.key});

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

  //функция для чтения всех локальных паролей 
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

  //функция дл сохранения всех локальных паролей
  Future<void> _savePasswords() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/passwords.json');
    await file.writeAsString(json.encode((_passwords)));
  }

  //функция для добавления нового пароля
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

  //функция для удаления пароля из памяти
  void _deletePassword(int index) {
    setState(() {
      _passwords.removeAt(index);
      _savePasswords();
    });
  }

  //функция для копирования пароля в буфер обмена
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
          IconButton( //кпонка для добавления нового пвроля
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
                IconButton( //кнопка для копирования пароля в буфер обмена
                  icon: Icon(Icons.copy, color: Colors.blue),
                  onPressed: () => _copyPassword(_passwords[index]['password']!),
                ),
                IconButton( //кнопка для удавления пароля из памяти
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
