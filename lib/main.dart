import 'package:flutter/material.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomeController = 
  TextEditingController();

  void _calcular(){
      if(_formKey.currentState!.validate()){
        setState(() {});
      }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.app_registration,color: Colors.white,),
          title: Text('Formulário',style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 30),
          child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                spacing: 15,
                children: [
                  TextFormField(
                    controller: _nomeController,
                    decoration: InputDecoration(
                      labelText: 'Nome',
                      hintText: 'Digite seu nome',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person)
                            
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return 'Digite um nome';
                      }
                      if(value.length < 3){
                        return 'Digite ao menos 3 letras';
                      }
                    },
                  ),
                  Text(_nomeController.text),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 15),
                      ),
                      onPressed: (){
                        _calcular();
                  },
                      child: Text('Enviar'),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
