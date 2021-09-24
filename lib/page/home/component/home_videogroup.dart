import 'package:flutter/cupertino.dart';

class HomeVideoGroup extends StatelessWidget {
  final String groupname;
  final int videotype;

  const HomeVideoGroup({
    Key? key,
    required this.groupname,
    required this.videotype,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(
            groupname,
            style: TextStyle(fontSize: 25),
          ),
          Flex(
            direction: Axis.horizontal,
            children: [],
          )
        ],
      ),
    );
  }
}
