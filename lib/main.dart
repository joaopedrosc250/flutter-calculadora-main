import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String numero = '0';
  double numeroP = 0.0;
  String operacao = '';
  String numeroJ = '0';
  void calcular(String tecla) {
    switch (tecla) {
      case '0':
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
      case '.':
        if (numero.length < 9) {
          setState(() {
            numero += tecla;
            if (numero.contains('.')) {
            } else {
              int numeroInt = int.parse(numero);
              numero = numeroInt.toString();
            }
          });
        }
        break;
      case '+':
      case '-':
      case '/':
      case 'X':
        operacao = tecla;
        numeroP = double.parse(numero);
        numero = '0';
        break;

      case '<X':
        setState(() {
          if (numero.length > 0) {
            numero = numero.substring(0, numero.length - 1);
            if (numero.length == 0) {
              numero = '0';
            }
          }
        });
        break;
      case '=':
        double resultado = 0.0;

        if (operacao == '/') {
          if (double.parse(numero) * 1 == 0) {
            setState(() {
              numero = 'ERRO';
            });
            return;
          }
        }
        if (operacao == '+') {
          resultado = numeroP + double.parse(numero);
        }
        if (operacao == '-') {
          resultado = numeroP - double.parse(numero);
        }
        if (operacao == '/') {
          resultado = numeroP / double.parse(numero);
        }
        if (operacao == 'X') {
          resultado = numeroP * double.parse(numero);
        }

        String resultadoS = resultado.toString();

        List<String> resultadoResto = resultadoS.split('.');

        if (int.parse(resultadoResto[1]) * 1 == 0) {
          setState(() {
            numero = int.parse(resultadoResto[0]).toString();
          });
        } else {
          setState(() {
            numero = resultado.toString();
          });
        }
        break;
      case 'AC':
        setState(() {
          numero = '0';
        });
        break;

      default:
        numero += tecla;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text('calculadora'),
            ),
          ),
          body: Container(
            decoration: BoxDecoration(color: Colors.grey.shade900),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      numero,
                      style: TextStyle(fontSize: 70, color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        onPressed: () => calcular('AC'),
                        child: Text(
                          'AC',
                          style: TextStyle(fontSize: 45),
                        )),
                    Text(
                      '',
                      style: TextStyle(fontSize: 45),
                    ),
                    Text(
                      '',
                      style: TextStyle(fontSize: 45),
                    ),
                    ElevatedButton(
                        onPressed: () => calcular('<X'),
                        child: Text(
                          '<X',
                          style: TextStyle(fontSize: 45),
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FloatingActionButton(
                        elevation: 0,
                        onPressed: () => calcular('7'),
                        backgroundColor: Colors.grey.shade900,
                        child: const Text(
                          '7',
                          style: TextStyle(fontSize: 45),
                        )),
                    FloatingActionButton(
                        elevation: 0,
                        onPressed: () => calcular('8'),
                        backgroundColor: Colors.grey.shade900,
                        child: const Text(
                          '8',
                          style: TextStyle(fontSize: 45),
                        )),
                    FloatingActionButton(
                        elevation: 0,
                        onPressed: () => calcular('9'),
                        backgroundColor: Colors.grey.shade900,
                        child: const Text(
                          '9',
                          style: TextStyle(fontSize: 45),
                        )),
                    ElevatedButton(
                        onPressed: () => calcular('/'),
                        child: Text(
                          '/',
                          style: TextStyle(fontSize: 45),
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FloatingActionButton(
                        elevation: 0,
                        onPressed: () => calcular('4'),
                        backgroundColor: Colors.grey.shade900,
                        child: const Text(
                          '4',
                          style: TextStyle(fontSize: 45),
                        )),
                    FloatingActionButton(
                        elevation: 0,
                        onPressed: () => calcular('5'),
                        backgroundColor: Colors.grey.shade900,
                        child: const Text(
                          '5',
                          style: TextStyle(fontSize: 45),
                        )),
                    FloatingActionButton(
                        elevation: 0,
                        onPressed: () => calcular('6'),
                        backgroundColor: Colors.grey.shade900,
                        child: const Text(
                          '6',
                          style: TextStyle(fontSize: 45),
                        )),
                    ElevatedButton(
                        onPressed: () => calcular('X'),
                        child: Text(
                          'x',
                          style: TextStyle(fontSize: 45),
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FloatingActionButton(
                        elevation: 0,
                        onPressed: () => calcular('1'),
                        backgroundColor: Colors.grey.shade900,
                        child: const Text(
                          '1',
                          style: TextStyle(fontSize: 45),
                        )),
                    FloatingActionButton(
                        elevation: 0,
                        onPressed: () => calcular('2'),
                        backgroundColor: Colors.grey.shade900,
                        child: const Text(
                          '2',
                          style: TextStyle(fontSize: 45),
                        )),
                    FloatingActionButton(
                        elevation: 0,
                        onPressed: () => calcular('3'),
                        backgroundColor: Colors.grey.shade900,
                        child: const Text(
                          '3',
                          style: TextStyle(fontSize: 45),
                        )),
                    ElevatedButton(
                        onPressed: () => calcular('-'),
                        child: const Text(
                          '-',
                          style: TextStyle(fontSize: 45),
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FloatingActionButton(
                        elevation: 0,
                        onPressed: () => calcular('0'),
                        backgroundColor: Colors.grey.shade900,
                        child: const Text(
                          '0',
                          style: TextStyle(fontSize: 45),
                        )),
                    FloatingActionButton(
                        elevation: 0,
                        onPressed: () => calcular('.'),
                        backgroundColor: Colors.grey.shade900,
                        child: const Text(
                          '.',
                          style: TextStyle(fontSize: 45),
                        )),
                    ElevatedButton(
                        onPressed: () => calcular('='),
                        child: Text(
                          '=',
                          style: TextStyle(fontSize: 45),
                        )),
                    ElevatedButton(
                        onPressed: () => calcular('+'),
                        child: Text(
                          '+',
                          style: TextStyle(fontSize: 45),
                        )),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
