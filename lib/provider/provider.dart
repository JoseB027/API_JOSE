import 'dart:convert';
import 'dart:developer';
import 'package:api_random_user/models/model_user.dart';
import 'package:http/http.dart' as http;


class Api{
  /*

* Creo una clase llama "Api"

*/
  Future<Result> useApi() async{
      /*
      * Uso un future y le agrego un tipo de dato
      *  Luego nombramos la función, en este caso "useApi", 
      * la cual es una función asíncrona (espera de datos)
      */
    final respuesta = await http.get(
      /*
      * Se crea un objeto "respuesta", se usa un await, 
      *que esto hacer que el programa espere el resultado de la función que le sigue
      */
      Uri.parse("https://randomuser.me/api/"),
    );

    final decoded = json.decode(respuesta.body);
    final x = Modelo.fromJson(decoded);
    //En esta parte los datos son pasados a datos reales para ser mostrados 

    //Aquí se reciben los resultados, como se devuelve una lista con un solo elemento, entonces es [0]
    log(x.results[1].name.first);
    final resultado = x.results[0];
    return resultado;
    }
}