import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../blocs/counter_bloc.dart';

class ProviderValuePage extends StatefulWidget {
  const ProviderValuePage();

  @override
  _ProviderValueState createState() => _ProviderValueState();
}

class _ProviderValueState extends State<ProviderValuePage> {
  final _bloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Provider<CounterBloc>.value(
      value: _bloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Provider.value()'),
        ),
        body: const _CounterText(),
        floatingActionButton: FloatingActionButton(
          onPressed: _bloc.increment,
          child: const Icon(Icons.add),
        ),
      )
    );
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}

class _CounterText extends StatelessWidget {
  const _CounterText();

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<CounterBloc>(context, listen: false);

    return StreamBuilder<int>(
      stream: bloc.value,
      initialData: 0,
      builder: (_, snapshot) {
        return Center(
          child: Text(snapshot.data.toString()),
        );
      },
    );
  }
}
