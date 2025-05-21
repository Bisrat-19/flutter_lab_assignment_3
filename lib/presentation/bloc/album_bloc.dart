import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lab_assignment_3/domian/repositories/album_repository.dart';
import 'album_event.dart';
import 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  final AlbumRepository albumRepository;

  AlbumBloc(this.albumRepository) : super(AlbumInitial()) {
    on<FetchAlbums>((event, emit) async {
      emit(AlbumLoading());
      try {
        final albums = await albumRepository.getAlbums();
        emit(AlbumLoaded(albums));
      } catch (e) {
        emit(AlbumError(e.toString()));
      }
    });

    on<FetchPhotos>((event, emit) async {
      emit(AlbumLoading());
      try {
        final photos = await albumRepository.getPhotos(event.albumId);
        emit(PhotosLoaded(photos));
      } catch (e) {
        emit(AlbumError(e.toString()));
      }
    });
  }
}