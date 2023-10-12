import 'package:client/feature/clearSight/data/Chat.dart';
import 'package:client/feature/clearSight/presentation/blocs/chat/chat_bloc.dart';
import 'package:client/feature/clearSight/presentation/widgets/Line.dart';
import 'package:client/feature/clearSight/presentation/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SeeAi extends StatefulWidget {
  SeeAi({super.key});

  @override
  State<SeeAi> createState() => _SeeAiState();
}

class _SeeAiState extends State<SeeAi> {
  ScrollController _scrollController = ScrollController();
  TextEditingController _controller = TextEditingController();

  String? reciveMessage;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Check if any messages are passed and send them
    final messages =
        ModalRoute.of(context)?.settings.arguments as List<String>?;

    if (messages != null && messages.isNotEmpty) {
      // Send the messages here
      setState(() {
        reciveMessage = messages[0];
      });
      print("my messages $messages");
    }
  }

  _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ChatBloc()..add(GetAllChats(reciveMessage)),
        child: BlocBuilder<ChatBloc, ChatState>(
          builder: (context, state) {
            return Scaffold(
                appBar: AppBar(
                  leading: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                    ),
                    onPressed: () {
                      Navigator.pop(
                        context,
                      );
                    },
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {
                        context.read<ChatBloc>().add(ClearContext());
                      },
                      icon: Icon(
                        Icons.cleaning_services,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    SizedBox(width: 10),
                    IconButton(
                      onPressed: () {
                        _showConfirmationDialog(context, state);
                      },
                      icon: Icon(
                        Icons.delete_forever_outlined,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    SizedBox(width: 10),
                  ],
                  title: Row(
                    children: [
                      Text("See AI"),
                      SizedBox(width: 4),
                      Image.asset("assets/images/icon3.png"),
                    ],
                  ),
                ),
                body: BlocListener<ChatBloc, ChatState>(
                  listener: (context, state) {
                    if (state is ChatLoaded) {
                      _scrollToBottom();
                    }
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      state is LoadingChat
                          ? Expanded(
                              child: Center(
                              child: Loading(color: false),
                            ))
                          : state is ChatLoaded || state is SendingChat
                              ? _listChats(
                                  context, state.chats, state is SendingChat)
                              : Text("somethig, $state"),
                      Container(
                        height: 80,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 13),
                        color: Color.fromARGB(255, 255, 255, 255),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: TextField(
                                controller: _controller,
                                decoration: InputDecoration(
                                  hintText: "send your questions ?",
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(255, 255, 0, 0)),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  labelStyle: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: AnimatedContainer(
                                padding: EdgeInsets.symmetric(vertical: 7),
                                decoration: BoxDecoration(
                                  color: state is ChatLoaded
                                      ? Theme.of(context).colorScheme.primary
                                      : const Color.fromARGB(
                                          255, 190, 190, 190),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                duration: Duration(seconds: 1),
                                child: MaterialButton(
                                  onPressed: () {
                                    if (state is ChatLoaded) {
                                      Chat chat = Chat(
                                          message: _controller.text,
                                          gpt: false);
                                      _controller.clear();
                                      FocusScopeNode currentFocus =
                                          FocusScope.of(context);
                                      if (!currentFocus.hasPrimaryFocus) {
                                        currentFocus.unfocus();
                                      }
                                      context
                                          .read<ChatBloc>()
                                          .add(SendChat(state.chats, chat));
                                    }
                                    _scrollToBottom();
                                  },
                                  child: Text(
                                    state is SendingChat ? "Sending" : "Send",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 19,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ));
          },
        ));
  }

  void _showConfirmationDialog(BuildContext cont, state) {
    showDialog(
      context: cont,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Delete',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Text('Are you sure you want to delete all chats?'),
          actions: [
            TextButton(
              child: Text('No'),
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
            ),
            TextButton(
              child: Text('Yes'),
              onPressed: () {
                cont.read<ChatBloc>().add(DeleteAllChat());

                // Perform the action you want after confirmation
                Navigator.pop(context); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  Widget _listChats(context, chats, bool loading) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: loading == false && chats.length == 0
            ? Center(
                child: Container(
                width: MediaQuery.of(context).size.width * .7,
                height: 100,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    // border: Border.all(
                    //     color: Theme.of(context).colorScheme.primary),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Text(
                  "Send Your First Message!",
                  style: TextStyle(fontSize: 18),
                )),
              ))
            : ListView.builder(
                controller: _scrollController,
                itemCount: chats.length + 1,
                itemBuilder: (cont, index) {
                  if (index == chats.length) {
                    return loading ? Loading(color: false) : Container();
                  }
                  return _message(
                    context,
                    chats[index],
                  );
                },
              ),
      ),
    );
  }

  Widget _message(context, Chat chat) {
    if (chat.gpt == null) {
      return Container(
        width: double.infinity,
        height: 70,
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  color: const Color.fromARGB(255, 117, 117, 117),
                  height: 4,
                )),
            SizedBox(width: 10),
            Text("Context Cleared!!"),
            SizedBox(width: 10),
            Expanded(
                flex: 2,
                child: Container(
                  color: const Color.fromARGB(255, 117, 117, 117),
                  height: 4,
                )),
          ],
        ),
      );
    }
    return Align(
      alignment: !chat.gpt! ? Alignment.topRight : Alignment.topLeft,
      child: Container(
        width: MediaQuery.of(context).size.width * .6,
        padding: EdgeInsets.symmetric(
            horizontal: 10, vertical: !chat.gpt! ? 10 : 15),
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: !chat.gpt!
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(!chat.gpt! ? 10 : 0),
            topRight: Radius.circular(!chat.gpt! ? 0 : 10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              chat.message!,
              style: TextStyle(color: !chat.gpt! ? Colors.white : Colors.black),
            ),
            if (!chat.gpt!)
              Align(
                alignment: Alignment.bottomRight,
                child: SvgPicture.asset("assets/images/coolicon.svg"),
              ),
          ],
        ),
      ),
    );
  }
}
