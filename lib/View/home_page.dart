import 'package:flutter/material.dart';
import 'package:api_random_user/models/model_user.dart';
import 'package:api_random_user/provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder(
      /*
      * Se hizo uso de un widget que lee los Future y nos permite manipular la información.

      */
          future: Api().useApi(), //se coloca el future (Api)
          builder: (BuildContext context, AsyncSnapshot<Result> snapshot)
          // builder nos pide una función, la función nos pide el contexto de la aplicación
          //y nos pide una variable, la cual será quien recibirá
          //el valor que devuelve el Future, en este caso "Result"
          {
            if (snapshot.hasData) {
              /*
              * Dentro de la función revisamos si el snapshot recibió
              *información con la propiedad .hasData y si tiene información entonces la mostramos
              * Y esta(hasData) Devuelve si snapshot contiene un valor de datos no nulo.

              */
              final Result data = snapshot.data!;
              return Column(
                children: [
                  Expanded(child: ListView.builder(
                    itemCount: data.hashCode,
                    itemBuilder: (BuildContext context, int index){
                      return Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.blue, width: 1)
                          )
                        ),
                        child: Column(
                          children: [
                            CircleAvatar(radius: 70, backgroundImage: NetworkImage("${data.picture}"),),
                            Text("${data.name.first}" "${data.name.last}", style: TextStyle(fontSize: 16, color: Colors.red),),
                            Text(data.email, style: TextStyle(fontSize: 14,)),
                            Text(data.location.city,style: TextStyle(fontSize: 14),),
                            Text(data.cell,style: TextStyle(fontSize: 14),)
                          ],
                        )

                      );
                    },
                  ))
                ],
              );
            }
            return CircularProgressIndicator();
          },
        ),
// This trailing comma makes auto-foratting nicer for build methods.
      ),
    );
  }
}
