import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MaterialApp(
    title: "Contador",
    home: Home()
  ));
}

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _pessoa = 0;
  String _info = "";
  int _limite = 20;

  void _alterarPessoa(int valor) {
    setState(() {
      if((_pessoa + valor) >= 0 && (_pessoa + valor) <= _limite){
        _pessoa += valor;
      }
      if (_pessoa == _limite){
        _info = "Restaurante atingiu o limite de pessoas.";
      }
      else{
        _info = "";
      }


    });
  }

  @override
  Widget build(BuildContext context) {
   return Stack(
     children: <Widget>[
      Image.asset("images/restaurant.jpg",
                  fit: BoxFit.cover,
                  height: 1000,
                  ),
       Column(
         mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Text("Pessoas $_pessoa",
                  style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.none
                  ),
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 TextButton(onPressed: (){
                   _alterarPessoa(1);
                 },
                   child: Text("+1",
                   style: TextStyle(color: Colors.green,
                                    fontSize: 30))
                 ),
                 TextButton(onPressed: (){
                   _alterarPessoa(-1);
                 },
                    child: Text("-1",
                                style: TextStyle(
                                color: Colors.red,
                                fontSize: 30
                                ),
                    ),
                 )
               ],
             ),

             Text(_info,
                 style: TextStyle(
                                color:Colors.yellow,
                                fontStyle: FontStyle.normal,
                                fontSize: 30,
                                decoration: TextDecoration.none
             ))
           ],
       )
     ],
   );
  }
}


