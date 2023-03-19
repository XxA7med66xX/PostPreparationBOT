import 'package:rog_telegram_bot/commands/Create_and_prepare.dart';
import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';
import 'package:teledart/model.dart';
import 'package:rog_telegram_bot/commands/Start_Help_commands.dart';
import 'package:meta/dart2js.dart'; 
import 'package:test/expect.dart';
import 'package:rog_telegram_bot/models/URLprocess/HttpFetchURLInfo.dart';
void main() async {
  
  //Initializing Bot Config
  var BOT_TOKEN = '6059435916:AAF_SWPEH02zCERYkS199NpHDKN3DInHmGI';
  final username = (await Telegram(BOT_TOKEN).getMe()).username;
  var teledart = TeleDart(BOT_TOKEN, Event(username!));
  teledart.start();
  
  //Greetings and Help message
  final StartHelpCommands = Start_Help_Commands(teledart: teledart, BOT_TOKEN: BOT_TOKEN);
  StartHelpCommands.Start_Help_commands();
  
  //Take the url and fetch them to extract the paragraph
  

  //Create command, to create and prepare the post
  final Create_and_prepare = create_and_prepare(teledart: teledart,);
  Create_and_prepare.CreateCommand();
  Create_and_prepare.SaveUserInput();
  



}

  




// update.listen((update) {
  //   if(update.message == "/create"){
  //     teledart.sendMessage(
  //       update.message!.chat.id,
  //       "Send github link",
  //     );
  //     String? GitLink = stdin.readLineSync();
  //     print(GitLink);
  //   }
  // });


  //GitHub - NVIDIA/open-gpu-kernel-modules: NVIDIA Linux open GPU kernel module source
