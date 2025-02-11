import 'package:firebase/componetes/boto_auth.dart';
import 'package:firebase/componetes/textfield_auth.dart';
import 'package:flutter/material.dart';

class PaginaRegistro extends StatelessWidget {
  PaginaRegistro({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController tecEmail = TextEditingController();
    final TextEditingController tecPassword = TextEditingController();
    final TextEditingController tecConfirmPassword = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //logo.
                const Icon(Icons.fireplace, size: 120, color: Colors.yellow),

                const SizedBox(height: 25),

                //Frase.
                const Text("Crear una cuenta nueva",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),

                const SizedBox(height: 25),

                //Text divisoro.
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 150),
                  child: Row(
                    children: [
                      Expanded(
                          child: Divider(thickness: 1, color: Colors.white)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text("Registrate",
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)),
                      ),
                      Expanded(
                          child: Divider(thickness: 1, color: Colors.white)),
                    ],
                  ),
                ),

                //textField Email.
                TextfieldAuth(
                  controller: tecEmail,
                  obscureText: false,
                  hintText: "Email",
                ),
                TextfieldAuth(
                  controller: tecPassword,
                  obscureText: true,
                  hintText: "Password",
                ),
                TextfieldAuth(
                  controller: tecConfirmPassword,
                  obscureText: true,
                  hintText: "Confirmar Password",
                ),

                const SizedBox(height: 10),

                //no esta registardo?
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("¿Ya eres miembro?",
                        style: TextStyle(color: Colors.white)),
                    SizedBox(width: 5),
                    GestureDetector(
                      child: Text(
                        "Iniciar sesión",
                        style: TextStyle(
                          color: Colors.yellow,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                //boton de registro.
                BotoAuth()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
