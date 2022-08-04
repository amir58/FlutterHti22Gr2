import 'package:flutter/material.dart';

class StatelessScreen extends StatelessWidget {
  const StatelessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


class StatefulScreen extends StatefulWidget {
  const StatefulScreen({Key? key}) : super(key: key);

  @override
  State<StatefulScreen> createState() => _StatefulScreenState();
}

class _StatefulScreenState extends State<StatefulScreen> {
  _StatefulScreenState();

  @override
  void initState(){
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    return Container();
  }

}
