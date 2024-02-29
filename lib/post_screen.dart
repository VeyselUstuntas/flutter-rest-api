import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rest_api/utils/models/comments_model.dart';
import 'package:rest_api/utils/services/api_service.dart';

class PostScreen extends StatelessWidget {
  var tfIdController = TextEditingController();
  var tfPostIdController = TextEditingController();
  var tfNameController = TextEditingController();
  var tfEmailController = TextEditingController();
  var tfBodyController = TextEditingController();
  var apiService = APIService();
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(flex: 20,child: Text("Post Id")),
                Expanded(flex: 80,child: TextFormField(controller: tfPostIdController )),
              ],
            ),

            Row(
              children: [
                Expanded(flex: 20,child: Text("Id")),
                Expanded(flex: 80,child: TextFormField(controller: tfIdController )),
              ],
            ),

            Row(
              children: [
                Expanded(flex: 20,child: Text("Name")),
                Expanded(flex: 80,child: TextFormField(controller: tfNameController )),
              ],
            ),

            Row(
              children: [
                Expanded(flex: 20,child: Text("Email")),
                Expanded(flex: 80,child: TextFormField(controller: tfEmailController )),
              ],
            ),

            Row(
              children: [
                Expanded(flex: 20, child: Text("Body")),
                Expanded( flex: 80,child: TextFormField(controller: tfBodyController )),
              ],
            ),

            ElevatedButton(
                onPressed: (){
                  sendData(context);
                },
                child: Text("Send"))
          ],
        ),
      ),
    );
  }

  void sendData(final context) async{
    CommentsModel model = CommentsModel(id: int.parse( tfIdController.text), body: tfBodyController.text, email: tfEmailController.text, name: tfNameController.text,postId: int.parse(tfPostIdController.text));

    final res = await apiService.postComments(model);

    if(res.statusCode == HttpStatus.created){
      ScaffoldMessenger.of(context ).showSnackBar(SnackBar(content: Text("Başarılı")));
      Navigator.pop(context );
    }
  }
}
