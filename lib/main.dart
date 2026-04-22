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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
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
                  ElevatedButton(onPressed: (){
                      if(_formKey.currentState!.validate()){
                        setState(() {
                          
                        });
                      }
                  }, 
                  child: Text('Cadastrar'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
