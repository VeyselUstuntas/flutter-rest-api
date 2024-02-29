import 'package:flutter/material.dart';
import 'package:rest_api/post_screen.dart';
import 'package:rest_api/utils/models/comments_model.dart';
import 'package:rest_api/utils/services/api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    APIService apiService = APIService();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: FutureBuilder<List<CommentsModel>>(
              future: apiService.getComments(),
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  return Stack(
                    children: [
                      ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          var satir = snapshot.data![index];
                          return Text(satir.id.toString());
                        },),
                      Align(alignment: Alignment.bottomCenter,
                        child: ElevatedButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => PostScreen()));
                            },
                            child: Text("Send Data")),
                      ),
                    ],
                  );
                }
                else if(snapshot.hasError){
                  return Text(snapshot.error.toString());
                }
                return const CircularProgressIndicator();
              },),
        ),
      ),
    );
  }
}
