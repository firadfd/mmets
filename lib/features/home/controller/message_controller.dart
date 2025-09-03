import 'package:get/get.dart';
import 'package:dash_chat_2/dash_chat_2.dart';

class MessageController extends GetxController {
  final ChatUser me = ChatUser(id: "1", firstName: "Me");
  final ChatUser other = ChatUser(id: "2", firstName: "Bot");

  var messages = <ChatMessage>[].obs;

  @override
  void onInit() {
    super.onInit();

    messages.value = [
      ChatMessage(
        text: "Hello! How can I assist you today?",
        user: other,
        createdAt: DateTime.now().subtract(const Duration(minutes: 3)),
      ),
      ChatMessage(
        text: "Hi! I need help with Flutter.",
        user: me,
        createdAt: DateTime.now().subtract(const Duration(minutes: 2)),
      ),
      ChatMessage(
        text: "Sure, I can help! What specifically?",
        user: other,
        createdAt: DateTime.now().subtract(const Duration(minutes: 1)),
      ),
    ];
  }

  void sendMessage(ChatMessage message) {
    messages.insert(0, message);
  }
}
