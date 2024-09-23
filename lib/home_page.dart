import 'package:counter_app_using_bloc/cubit/counter_cubit.dart';
import 'package:counter_app_using_bloc/cubit/counter_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Counter App"),
        ),
        body: BlocBuilder<CounterCubit, CounterCubitState>(
          builder: (context, state) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          context.read<CounterCubit>().counterDecrease();
                        },
                        icon: const Icon(
                          Icons.remove,
                          size: 30,
                        ),
                      ),
                      (state is CounterValueUpdated)
                          ? Text(
                              state.counter.toString(),
                              style: const TextStyle(
                                  fontFamily: 'DigitalNumber',
                                  fontSize: 50,
                                  fontWeight: FontWeight.w900),
                            )
                          : const Text(
                              "0",
                              style: TextStyle(
                                  fontFamily: 'DigitalNumber',
                                  fontSize: 30,
                                  fontWeight: FontWeight.w900),
                            ),
                      IconButton(
                          onPressed: () {
                            context.read<CounterCubit>().counterIncrease();
                          },
                          icon: const Icon(
                            Icons.add,
                            size: 30,
                          ))
                    ],
                  )
                ],
              ),
            );
          },
        ));
  }
}
