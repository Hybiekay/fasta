import 'package:get/get.dart';
import 'ChatModel/message.dart';
import 'package:get_storage/get_storage.dart';

class ChatController extends GetxController {
  final _box = GetStorage();

  // Define an observable list of messages
  RxList<Message> chatMessages = RxList<Message>([]);

  // Method to add a message to the list
  void addMessage(Message message) {
    chatMessages.add(message);
    // Save the updated list to GetStorage
    _box.write('messages', chatMessages.toList());
  }

  // Method to fetch messages from GetStorage
  void fetchMessages() {
    final savedMessages = _box.read<List>('messages');
    if (savedMessages != null) {
      chatMessages.addAll(savedMessages.map((json) => Message.fromJson(json)));
    }
  }
}
