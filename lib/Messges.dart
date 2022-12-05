// ignore_for_file: unnecessary_new, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:chatbot/messageModel.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

List<MessageModel> messagebutton = [];
List<Map<String, dynamic>> messages = [];
final List<ChatMessage> _listMessage = <ChatMessage>[];
final List<ButtonMessage> _listMessagebutton = <ButtonMessage>[];

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen>
    with TickerProviderStateMixin {
  late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller = TextEditingController();

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
  late double _scale;
  late AnimationController _buttoncontroller;
  late AnimationController _messagecontroller;

  int tap = -1;
  void _tapDown(TapDownDetails details) {
    _buttoncontroller.forward();
  }

  void _tapUp(TapUpDetails details) {
    _buttoncontroller.reverse();
  }

  @override
  void initState() {
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
    _buttoncontroller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 100,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    _messagecontroller = new AnimationController(
      duration: new Duration(milliseconds: 1000),
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _buttoncontroller.value;
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
                ClipOval(
                  child: Image.asset(
                    'assets/bot.png',
                    height: 32,
                    width: 35,
                    fit: BoxFit.fill,
                  ),
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
                          return Column(
                            children: [
                              index == startMessage.length - 1
                                  ? Column(
                                      children: [
                                        ClipOval(
                                          child: Image.asset(
                                            'assets/bot.png',
                                            height: 75,
                                            width: 80,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "fletchergoods",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Instagram",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "6 followers . 5 posts",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w300,
                                              color:
                                                  Colors.grey.withOpacity(0.9)),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "You don't follow each other on Instagram",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w300,
                                              color:
                                                  Colors.grey.withOpacity(0.9)),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "New Instagram account",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w300,
                                              color:
                                                  Colors.grey.withOpacity(0.9)),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Colors.grey)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Text(
                                              'View Profile',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "1:04 PM",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w300,
                                              color:
                                                  Colors.grey.withOpacity(0.9)),
                                        ),
                                        SizedBox(
                                          height: 70,
                                        ),
                                      ],
                                    )
                                  : SizedBox(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 5),
                                    child: InkWell(
                                      onTapDown: _tapDown,
                                      onTapUp: _tapUp,
                                      borderRadius: BorderRadius.circular(30),
                                      onTap: () {
                                        sendMessage(startMessage[index]);
                                      },
                                      child: Listener(
                                        onPointerDown:
                                            (PointerDownEvent event) {
                                          tap = index;
                                          _buttoncontroller.forward();
                                        },
                                        onPointerUp: (PointerUpEvent event) {
                                          _buttoncontroller.reverse();
                                        },
                                        child: Transform.scale(
                                          scale: index == tap ? _scale : 1,
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 11),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey,
                                                    width: 0.5),
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
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      )
                    : ListView.builder(
                        reverse: true,
                        controller: _scrollController,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (BuildContext context, index) {
                          return Column(
                            children: [
                              index == messages.length - 1
                                  ? Column(
                                      children: [
                                        ClipOval(
                                          child: Image.asset(
                                            'assets/bot.png',
                                            height: 75,
                                            width: 80,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "fletchergoods",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Instagram",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "6 followers . 5 posts",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w300,
                                              color:
                                                  Colors.grey.withOpacity(0.9)),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "You don't follow each other on Instagram",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w300,
                                              color:
                                                  Colors.grey.withOpacity(0.9)),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "New Instagram account",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w300,
                                              color:
                                                  Colors.grey.withOpacity(0.9)),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Colors.grey)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Text(
                                              'View Profile',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "1:04 PM",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w300,
                                              color:
                                                  Colors.grey.withOpacity(0.9)),
                                        ),
                                        SizedBox(
                                          height: 70,
                                        ),
                                      ],
                                    )
                                  : SizedBox(),
                              Container(
                                  margin: EdgeInsets.all(10),
                                  child: messages[index]['isUserMessage']
                                      ? _listMessage[index]
                                      : botMessage(
                                          messagebutton[index].message
                                          /*  messages[index]['message']
                                                      .text
                                                      .text[0] */
                                          ,
                                          messagebutton[index].buttons,
                                          messagebutton[index].check,
                                          index,
                                          messagebutton[index].controller)),
                            ],
                          );
                        },
                        /*  separatorBuilder: (_, i) =>
                            Padding(padding: EdgeInsets.only(top: 10)), */
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
        addMessage(text, Message(text: DialogText(text: [text])), true);
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
        messagebutton[0].controller = new AnimationController(
          duration: new Duration(milliseconds: 500),
          vsync: this,
        );
        messages.insert(0, {'message': "", 'isUserMessage': false});
        ChatMessage message = new ChatMessage(
          message: response.message!.payload!['message'],
          animationController: new AnimationController(
            duration: new Duration(milliseconds: 700),
            vsync: this,
          ),
          key: null,
        );
        _listMessage.insert(0, message);
        ButtonMessage btnmss = new ButtonMessage(
            animationController: new AnimationController(
              duration: new Duration(milliseconds: 700),
              vsync: this,
            ),
            mainText: messagebutton[0].message,
            buttons: messagebutton[0].buttons,
            check: messagebutton[0].check);
        _listMessagebutton.insert(0, btnmss);
        messagebutton[0].controller!.forward();
      });
    }
  }

  void addMessage(String text, Message message, [bool isUserMessage = false]) {
    // messages.add({'message': message, 'isUserMessage': isUserMessage});

    ChatMessage message = new ChatMessage(
      message: text,
      animationController: new AnimationController(
        duration: new Duration(milliseconds: 500),
        vsync: this,
      ),
      key: null,
    );
    messages.insert(0, {'message': message, 'isUserMessage': isUserMessage});
    messagebutton.insert(
        0, MessageModel(message: "", buttons: [], check: false));
    _listMessage.insert(0, message);
    ButtonMessage btnmss = new ButtonMessage(
        animationController: new AnimationController(
          duration: new Duration(milliseconds: 700),
          vsync: this,
        ),
        mainText: '',
        buttons: [],
        check: false);
    _listMessagebutton.insert(0, btnmss);
    message.animationController.forward();
  }

  void _onSubmitMessage(String text) {
    print("message: $text");
  }

  Widget botMessage(String mainText, List<String> buttons, bool check,
      int index, AnimationController? animate) {
    print('index');
    print(index);
    return SizeTransition(
      sizeFactor: new CurvedAnimation(
          reverseCurve: Curves.easeOutSine,
          parent: animate as AnimationController,
          curve: Curves.easeOutSine),
      axisAlignment: 0.0,
      child: Container(
        child: Row(
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
                              maxWidth:
                                  MediaQuery.of(context).size.width * 2 / 3),
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
                                        print('object');
                                        print(index);
                                        print(messagebutton.length);
                                      },
                                      child: Listener(
                                        onPointerDown:
                                            (PointerDownEvent event) {
                                          tap = i;
                                          if (index == 0)
                                            _buttoncontroller.forward();
                                        },
                                        onPointerUp: (PointerUpEvent event) {
                                          if (index == 0)
                                            _buttoncontroller.reverse();
                                        },
                                        child: Transform.scale(
                                          scale: i == tap &&
                                                  index ==
                                                      messagebutton.length - 1
                                              ? _scale
                                              : 1,
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
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  const ChatMessage(
      {Key? key, required this.message, required this.animationController})
      : super(key: key);

  final String message;
  final AnimationController animationController;
  @override
  Widget build(BuildContext context) {
    return new SizeTransition(
      sizeFactor: new CurvedAnimation(
          parent: animationController, curve: Curves.easeOut),
      axisAlignment: 0.0,
      child: Container(
          child: new Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              Container(
                  padding: EdgeInsets.symmetric(vertical: 14, horizontal: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: HexColor('#7f4ee2'),
                  ),
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 2 / 3),
                  child: Text(message)),
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
      )),
    );
  }
}

class ButtonMessage extends StatelessWidget {
  ButtonMessage(
      {Key? key,
      required this.animationController,
      required this.mainText,
      required this.buttons,
      required this.check})
      : super(key: key);

  final String mainText;
  final AnimationController animationController;
  final List<String> buttons;
  final bool check;
  final _MessageScreenState messScreen = new _MessageScreenState();
  @override
  Widget build(BuildContext context) {
    return new SizeTransition(
      sizeFactor: new CurvedAnimation(
          parent: animationController, curve: Curves.easeOut),
      axisAlignment: 0.0,
      child: Container(
          child: new Row(
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
                            maxWidth:
                                MediaQuery.of(context).size.width * 2 / 3),
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
                                      messScreen.sendMessage(buttons[i]);
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
      )),
    );
  }
}
