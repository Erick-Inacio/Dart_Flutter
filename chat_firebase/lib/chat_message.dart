import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({
    super.key,
    required this.data,
  });

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage(data['senderPhotoUrl']),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  data['imgUrl'] != null
                      ? Image.network(
                          data['imgUrl'],
                          width: 250,
                        )
                      : Text(
                          data['text'],
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                  Text(
                    data['senderName'],
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
