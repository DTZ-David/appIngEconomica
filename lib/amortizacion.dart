import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';

enum FrecuenciaPago {
  Mensual,
  Trimestral,
  Anual,
}

class Amortizacion extends StatefulWidget {
  const Amortizacion({Key? key}) : super(key: key);

  @override
  _AmortizacionState createState() => _AmortizacionState();
}

class _AmortizacionState extends State<Amortizacion> {
  TextEditingController montoController = TextEditingController();
  TextEditingController tasaInteresController = TextEditingController();
  TextEditingController fechaInicioController = TextEditingController();
  TextEditingController fechaFinController = TextEditingController();
  TextEditingController pagoFrecuenciaController = TextEditingController();
  FrecuenciaPago? frecuenciaPago;
  double vp = 0.0;
  double vf = 0.0;

  List<List<double>> amortizacionData = [];
  void calcularMontoPagoFrecuencia() {
    double monto = double.tryParse(montoController.text) ?? 0.0;
    double tasaInteres =
        (double.tryParse(tasaInteresController.text) ?? 0) / 100;
    DateTime fechaInicio =
        DateFormat('dd/MM/yyyy').parse(fechaInicioController.text);
    DateTime fechaFin = DateFormat('dd/MM/yyyy').parse(fechaFinController.text);
    int totalPeriodos = 0;
    int interesAux = 0;
    // Calcular totalPeriodos
    if (frecuenciaPago == FrecuenciaPago.Mensual) {
      totalPeriodos = fechaFin.difference(fechaInicio).inDays ~/ 30;
      interesAux = 12;
    } else if (frecuenciaPago == FrecuenciaPago.Trimestral) {
      totalPeriodos = fechaFin.difference(fechaInicio).inDays ~/ 90;
      interesAux = 4;
    } else if (frecuenciaPago == FrecuenciaPago.Anual) {
      totalPeriodos = fechaFin.year - fechaInicio.year;
      interesAux = totalPeriodos;
    }

    // Ajustar el número de períodos si no está completo
    if (totalPeriodos <= 0) {
      totalPeriodos = 1;
    }
    double montoPagoFrecuencia;
    // Calcular Monto de Pago con Frecuencia
    if (totalPeriodos > 0) {
      montoPagoFrecuencia = (monto * (tasaInteres / interesAux));
      montoPagoFrecuencia = montoPagoFrecuencia /
          (1 - pow(1 + (tasaInteres / interesAux), -totalPeriodos));
      pagoFrecuenciaController.text = montoPagoFrecuencia.toStringAsFixed(2);
    }
  }

  void calcularAmortizacion() {
    if (pagoFrecuenciaController.text.isEmpty) {
      calcularMontoPagoFrecuencia();
    }
    double monto = double.tryParse(montoController.text) ?? 0.0;
    double tasaInteres =
        (double.tryParse(tasaInteresController.text) ?? 0) / 100;
    DateTime fechaInicio =
        DateFormat('dd/MM/yyyy').parse(fechaInicioController.text);
    DateTime fechaFin = DateFormat('dd/MM/yyyy').parse(fechaFinController.text);
    double pagoFrecuencia =
        double.tryParse(pagoFrecuenciaController.text) ?? 0.0;

    // Calcular el número total de periodos
    int totalPeriodos = 0;
    if (frecuenciaPago == FrecuenciaPago.Mensual) {
      totalPeriodos = fechaFin.difference(fechaInicio).inDays ~/ 30;
      tasaInteres = tasaInteres / 12;
    } else if (frecuenciaPago == FrecuenciaPago.Trimestral) {
      totalPeriodos = fechaFin.difference(fechaInicio).inDays ~/ 90;
      tasaInteres = tasaInteres / 4;
    } else if (frecuenciaPago == FrecuenciaPago.Anual) {
      totalPeriodos = fechaFin.year - fechaInicio.year;
    }

    // Ajustar el número de períodos si no está completo
    if (totalPeriodos <= 0) {
      totalPeriodos = 1;
    }

    // Calcular la amortización
    amortizacionData.clear();
    double saldoRestante = monto;

    for (int periodo = 1; periodo <= totalPeriodos; periodo++) {
      double interes = saldoRestante * tasaInteres;
      double principal = pagoFrecuencia - interes;
      saldoRestante -= principal;
      if (saldoRestante < 0) {
        saldoRestante = 0;
      }
      amortizacionData.add([
        periodo.toDouble(),
        pagoFrecuencia,
        principal,
        interes,
        saldoRestante
      ]);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de Amortización'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: montoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Monto'),
            ),
            TextField(
              controller: tasaInteresController,
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(labelText: 'Tasa de Interés (%)'),
            ),
            TextField(
              controller: fechaInicioController,
              keyboardType: TextInputType.datetime,
              decoration: const InputDecoration(
                  labelText: 'Fecha de Inicio (dd/MM/yyyy)'),
            ),
            TextField(
              controller: fechaFinController,
              keyboardType: TextInputType.datetime,
              decoration:
                  const InputDecoration(labelText: 'Fecha de Fin (dd/MM/yyyy)'),
            ),
            DropdownButtonFormField<FrecuenciaPago>(
              value: frecuenciaPago,
              onChanged: (FrecuenciaPago? newValue) {
                setState(() {
                  frecuenciaPago = newValue;
                });
              },
              items:
                  FrecuenciaPago.values.map<DropdownMenuItem<FrecuenciaPago>>(
                (FrecuenciaPago value) {
                  return DropdownMenuItem<FrecuenciaPago>(
                    value: value,
                    child: Text(value.toString().split('.').last),
                  );
                },
              ).toList(),
              decoration: const InputDecoration(
                labelText: 'Frecuencia de Pago',
              ),
            ),
            TextField(
              controller: pagoFrecuenciaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: 'Monto de Pago con Frecuencia'),
            ),
            ElevatedButton(
              onPressed: calcularAmortizacion,
              child: const Text('Calcular'),
            ),
            const SizedBox(height: 20),
            Table(
              border: TableBorder.all(),
              columnWidths: const {
                0: FlexColumnWidth(1.0),
                1: FlexColumnWidth(1.0),
                2: FlexColumnWidth(1.0),
                3: FlexColumnWidth(1.0),
                4: FlexColumnWidth(1.0),
              },
              children: [
                const TableRow(
                  children: [
                    TableCell(child: Center(child: Text('Periodo'))),
                    TableCell(child: Center(child: Text('Cuota'))),
                    TableCell(child: Center(child: Text('Capital Amortizado'))),
                    TableCell(child: Center(child: Text('Interés'))),
                    TableCell(child: Center(child: Text('Capital Pendiente'))),
                  ],
                ),
                ...amortizacionData.map(
                  (data) => TableRow(
                    children: data
                        .map<Widget>(
                          (value) => TableCell(
                              child: Center(
                                  child: Text(value.toStringAsFixed(2)))),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
