import 'package:flutter_lab_assignment_3/domian/entities/album.dart';
import 'package:flutter_lab_assignment_3/domian/entities/photo.dart';

abstract class AlbumRepository {
  Future<List<Album>> getAlbums();
  Future<List<Photo>> getPhotos(int albumId);
}