import  'package:dio/dio.dart';
import 'package:trko_task2/app/data/models/categorys.dart';
import 'package:trko_task2/app/data/models/projects.dart';

import 'models/users.dart';

class TrkoApiProvider{

  var client = Dio();
  var response;
  Map result;

  
  
  Future register(User user) async{
    

    Map registrationDetails = {
      "email": user.email,
      "password": user.password,
    };


    try {
      response = await client.post('https://api.uatdrive.com:1001/api/v1/users', data: registrationDetails,);

      print('success: ${response.data}');
      return response.data;

    }
    catch(e){
       Map error = {'error': 'User already exist.'};
      return error;
    }

  }





  Future login(User user) async{

    Map loginDetails = {
      "email": user.email,
      "password": user.password,
    };


    try {
      response = await client.post(
          'https://api.uatdrive.com:1001/api/v1/users/login',
          data: loginDetails,);

        return response.data;
      
    }
    catch (e){
      Map error = {'error':'Unable to login, Please check login credentials'};
      return error;
    }

  }




  Future getProjects(String token) async{

    Map<String, String> token_details = {'Authorization': 'Bearer $token'};
    // client.options.headers['Authorization'] = 'Bearer $token';

    try {
      response = await client.get('https://api.uatdrive.com:1001/api/v1/projects', options: Options(headers: token_details) );

        print('succes: ${response.data}');

        List<Map> temp = [];

        for(Map pmap in response.data['data']) {
          temp.add(pmap);
        }

        List<UserProjects> data = [];
        for(int i=0; i < temp.length; i++){
          print('title: ${temp[i]['title']}');
          data.add(UserProjects(status_code: response.statusCode, title: temp[i]['title'], id: temp[i]['_id'], description: temp[i]['description'], category_id: temp[i]['category_id']));
        }

        print('${data.map((e) => e.title)}');
        return data;

    }
    catch (e){
      return null;
    }


  }


   deleteProject(String id, String token)async{

    Map<String, String> token_details = {'Authorization': 'Bearer $token'};

    String project_url = 'https://api.uatdrive.com:1001/api/v1/projects/' + '$id';
    

    try {
      response = await client.delete(project_url, options: Options(headers: token_details) );
      print('response: $response');
      return response.data['message'];
  
    }
    catch(e){
      return null;
    }

  }


  addProject({String title, String category, String description, String token})async{

    Map<String, String> token_details = {'Authorization': 'Bearer $token'};

    Map project_details = {
      "title": title,
      "description": description,
      "category_id": category,
    };

    try{
      response = await client.post('https://api.uatdrive.com:1001/api/v1/projects', data: project_details, options: Options(headers: token_details, contentType: 'application/json'));
      print('${response.data}');

      return response.data['message'];
  
    }
    catch(e){
      print('$e');
      return null;
    }

  }


  editProject({String id, String category, String title, String description, String token})async{

    print('$id, $category, $title, $description, $token');

    Map<String, String> token_details = {'Authorization': 'Bearer $token'};
    
    String project_url = 'https://api.uatdrive.com:1001/api/v1/projects/' + '$id';

    Map project_details = {
      "title": title,
      "description": description,
      "category_id": category,
    };

    try{
      response = await client.patch(project_url, data: project_details, options: Options(headers: token_details));
      print('${response.data}');
      return response.data['message'];
  
    }
    catch(e){
      return null;
    }
  }




    getCategories(String token)async{

      Map<String, String> token_details = {'Authorization': 'Bearer $token'};

      try{
        response = await client.get('https://api.uatdrive.com:1001/api/v1/categories/', options: Options(headers: token_details));

        print('response data: ${response.data}');

        List<Map> temp = [];

        for(Map cat in response.data['data']){
          temp.add(cat);
        }
        print(' this is temp: $temp');


        List<Categories> data = [];
        for(int i = 0; i < temp.length; i++){
          print('Categories formMap: ${Categories.fromMap(temp[i])}');

          data.add(Categories.fromMap(temp[i]));
        }

        print('data: $data');
        return data;
    
      }
      catch(e){
        print('i was here');
        return null;
    }

  }



}
