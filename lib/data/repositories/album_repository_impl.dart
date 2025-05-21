import 'package:flutter_lab_assignment_3/domian/entities/album.dart';
import 'package:flutter_lab_assignment_3/domian/entities/photo.dart';
import 'package:flutter_lab_assignment_3/domian/repositories/album_repository.dart';
import '../datasources/remote_data_source.dart';

class AlbumRepositoryImpl implements AlbumRepository {
  final RemoteDataSource remoteDataSource;

  AlbumRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Album>> getAlbums() async {
    final albumModels = await remoteDataSource.fetchAlbums();
    return albumModels.map((model) => Album(id: model.id, title: model.title)).toList();
  }

  @override
  Future<List<Photo>> getPhotos(int albumId) async {
    final photoModels = await remoteDataSource.fetchPhotos(albumId);
    return photoModels.map((model) => Photo(
      albumId: model.albumId,
      id: model.id,
      title: model.title,
      url: model.url,
      thumbnailUrl: model.thumbnailUrl,
    )).toList();
  }
}