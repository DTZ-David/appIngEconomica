import 'package:flutter/material.dart';

class TeoriaCapitalizacionView extends StatelessWidget {
  const TeoriaCapitalizacionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teoría de Capitalización'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Teoría:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              '''La capitalización: Explicación sencilla. \n Dicho de una manera un poco más clara y sencilla, la capitalización es el proceso por el cual una determinada cantidad de dinero aumenta.

Imagina que pones 1.000 euros en una cuenta de ahorro que te paga intereses. Con el tiempo, ese interés se suma al dinero original haciéndolo crecer. Por ejemplo, si te dan un 2% de interés anualmente sobre el capital inicial, es decir sobre los 1.000 euros, durante 3 años, al final de los tres años tendrías un 6% más de dinero.

Hay que decir que este crecimiento, o capitalización, puede darse de dos maneras principalmente: de forma simple o compuesta.

En la simple tu dinero genera intereses sólo sobre la cantidad inicial que pusiste, mientras que en la compuesta genera intereses no sólo sobre tu inversión inicial, sino también sobre los intereses que ya se han ido añadiendo. Esto lo que hace es que tu dinero vaya creciendo más rápidamente con el tiempo.

Por supuesto, también podemos hacer el proceso contrario de capitalizar, que es actualizar o descontar. Haciendo esto calculas el valor actual de una cantidad de dinero que recibirás en el futuro, teniendo en cuenta un tipo de interés en concreto.''',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Fórmula:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 10),
            Image.asset('assets/images/Capitalizacion.png'),
            const Text(
              'C0 : Capital inicial o capital en el año 0.',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Cn :  Capital en el año «n».',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              'i :    Tipo de interés de la operación.',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              'n :    Número de años.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
