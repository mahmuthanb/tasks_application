import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_list_app/model/task.dart';

final networkServiceProvider = Provider<NetworkService>((ref) {
  return NetworkService();
});

class NetworkService {
  NetworkService();

  Future<List<Task>> getTasks() async {
    String loremDesc =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut eu sem integer vitae justo eget magna. Et tortor at risus viverra adipiscing. Et netus et malesuada fames ac turpis egestas maecenas pharetra. Sem et tortor consequat id porta. Scelerisque felis imperdiet proin fermentum leo vel orci porta. Feugiat nibh sed pulvinar proin. Tristique et egestas quis ipsum suspendisse ultrices. Urna nec tincidunt praesent semper feugiat nibh. Amet volutpat consequat mauris nunc congue nisi vitae suscipit tellus. Tortor at auctor urna nunc id cursus. Tristique senectus et netus et malesuada. Et magnis dis parturient montes nascetur ridiculus mus mauris. Tortor id aliquet lectus proin nibh nisl.";
    final now = DateTime.now();
    return [
      Task(
        id: '1',
        title: 'Read emails from mailbox',
        dateTime: now,
        description: loremDesc,
      ),
      Task(
        id: '2',
        title: 'Check latest news on Flutter',
        dateTime: now,
        description: loremDesc,
      ),
      Task(
        id: '3',
        title: 'Have a call with Flutter team',
        dateTime: now,
        description: loremDesc,
      ),
      Task(
        id: '4',
        title: 'Work on application performance',
        dateTime: now,
        description: loremDesc,
      ),
      Task(
        id: '5',
        title: 'Plan work for next week',
        dateTime: now,
        description: loremDesc,
      ),
      Task(
        id: '6',
        title: 'Order lunch',
        dateTime: now,
        description: loremDesc,
      ),
      Task(
        id: '7',
        title: 'Create an invoice for last month',
        dateTime: now,
        description: loremDesc,
      ),
    ];
  }
}
