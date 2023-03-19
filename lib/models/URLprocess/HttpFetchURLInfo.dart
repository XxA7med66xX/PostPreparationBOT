import 'dart:io';
import 'package:html/parser.dart' as html;
import 'package:http/http.dart' as http;
import 'package:rog_telegram_bot/commands/Create_and_prepare.dart';
import 'package:teledart/teledart.dart';

class HttpFetchURL {
  HttpFetchURL({this.URL="", required this.teledart,this.TEST});

  //Assigned variables
  String URL;
  TeleDart teledart;
  String? TEST;
  
  URLfetch_InfoParse() async {
    //Here function parsing the URL to be able to extract element's from it
    var response = await http.get(Uri.parse(URL));
    var Document = html.parse(response.body);

    //Here this variable save the extracted title as a text 
    var title = Document.head!.querySelector('title')!.text;
    
    //Method to bring the name of project author
    String keyword1 = '-';
    String endword1 = '/';
    int keyword_index1 = title.indexOf(keyword1);
    int endword_index1 = title.indexOf(endword1);
    
    //Method to bring the name of project
    String keyword2 = '/';
    String endword2 = ':';
    final int keyword_index2 = title.indexOf(keyword2) + 1;
    final int endword_index2 = title.indexOf(endword2);

    //Method to extract the description of project
    String keyword3 = ':';
    String endword3 = '.';
    int keyword_index3 = title.indexOf(keyword3);
    int endword_index3 = title.length;
    
    //The result of the method's above
    String author_name = title.substring(keyword_index1 + 2, endword_index1);
    String project_Title = title.substring(keyword_index2, endword_index2);
    String project_description = title.substring(keyword_index3 + 1,endword_index3);

    Map<String, dynamic> StringX = {
      'Ptitle': project_Title,
      'Aname': author_name,
      'Pdescription' : project_description
    };

    print(project_description); //just for testing the outputs
    return StringX; 
  }
}
