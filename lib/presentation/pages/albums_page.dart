import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/album_bloc.dart';
import '../bloc/album_event.dart';
import '../bloc/album_state.dart';
import '../widgets/album_item.dart';
import '../widgets/error_widget.dart';
import '../widgets/loading_widget.dart';

class AlbumsPage extends StatelessWidget {
  const AlbumsPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AlbumBloc>().add(FetchAlbums());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Albums'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueAccent, Colors.purpleAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: BlocBuilder<AlbumBloc, AlbumState>(
        builder: (context, state) {
          if (state is AlbumLoading) {
            return const LoadingWidget();
          } else if (state is AlbumLoaded) {
            return ListView.builder(
              padding: const EdgeInsets.only(top: 8, bottom: 80),
              itemCount: state.albums.length,
              itemBuilder: (context, index) {
                final album = state.albums[index];
                return AlbumItem(
                  album: album,
                  onTap: () => context.go('/album/${album.id}'), // Ensure context.go is used
                );
              },
            );
          } else if (state is AlbumError) {
            return CustomErrorWidget(
              message: state.message,
              onRetry: () => context.read<AlbumBloc>().add(FetchAlbums()),
            );
          }
          return const Center(child: Text('No data'));
        },
      ),
    );
  }
}