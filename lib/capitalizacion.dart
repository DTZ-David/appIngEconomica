// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';

class Capitalizacion extends StatefulWidget {
  const Capitalizacion({Key? key}) : super(key: key);

  @override
  _CapitalizacionState createState() => _CapitalizacionState();
}

enum TipoCapitalizacion { simple, compuesta }

class _CapitalizacionState extends State<Capitalizacion> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _capitalController = TextEditingController();
  final TextEditingController _tasaController = TextEditingController();
  final TextEditingController _periodosController = TextEditingController();
  double? _montoFuturo;
  List<double>? _interesesPagados;
  TipoCapitalizacion _tipoCapitalizacion = TipoCapitalizacion.compuesta;

  void _calcularMontoFuturo() {
    if (_formKey.currentState!.validate()) {
      double capital = double.parse(_capitalController.text);
      double tasa = double.parse(_tasaController.text);
      int periodos = int.parse(_periodosController.text);
      tasa = tasa / 100;
      List<double> interesesPagados = [];
      double montoFuturo;

      if (_tipoCapitalizacion == TipoCapitalizacion.simple) {
        // Fórmula de capitalización simple
        montoFuturo = capital * (1 + tasa * periodos);

        // Calcular el interés pagado en cada período
        double interesPorPeriodo = capital * tasa;
        for (int i = 0; i < periodos; i++) {
          interesesPagados.add(interesPorPeriodo);
        }
      } else {
        // Fórmula de capitalización compuesta
        montoFuturo = capital * pow((1 + tasa), periodos);

        // Calcular el interés pagado en cada período
        double capitalInicial = capital;
        for (int i = 0; i < periodos; i++) {
          double interes = capitalInicial * tasa;
          interesesPagados.add(interes);
          capitalInicial += interes;
        }
      }

      setState(() {
        _montoFuturo = montoFuturo;
        _interesesPagados = interesesPagados;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de Capitalización'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DropdownButtonFormField<TipoCapitalizacion>(
                value: _tipoCapitalizacion,
                onChanged: (TipoCapitalizacion? newValue) {
                  setState(() {
                    _tipoCapitalizacion = newValue!;
                  });
                },
                items:
                    TipoCapitalizacion.values.map((TipoCapitalizacion value) {
                  return DropdownMenuItem<TipoCapitalizacion>(
                    value: value,
                    child: Text(value == TipoCapitalizacion.simple
                        ? 'Simple'
                        : 'Compuesta'),
                  );
                }).toList(),
              ),
              TextFormField(
                controller: _capitalController,
                decoration: const InputDecoration(labelText: 'Capital inicial'),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese el capital inicial';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _tasaController,
                decoration: const InputDecoration(labelText: 'Tasa de interés'),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese la tasa de interés';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _periodosController,
                decoration:
                    const InputDecoration(labelText: 'Número de períodos'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese el número de períodos';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _calcularMontoFuturo,
                child: const Text('Calcular'),
              ),
              const SizedBox(height: 20.0),
              if (_montoFuturo != null && _interesesPagados != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Monto Futuro: ${NumberFormat.currency(symbol: '\$').format(_montoFuturo)}',
                      style: const TextStyle(fontSize: 18.0),
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      'Intereses pagados por periodo:',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(
                      height: 150,
                      child: ListView.builder(
                        itemCount: _interesesPagados!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Text(
                            'Periodo ${index + 1}: ${NumberFormat.currency(symbol: '\$').format(_interesesPagados![index])}',
                            style: const TextStyle(fontSize: 16.0),
                          );
                        },
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
