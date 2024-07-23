import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpordous/main.dart';
import 'package:riverpordous/user.dart';


// Consumer Widget
class MyHomePage extends ConsumerWidget {
  void onSubmit(WidgetRef ref, String value) {
    //ref.read(nameProvider.notifier).update((state) => value) ;
    ref.read(userProvider.notifier).updateName(value);
  }

  void onSubmitAge(WidgetRef ref, String value) {
    //ref.read(nameProvider.notifier).update((state) => value) ;
    ref.read(userProvider.notifier).updateAge(int.parse(value));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final name = ref.watch(nameProvider) ?? ' '; // 1st method
    final user = ref.watch(userProvider);
    //final userSelect = ref.watch(userProvider.select((value) => value.name));
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: Column(children: [
        TextField(
          onSubmitted: (value) => onSubmit(ref, value),
        ),

        TextField(
          onSubmitted: (value) => onSubmitAge(ref, value),
        ),
        Center(
          child: Text(user.age.toString()),
        ),
      ]),
    );
  }
}



/*class  MyWidget extends ConsumerStatefulWidget {
  @override
  ConsumerState<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends ConsumerState<MyWidget> {
  @override
  void initState() {
    super.initState();
    //ref.read is typically used for accessing a provider’s current state without listening to it.
    final nameRead = ref.read(nameProvider);
    print(nameRead);
  }

  @override
  Widget build(BuildContext context) {
    final name = ref.watch(nameProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Column(
        children: [
          Center(
            child: Text(name),
          )
        ],
      ),
    );
  }
}*/

