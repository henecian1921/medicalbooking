import 'package:medical_booking_app/Contact/CustomUI/CustomCard.dart';
import 'package:medical_booking_app/Contact/Model/ChatModel.dart';
import 'package:medical_booking_app/Contact/Screens/SelectContact.dart';
import 'package:flutter/material.dart';


class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  List<ChatModel> chats = [
    ChatModel(
      name: "An 1",
      isGroup: false,
      currentMessage: "Hello world",
      time: "10:00",
      icon: "person.svg"
    ),
    ChatModel(
        name: "An 2",
        isGroup: true,
        currentMessage: "Hello everyone",
        time: "09:40",
        icon: "group.svg"
    ),
    ChatModel(
        name: "An 3",
        isGroup: false,
        currentMessage: "Hello",
        time: "09:00",
        icon: "person.svg"
    ),
    ChatModel(
        name: "An 4",
        isGroup: true,
        currentMessage: "Bye bye",
        time: "08:40",
        icon: "group.svg"
    ),
    ChatModel(
        name: "An 5",
        isGroup: false,
        currentMessage: "Hello my name's An",
        time: "06:30",
        icon: "person.svg"
    ),
    ChatModel(
        name: "An 6",
        isGroup: true,
        currentMessage: "You're welcome",
        time: "04:40",
        icon: "group.svg"
    ),
    ChatModel(
        name: "An 7",
        isGroup: false,
        currentMessage: "Test demo",
        time: "03:00",
        icon: "person.svg"
    ),
    ChatModel(
        name: "An 8",
        isGroup: true,
        currentMessage: "Are you okay?",
        time: "02:40",
        icon: "group.svg"
    ),
    ChatModel(
        name: "An 9",
        isGroup: true,
        currentMessage: "How are you today?",
        time: "01:50",
        icon: "group.svg"
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (builder)=> SelectContact()));
        },
        backgroundColor: Colors.blue[500],
        child: Icon(
          Icons.chat,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context,index)=> CustomCard(chatModel:chats[index]),
      ),
    );
  }
}
