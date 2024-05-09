import 'package:flutter/material.dart';

import 'package:intereses_ing_economica/intermedia_view_TIR.dart';
import 'package:intereses_ing_economica/intermedia_view_capitalizacion.dart';
import 'package:intereses_ing_economica/intermedia_view_gradientes.dart';
import 'package:intereses_ing_economica/intermedia_view_interes_simple.dart';

import 'package:intereses_ing_economica/intermedia_view_anualidades.dart';
import 'package:intereses_ing_economica/intermedia_view_interes_compuesto.dart';

import 'intermedia_view_amortizacion.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Calculadora de Interés')),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 320,
                height: 700,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue, // Color del borde
                    width: 2.0, // Ancho del borde
                  ),
                  borderRadius: BorderRadius.circular(10.0), // Radio de borde
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const Text("Parcial Ingeniería económica",
                        style: TextStyle(color: Colors.blue, fontSize: 20)),
                    const SizedBox(height: 40),
                    const Text("Hecho Por:",
                        style: TextStyle(color: Colors.blue, fontSize: 20)),
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 35),
                      child: Text("Hector Castaño\nCarlos Mendoza",
                          style: TextStyle(color: Colors.blue, fontSize: 20)),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 50,
                      width: 270,
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: ElevatedButton(
                          onPressed: () {
                            // Acción al presionar el botón de interés simple
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const IntermediaViewInteresSimple(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                                side: const BorderSide(color: Colors.blue)
                                // Border redondeado
                                ),
                            elevation: 5, // Sombra
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Icono
                              SizedBox(
                                  width:
                                      8), // Espacio entre el icono y el texto
                              Text(
                                'Interés Simple',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20), // Espacio entre botones
                    SizedBox(
                      width: 270,
                      height: 50,
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: ElevatedButton(
                          onPressed: () {
                            // Acción al presionar el botón de interés compuesto
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const IntermediaViewInteresCompuesto(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                                side: const BorderSide(color: Colors.blue)
                                // Border redondeado
                                ),
                            elevation: 5, // Sombra
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Icono
                              SizedBox(width: 8),
                              Text(
                                'Interés Compuesto',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20), // Espacio entre botones
                    SizedBox(
                      width: 270,
                      height: 50,
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: ElevatedButton(
                          onPressed: () {
                            // Acción al presionar el botón de tasa de interés
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const IntermediaViewAnualidades(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              side: const BorderSide(color: Colors.blue),
                            ),
                            elevation: 5, // Sombra
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Icono
                              SizedBox(width: 8),
                              Text(
                                'Anualidades',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20), // Espacio entre botones
                    SizedBox(
                      width: 270,
                      height: 50,
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: ElevatedButton(
                          onPressed: () {
                            // Acción al presionar el botón de interés simple
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const IntermediaViewGradientes(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                                side: const BorderSide(color: Colors.blue)
                                // Border redondeado
                                ),
                            elevation: 5, // Sombra
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(width: 8),
                              Text(
                                'Series Variables O Gradientes',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20), // Espacio entre botones
                    SizedBox(
                      width: 270,
                      height: 50,
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: ElevatedButton(
                          onPressed: () {
                            // Acción al presionar el botón de interés simple
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const IntermediaViewAmortizacion(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                                side: const BorderSide(color: Colors.blue)
                                // Border redondeado
                                ),
                            elevation: 5, // Sombra
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(width: 8),
                              Text(
                                'Armortización',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20), // Espacio entre botones
                    SizedBox(
                      width: 270,
                      height: 50,
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: ElevatedButton(
                          onPressed: () {
                            // Acción al presionar el botón de interés simple
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const IntermediaViewCapitalizacion(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                                side: const BorderSide(color: Colors.blue)
                                // Border redondeado
                                ),
                            elevation: 5, // Sombra
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(width: 8),
                              Text(
                                'Capitalización',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20), // Espacio entre botones
                    SizedBox(
                      width: 270,
                      height: 50,
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: ElevatedButton(
                          onPressed: () {
                            // Acción al presionar el botón de interés simple
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const IntermediaViewTIR(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                                side: const BorderSide(color: Colors.blue)
                                // Border redondeado
                                ),
                            elevation: 5, // Sombra
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(width: 8),
                              Text(
                                'TIR',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
