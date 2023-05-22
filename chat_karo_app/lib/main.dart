import 'package:flutter/material.dart';

void main() {
  runApp(ChatKaroApp());
}

class ChatKaroApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Karo App',
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 240, 98, 190), // Light purple shade
        accentColor: Color.fromARGB(255, 63, 124, 181),
        fontFamily: 'Roboto',
      ),
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _messageController = TextEditingController();
  List<String> _messages = [];
  List<String> _studyGroupMembers = ['Komal', 'Adarsh', 'Kishan'];
  bool _hasReminder = false;
  DateTime? _reminderDate;
  bool _isOffline = false;

  void _sendMessage() {
    if (_messageController.text.trim().isNotEmpty) {
      setState(() {
        _messages.add(_messageController.text.trim());
        _messageController.clear();
      });
    }
  }

  void _createReminder(DateTime date) {
    setState(() {
      _hasReminder = true;
      _reminderDate = date;
    });
  }

  void _deleteReminder() {
    setState(() {
      _hasReminder = false;
      _reminderDate = null;
    });
  }

  void _toggleOfflineChat(bool value) {
    setState(() {
      _isOffline = value;
    });
  }

  Widget _buildStudyGroupMembers() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Study Group Members:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: _studyGroupMembers.map((member) {
              return Chip(
                label: Text(member),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: _messages.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              _messages[index],
              style: TextStyle(fontSize: 16),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.grey[200],
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: 'Type a message...',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 16,
                ),
              ),
            ),
          ),
          SizedBox(width: 8),
          FloatingActionButton(
            onPressed: _sendMessage,
            child: Icon(Icons.send),
            backgroundColor: Theme.of(context).accentColor,
          ),
        ],
      ),
    );
  }

  Widget _buildReminder() {
    return _hasReminder
        ? Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: Colors.indigo.withOpacity(0.1),
            child: Row(
              children: [
                Icon(Icons.alarm, color: Colors.indigo),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Study Reminder: ${_reminderDate.toString()}',
                    style: TextStyle(
                      color: Colors.indigo,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  color: Colors.indigo,
                  onPressed: _deleteReminder,
                ),
              ],
            ),
          )
        : SizedBox();
  }

  Widget _buildOfflineChat() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: _isOffline ? Colors.red.withOpacity(0.1) : Colors.transparent,
      child: Row(
        children: [
          Icon(
            _isOffline ? Icons.signal_wifi_off : Icons.wifi,
            color: _isOffline ? Colors.red : Colors.green,
          ),
          SizedBox(width: 8),
          Text(
            _isOffline ? 'You are offline' : 'You are online',
            style: TextStyle(
              color: _isOffline ? Color.fromARGB(255, 225, 18, 3) : Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chat Karo',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor, // Light pink shade
        elevation: 0,
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text('Study Reminder'),
                value: 'reminder',
              ),
              PopupMenuItem(
                child: Text('Offline Chat'),
                value: 'offline',
              ),
            ],
            onSelected: (value) {
              if (value == 'reminder') {
                // Show study reminder date picker
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(DateTime.now().year + 1),
                ).then((selectedDate) {
                  if (selectedDate != null) {
                    _createReminder(selectedDate);
                  }
                });
              } else if (value == 'offline') {
                // Toggle offline chat
                _toggleOfflineChat(!_isOffline);
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          _buildStudyGroupMembers(),
          _buildReminder(),
          _buildOfflineChat(),
          _buildMessageList(),
        ],
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }
}
