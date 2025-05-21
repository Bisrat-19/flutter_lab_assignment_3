import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'data/datasources/remote_data_source.dart';
import 'data/repositories/album_repository_impl.dart';
import 'presentation/bloc/album_bloc.dart';
import 'presentation/pages/album_detail_page.dart';
import 'presentation/pages/albums_page.dart';

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const AlbumsPage(),
    ),
    GoRoute(
      path: '/album/:albumId',
      builder: (context, state) {
        final albumId = int.parse(state.pathParameters['albumId']!);
        return AlbumDetailPage(albumId: albumId);
      },
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    appBar: AppBar(title: const Text('Error')),
    body: Center(child: Text('Navigation Error: ${state.error}')),
  ),
);

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AlbumBloc(
        AlbumRepositoryImpl(RemoteDataSource()),
      ),
      child: MaterialApp.router(
        routerConfig: _router,
        title: 'Album App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          cardTheme: CardTheme(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          textTheme: const TextTheme(
            bodyMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ),
        debugShowCheckedModeBanner: false, // Add this line to remove the DEBUG banner
      ),
    );
  }
}