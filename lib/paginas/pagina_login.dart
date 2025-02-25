import 'package:firebase/auth/servei_auth.dart';
import 'package:firebase/componetes/boto_auth.dart';
import 'package:firebase/componetes/textfield_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PaginaLogin extends StatelessWidget {

    final Function()? hacerClic;

  PaginaLogin({super.key,
    required this.hacerClic,
  });

  void ferLogin(BuildContext context, String email, String password) async {
    String? error = await ServeiAuth().loginConEmailPassword(email, password);

    if (error != null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.yellow,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text("Error"),
          content: Text(error),
        ),
      );
    } else {
      print("Login correcto");
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController tecEmail = TextEditingController();
    final TextEditingController tecPassword = TextEditingController();

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
                const Text("Bienvenido de nuevo",
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
                        child: Text("Hacer login",
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

                const SizedBox(height: 10),

                //no esta registardo?
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Aun no eres miebro?",
                        style: TextStyle(color: Colors.white)),
                    SizedBox(width: 5),
                    GestureDetector(
                      onTap: hacerClic,
                      child: Text(
                        "Registrate",
                        style: TextStyle(
                          color: Colors.yellow,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                //boton de registro.
                BotoAuth(
                  texto: "Login",
                  onTap: () => ferLogin(
                    context,
                    tecEmail.text,
                    tecPassword.text,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
