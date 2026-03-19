import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/home.dart';
import 'dart:async';


class Login extends StatefulWidget {
  @override
  State<Login> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  DateTime? _loginTime;
  DateTime? get loginTime => _loginTime;


  void updateLoginTime(DateTime time) {
    setState(() {
      _loginTime = time;
    });
  }

  bool rememberMe = true;
  bool _showProgress = false;
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _loadRememberMeState();
  }

  @override
  void didUpdateWidget(covariant Login oldWidget) {
    super.didUpdateWidget(oldWidget);
    _clearFieldsIfNeeded();
  }

  _clearFieldsIfNeeded() {
    if (!rememberMe) {
      emailController.clear();
      passwordController.clear();
    }
  }

  _loadRememberMeState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      rememberMe = prefs.getBool('rememberMe') ?? true; // Check for 'rememberMe' preference
      if (rememberMe) {
        // Load email and password if rememberMe is true
        emailController.text = prefs.getString('email') ?? '';
        passwordController.text = prefs.getString('password') ?? '';
      }
    });
  }

  _saveRememberMeState() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('rememberMe', rememberMe);
    if (!rememberMe) {
      // Clear email and password if rememberMe is false
      await prefs.remove('email');
      await prefs.remove('password');
    } else {
      // Save email and password if rememberMe is true
      await prefs.setString('email', emailController.text);
      await prefs.setString('password', passwordController.text);
    }
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  bool isValidEmail(String email) {
    final RegExp emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',);
    return emailRegex.hasMatch(email);
  }

  bool isValidPassword(String password) {
    final RegExp passwordRegex = RegExp(r'^(?=.*[A-Z])(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}$');
    return passwordRegex.hasMatch(password);
  }
  Timer? sessionTimer;

  void _startSessionTimer() {
    sessionTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        // Update the login time and refresh the UI
        updateLoginTime(DateTime.now());
      });
    });
  }

  void _handleLogin() {
    setState(() {
      _showProgress = true; // Show the circular progress indicator
    });
    Future.delayed(Duration(seconds: 3), () {
      String? email = emailController.text;
      String? password = passwordController.text;
      if (_formKey.currentState!.validate()) {
        if (!isValidEmail(email)) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Invalid email format'),
            ),
          );
        } else if (!isValidPassword(password!)) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Invalid password format'),
            ),
          );
        }
        else if (email != 'kabildev@otech.com' || password != 'DEfault123##') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Incorrect email or password'),
            ),
          );
        } else {
          _startSessionTimer();
          DateTime loginTime = DateTime.now();
          updateLoginTime(loginTime);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Home(
                email: email,
                password: password,
                loginTime: loginTime,
              ),
            ),
          );
          _clearFieldsIfNeeded();
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Enter both email and password',style: TextStyle(color: Colors.red),),

          ),
        );
      }
      setState(() {
        _showProgress = false; // Hide the circular progress indicator
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login APP'),
          automaticallyImplyLeading: false,
        ),
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Image.asset(
                  'assets/images/login.png',
                  width: 100,
                ),
              ),
              CustomTextField(
                name: 'Email',
                controller: emailController,
                isPassword: false,
                obscureText: false,
              ),
              CustomTextField(
                name: 'Password',
                controller: passwordController,
                isPassword: true,
                obscureText: _obscureText,
                togglePasswordVisibility: _togglePasswordVisibility,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  children: [
                    Checkbox(
                      value: rememberMe,
                      onChanged: (value) {
                        setState(() {
                          rememberMe = value!;
                        });
                        _saveRememberMeState();
                      },
                    ),
                    Text('Remember Me'),
                  ],
                ),
              ),
              if (_showProgress)
                CircularProgressIndicator(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Center(
                  child: Button(
                    button_name: 'Login',
                    onPressed: _handleLogin,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

CustomTextField({required String name,
  required TextEditingController controller,
  required bool isPassword,
  required bool obscureText,
  VoidCallback? togglePasswordVisibility,}){
  return Padding(
    padding:const EdgeInsets.all(8.0),
    child: TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your $name';
        }
        return null;
      },
      obscureText: isPassword && obscureText,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(13.0),
        border: const OutlineInputBorder(),
        labelText: '$name',
        suffixIcon: isPassword
            ? IconButton(
          icon: Icon(
            obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: togglePasswordVisibility,
        )
            : null,
      ),
    ),
  );
}
Button({required String button_name,required Function onPressed,Color? color}){
  return ElevatedButton(
    onPressed:()=>onPressed(),
    child:Text('$button_name'),
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(vertical: 12),
      minimumSize: Size(100, 0),
      primary: color,
    ),
  );
}