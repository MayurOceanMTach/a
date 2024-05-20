import 'package:a/core/api_client.dart';
import 'package:a/cubit/product_cubit.dart';
import 'package:a/datasource/data_source.dart';
import 'package:a/repositories/data_repositories.dart';
import 'package:a/usecase/fatch_terms_condition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/retry.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;
void setUp() {
  locator.registerLazySingleton<FatchProductData>(() => FatchProductData(dataRepositories: locator()));
  locator.registerLazySingleton<DataRepositories>(() => DataRepositoriesImpl(dataSource: locator()));
  locator.registerLazySingleton<DataSource>(() => DataSourceImpl(client: locator()));
  locator.registerFactory<ProductCubit>(() => ProductCubit());
  locator.registerFactory(() => ApiClient(RetryClient(http.Client())));
}

void main() {
  setUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider<ProductCubit>(
        create: (context) => ProductCubit(),
        child: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final ProductCubit productCubit;
  @override
  void initState() {
    super.initState();
    productCubit = locator<ProductCubit>();
    productCubit.fatchTermCondition();
  }

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
