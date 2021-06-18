import 'dart:math';

import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
      home: Home(),
    ));
}



class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _infoText = "Informe seus dados";
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _resetField(){
    weightController.text="";
    heightController.text="";
    setState(() {
    _infoText = "Informe seus dados";
    });
  }
  void _calculate(){
    setState(() {
    double result = double.parse(weightController.text)/pow(double.parse(heightController.text)/100,2);
    if(result<18.6){
      _infoText="Abaixo do peso (${result.toStringAsPrecision(3)})";
    }
    else if(result>=18.6 && result< 24.9){
      _infoText="Peso ideal (${result.toStringAsPrecision(4)})";
    }
    else if(result>=24.9 && result < 29.9){
      _infoText="Levemente acima do peso (${result.toStringAsPrecision(4)})";
    }
    else if(result>=29.9 && result < 34.9){
      _infoText="Obesidade Grau I (${result.toStringAsPrecision(4)})";
    }
    else if(result>=34.9 && result<39.9){
      _infoText="Obesidade Grau II (${result.toStringAsPrecision(4)})";
    }
    else if(result>39.9){
      _infoText="Obesidade Grau III (${result.toStringAsPrecision(4)})";
    }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text("Calculadora IMC"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [IconButton(icon: Icon(Icons.refresh),onPressed:_resetField)]
      ),
      backgroundColor: Colors.white,
      body:SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10,0.0, 10,0.0),
        child: 
        Form(
          key: _formKey,
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(Icons.person_outline,size:120,color: Colors.green),
              TextFormField(
                keyboardType: TextInputType.number, decoration: InputDecoration(labelText: "Peso (kg)",
              labelStyle: TextStyle(color: Colors.green)
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color:Colors.green, fontSize: 25),
              controller: weightController,
              validator: (dynamic value){
                  if(value.isEmpty){
                    return "Insira seu peso!";
                  }
                },
              ),
              TextFormField(keyboardType: TextInputType.number, decoration: InputDecoration(labelText: "Altura (cm)",
              labelStyle: TextStyle(color: Colors.green)
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color:Colors.green, fontSize: 25),
              controller: heightController,
              validator:(dynamic value){
                  if(value.isEmpty){
                    return "Insira sua altura";
                  }
                },
              ),
              Padding(padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
              child:
              Container(
                height:50.0,
                child:
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green),
                    onPressed:
                      _calculate
                    ,
                    child:Text("Calcular",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0
                      )
                    )
                  )
              )),
              Text(_infoText,
              textAlign: TextAlign.center, style: TextStyle(color:Colors.green,fontSize:25.0
                ),
              )
            ],
      )
        ),
      )
    );
  }
}

