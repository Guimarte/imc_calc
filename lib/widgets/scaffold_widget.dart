import 'package:flutter/material.dart';

class ScaffoldWidget extends StatefulWidget {
  const ScaffoldWidget({Key? key}) : super(key: key);

  @override
  _ScaffoldWidgetState createState() => _ScaffoldWidgetState();
}

class _ScaffoldWidgetState extends State<ScaffoldWidget> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _info = "Informe seus dados :D";
  void _resetFields() {
    setState(() {
      weightController.text = "";
      heightController.text = "";
      _info = "Informe seus dados :D";
      _formKey = GlobalKey<FormState>();
    });
  }

  void _calcImc() {
    setState(
      () {
        double weight = double.parse(weightController.text);
        double height = double.parse(heightController.text) / 100;
        double imc = weight / (height * height);
        print(imc);
        if (imc < 18.6) {
          _info = "Abaixo do peso(${imc.toStringAsPrecision(3)})";
        } else if (imc >= 18.6 && imc < 24.9) {
          _info = "Peso Ideal(${imc.toStringAsPrecision(3)})";
        } else if (imc >= 24.9 && imc < 29.9) {
          _info = "Levemente acima do peso(${imc.toStringAsPrecision(3)})";
        } else if (imc >= 29.9 && imc < 34.9) {
          _info = "Obesidade Grau I(${imc.toStringAsPrecision(3)})";
        } else if (imc >= 34.9 && imc < 39.9) {
          _info = "Obesidade Grau II(${imc.toStringAsPrecision(3)})";
        } else if (imc >= 40) {
          _info = "Obesidade Grau III(${imc.toStringAsPrecision(3)})";
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        actions: [
          IconButton(
            onPressed: _resetFields,
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10, 0.0, 10, 0.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(
                  Icons.person_outline,
                  color: Colors.deepPurpleAccent,
                  size: 120.00,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Peso(KG)",
                    labelStyle: TextStyle(
                      color: Colors.deepPurpleAccent,
                    ),
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.purpleAccent,
                    fontSize: 25.0,
                  ),
                  controller: weightController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Insira seu Peso!";
                    }
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Altura(CM)",
                    labelStyle: TextStyle(
                      color: Colors.deepPurpleAccent,
                    ),
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.deepPurpleAccent,
                    fontSize: 25.0,
                  ),
                  controller: heightController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Insira sua Altura!";
                    }
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Container(
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _calcImc();
                        }
                      },
                      child: Text(
                        "Calcular",
                        style: TextStyle(color: Colors.white, fontSize: 25.0),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.deepPurpleAccent),
                      ),
                    ),
                  ),
                ),
                Text(
                  _info,
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(color: Colors.deepPurpleAccent, fontSize: 25.0),
                )
              ],
            ),
          )),
    );
  }
}
