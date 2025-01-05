
import 'package:flutter/widgets.dart';

abstract class HydratedWidget extends StatefulWidget {
  final String id;
  
  const HydratedWidget({
    required this.id,
    Key? key,
  }) : super(key: key);
}

abstract class HydratedState<T extends HydratedWidget> extends State<T> {
  Map<String, dynamic> get hydratedData;
  
  void onHydrated() {
    // Called when widget is hydrated
  }
  
  @override
  void initState() {
    super.initState();
    onHydrated();
  }
}