import 'package:flutter/material.dart';

// Punto de entrada de la app
void main() {
  runApp(const MyApp());
}

// Widget principal de la app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NovaCasa Login',
      theme: ThemeData(
        primarySwatch: Colors.blue, // Color principal de la app
      ),
      home: const LoginPage(), // Pantalla inicial: Login
    );
  }
}

// Pantalla de Login
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controladores para capturar lo que el usuario escribe
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Función que se ejecuta al presionar el botón "Entrar"
  void _login() {
    final email = _emailController.text;
    final password = _passwordController.text;

    // Validación básica: campos vacíos
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor completa todos los campos')),
      );
      return;
    }

    // Aquí iría la llamada al backend o la lógica de autenticación
    print('Email: $email, Password: $password');

    // Simulación de login exitoso: navegar a la pantalla Home
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'), // Título de la pantalla
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Espaciado interno
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centrar verticalmente
          children: [
            // Campo de texto para el email
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email', // Etiqueta del campo
                border: OutlineInputBorder(), // Borde del campo
              ),
            ),
            const SizedBox(height: 16), // Espacio entre campos

            // Campo de texto para la contraseña
            TextField(
              controller: _passwordController,
              obscureText: true, // Oculta el texto para passwords
              decoration: const InputDecoration(
                labelText: 'Contraseña',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 32), // Espacio antes del botón

            // Botón para hacer login
            ElevatedButton(
              onPressed: _login, // Llama a la función _login
              child: const Text('Entrar'),
            ),
          ],
        ),
      ),
    );
  }
}

// Pantalla Home a la que se navega después del login
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'), // Título de la pantalla Home
      ),
      body: const Center(
        child: Text(
          '¡Bienvenido a NovaCasa!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}