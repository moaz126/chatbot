import 'package:chatbot/Messges.dart';
import 'package:chatbot/messageModel.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        title: 'ChatBot',
        debugShowCheckedModeBanner: false,
        home: MessageScreen());
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller = TextEditingController();
  List<MessageModel> messagebutton = [];
  List<Map<String, dynamic>> messages = [];
  final ScrollController _scrollController = ScrollController();
  List<String> startMessage = [
    'I want to submit a photo with you!',
    'Do You offer free shipping?',
    "Let's browse products",
    'I need help with a purchase',
  ];
  List<String> firstString = [
    'Return Item',
    'Speak to a human',
  ];
  List<String> secondString = [
    'First time',
    'Frequent customer',
  ];
  @override
  void initState() {
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_scrollController.hasClients)
      _scrollController.animateTo(_scrollController.position.minScrollExtent,
          duration: const Duration(milliseconds: 1000), curve: Curves.easeOut);
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16, top: 3),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/bot.png'),
                  maxRadius: 20,
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Text(
                    "fletchergoods",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
                Image.asset(
                  'assets/videoCall.png',
                  color: Colors.white,
                  width: 25,
                ),
                SizedBox(
                  width: 15,
                ),
                Image.asset(
                  'assets/flag.png',
                  color: Colors.white,
                  width: 25,
                ),
                SizedBox(
                  width: 15,
                ),
                Image.asset(
                  'assets/info.png',
                  color: Colors.white,
                  width: 25,
                )
              ],
            ),
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Flexible(
                child: messages.isEmpty
                    ? ListView.builder(
                        reverse: true,
                        itemCount: startMessage.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 5),
                                child: InkWell(
                                  onTap: () {
                                    sendMessage(startMessage[index]);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 11),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey, width: 0.5),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8),
                                      child: Text(startMessage[index]),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      )
                    : ListView.separated(
                        reverse: true,
                        controller: _scrollController,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                              margin: EdgeInsets.all(10),
                              child: messages[index]['isUserMessage']
                                  ? Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 14,
                                                    horizontal: 14),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: HexColor('#7f4ee2'),
                                                ),
                                                constraints: BoxConstraints(
                                                    maxWidth: w * 2 / 3),
                                                child: Text(messages[index]
                                                        ['message']
                                                    .text
                                                    .text[0])),
                                            /*  messages[index]['isUserMessage']
                                                ? Row(
                                                    children: [
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Container(
                                                        height: 35,
                                                        width: 35,
                                                        child: Image.asset(
                                                          'assets/person.png',
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                : SizedBox() */
                                          ],
                                        ),
                                      ],
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(children: [
                                          /*   messages[index]['isUserMessage']
                                              ? SizedBox()
                                              : Row(
                                                  children: [
                                                    Container(
                                                      height: 30,
                                                      width: 30,
                                                      child: Image.asset(
                                                        'assets/bot.png',
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    )
                                                  ],
                                                ), */
                                          botMessage(
                                              messagebutton[index].message
                                              /*  messages[index]['message']
                                                  .text
                                                  .text[0] */
                                              ,
                                              messagebutton[index].buttons,
                                              messagebutton[index].check)
                                        ]),
                                      ],
                                    ));
                        },
                        separatorBuilder: (_, i) =>
                            Padding(padding: EdgeInsets.only(top: 10)),
                        itemCount: messages.length)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.grey.withOpacity(0.3)),
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(30)),
                      child: Icon(
                        Icons.camera_alt_rounded,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                        child: TextField(
                      onTap: () {
                        _scrollController.animateTo(
                            _scrollController.position.minScrollExtent,
                            duration: const Duration(milliseconds: 1000),
                            curve: Curves.easeOut);
                      },
                      controller: _controller,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter a Message'),
                    )),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.mic,
                          size: 30,
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Icon(
                          Icons.photo,
                          size: 30,
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        InkWell(
                          onTap: () {
                            sendMessage(_controller.text);
                            _controller.clear();
                          },
                          child: Container(
                              height: 25,
                              width: 25,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white),
                              child: Icon(
                                Icons.add,
                                color: Colors.black,
                              )),
                        ),
                      ],
                    ),
                    /*  IconButton(
                        onPressed: () {
                          sendMessage(_controller.text);
                          _controller.clear();
                        },
                        icon: Icon(Icons.send)) */
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  sendMessage(String text) async {
    if (text.isEmpty) {
      print('Message is empty');
    } else {
      setState(() {
        addMessage(Message(text: DialogText(text: [text])), true);
      });

      DetectIntentResponse response = await dialogFlowtter.detectIntent(
          queryInput: QueryInput(text: TextInput(text: text)));
      if (response.message == null) return;
      setState(() {
        print(response.message!.payload);
        messagebutton.insert(
            0,
            MessageModel.fromJson(
                response.message!.payload as Map<String, dynamic>));
        messages.insert(0, {'message': "", 'isUserMessage': false});
        _scrollController.animateTo(_scrollController.position.minScrollExtent,
            duration: const Duration(milliseconds: 1000),
            curve: Curves.easeOut);
      });
    }
  }

  addMessage(Message message, [bool isUserMessage = false]) {
    // messages.add({'message': message, 'isUserMessage': isUserMessage});
    messages.insert(0, {'message': message, 'isUserMessage': isUserMessage});
    messagebutton.insert(
        0, MessageModel(message: "", buttons: [], check: false));
  }

  Widget botMessage(String mainText, List<String> buttons, bool check) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Container(
            height: 30,
            width: 30,
            child: Image.asset(
              'assets/bot.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.4),
              borderRadius: BorderRadius.circular(17),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 5),
              child: Column(
                children: [
                  Container(
                      width: check
                          ? MediaQuery.of(context).size.width / 1.5
                          : null,
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 2 / 3),
                      child: Text(
                        mainText,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      )),
                  check
                      ? Column(
                          children: <Widget>[
                            SizedBox(
                              height: 10.0,
                            ),
                            for (int i = 0; i < buttons.length; i++)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: InkWell(
                                  onTap: () {
                                    sendMessage(buttons[i]);
                                  },
                                  child: Container(
                                    width: 250,
                                    height: 50,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.black54,
                                        borderRadius:
                                            BorderRadius.circular(17)),
                                    child: Text(
                                      buttons[i],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ),
                                ),
                              )
                          ],
                        )
                      : SizedBox()
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
