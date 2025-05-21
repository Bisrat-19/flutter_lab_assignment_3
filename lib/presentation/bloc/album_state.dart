import 'package:equatable/equatable.dart';
import 'package:flutter_lab_assignment_3/domian/entities/album.dart';
import 'package:flutter_lab_assignment_3/domian/entities/photo.dart';

abstract class AlbumState extends Equatable {
  @override
  List<Object> get props => [];
}

class AlbumInitial extends AlbumState {}
class AlbumLoading extends AlbumState {}
class AlbumLoaded extends AlbumState {
  final List<Album> albums;
  AlbumLoaded(this.albums);
  @override
  List<Object> get props => [albums];
}
class AlbumError extends AlbumState {
  final String message;
  AlbumError(this.message);
  @override
  List<Object> get props => [message];
}
class PhotosLoaded extends AlbumState {
  final List<Photo> photos;
  PhotosLoaded(this.photos);
  @override
  List<Object> get props => [photos];
}