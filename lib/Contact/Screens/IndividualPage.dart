import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_booking_app/Contact/CustomUI/OwnMessageCard.dart';
import 'package:medical_booking_app/Contact/CustomUI/ReplyCard.dart';
import 'package:medical_booking_app/Contact/Model/ChatModel.dart';

class IndividualPage extends StatefulWidget {
  const IndividualPage({super.key, required this.chatModel});
  final ChatModel chatModel;

  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  bool show = false;
  FocusNode focusNode = FocusNode();
  TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus)
        {
          setState(() {
            show = false;
          });
        }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
            "assets/images/background1.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: AppBar(
              leadingWidth: 70,
              titleSpacing: 0,
              backgroundColor: Colors.blue[600],
              leading: InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_back,
                      size: 24,),
                    CircleAvatar(
                      child: SvgPicture.asset(
                        widget.chatModel.isGroup! ? "assets/images/group.svg": "assets/images/person.svg",
                        height: 35,
                        width: 35,
                        color: Colors.white,
                      ),
                      radius: 20,
                      backgroundColor: Colors.blueGrey[300],
                    )
                  ],
                ),
              ),
              title: InkWell(
                onTap: (){},
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${widget.chatModel.name}",
                        style: TextStyle(
                          fontSize: 18.5,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                      Text(
                          "Last seen today at 12:05",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.videocam, color: Colors.white,)
                ),
                IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.call, color: Colors.white)
                ),
                PopupMenuButton<String>(
                    onSelected: (value){
                      print(value);
                    },
                    iconColor: Colors.white,
                    itemBuilder: (BuildContext context){
                      return [
                        PopupMenuItem(
                            child: Text("View contact iii"),
                            value: "View contact"),
                        PopupMenuItem(
                            child: Text("Media, links and docs"),
                            value: "Media, links and docs"),
                        PopupMenuItem(
                            child: Text("Search"),
                            value: "Search"),
                        PopupMenuItem(
                            child: Text("Mute Notification"),
                            value: "Mute Notification"),
                        PopupMenuItem(
                            child: Text("Wallpaper"),
                            value: "Wallpaper"),
                      ];
                    }
                    ),
              ],
            ),
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: WillPopScope(
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height - 170,
                    child:
                    ListView(
                      shrinkWrap: true,
                      children: [
                        OwnMessageCard(),
                        ReplyCard(),
                        OwnMessageCard(),
                        ReplyCard(),
                        OwnMessageCard(),
                        ReplyCard(),
                        OwnMessageCard(),
                        ReplyCard(),
                        OwnMessageCard(),
                        ReplyCard(),
                        OwnMessageCard(),
                        ReplyCard(),
                        OwnMessageCard(),
                        ReplyCard(),
                        OwnMessageCard(),
                        ReplyCard(),
                        OwnMessageCard(),
                        ReplyCard(),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width - 60,
                              child: Card(
                                margin: EdgeInsets.only(left: 2, right: 2, bottom: 8),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                                  child: TextFormField(
                                    controller: _controller,
                                    focusNode: focusNode,
                                    textAlignVertical: TextAlignVertical.center,
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 5,
                                    minLines: 1,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Type a message",
                                      prefixIcon: IconButton(
                                        icon: Icon(
                                            Icons.emoji_emotions),
                                        color: Colors.blue,
                                      onPressed: (){
                                          setState(() {
                                            focusNode.unfocus();
                                            focusNode.canRequestFocus = false;
                                            show = !show;
                                          });
                                      },
                                      ),
                                      suffixIcon: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                              onPressed: (){
                                                showModalBottomSheet(
                                                    backgroundColor: Colors.transparent,
                                                    context: context,
                                                    builder: (builder)=> bottomSheet());
                                              },
                                              icon: Icon(Icons.attach_file),
                                              color: Colors.blue,
                                          ),IconButton(
                                              onPressed: (){

                                              },
                                              icon: Icon(Icons.camera_alt),
                                              color: Colors.blue,
                                          )
                                        ],
                                      ),
                                      contentPadding: EdgeInsets.all(5),
                                    ),
                                  )
                              ),
                            ),
                            SizedBox(width: 5,),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8, right: 2),
                              child: CircleAvatar(
                                backgroundColor: Colors.blue,
                                radius: 24,
                                child: IconButton(
                                  icon: Icon(Icons.send),
                                  onPressed: (){},
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        show ? emojiSelect() : Container(),
                      ],
                    ),
                  ),
                ],
              ),
              onWillPop: (){
                if(show) {
                  setState(() {
                    show = false;
                  });
                }
                else {
                  Navigator.pop(context);
                }
                return Future.value(false);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 280,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: EdgeInsets.all(18),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(Icons.insert_drive_file, Colors.indigo, "Document"),
                  SizedBox(width: 50,),
                  iconCreation(Icons.camera_alt, Colors.pink, "Camera"),
                  SizedBox(width: 50,),
                  iconCreation(Icons.insert_photo, Colors.purple, "Gallery"),
                ],
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(Icons.headphones, Colors.orange, "Audio"),
                  SizedBox(width: 50,),
                  iconCreation(Icons.location_pin, Colors.teal, "Location"),
                  SizedBox(width: 50,),
                  iconCreation(Icons.person, Colors.blue, "Contact"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconCreation(IconData icon, Color color, String text) {
    return InkWell(
      onTap: () {

      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: Icon(
              icon,
              size: 29,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 5,),
          Text(text,
          style: TextStyle(
            fontSize: 12
          ),),
        ],
      ),
    );
  }

  Widget emojiSelect() {
    return EmojiPicker(
      config: Config(
        emojiViewConfig: EmojiViewConfig(
          columns: 7,
          recentsLimit: 28,
        ),
      ),
      onEmojiSelected: (Category? category, Emoji emoji){
        print(emoji.emoji);
        setState(() {
          _controller.text = _controller.text + emoji.emoji;
        });
      }
    );
  }
}
