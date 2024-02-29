import 'dart:convert';

import 'package:rest_api/utils/models/comments_model.dart';
import 'package:http/http.dart' as http;

import '../constants/api_constants.dart';
class APIService{


  Future<List<CommentsModel>> getComments() async{
    final response = await http.get(Uri.parse(url));

    List<CommentsModel> comments = <CommentsModel>[];

    List<dynamic> responseList = jsonDecode(response.body);

    for(var i in responseList){
      var commentsModelObj = CommentsModel.fromJson(i);
      comments.add(commentsModelObj);
    }

    return comments;
  }
}