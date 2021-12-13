import 'package:movies_v2/src/resources/endpoints.dart';

String getMediumPicturePoster(String path) => Endpoints.urlImagePoster + path;

String getMediumPictureBackdrop(String path) =>
    Endpoints.urlImageBackdrop + path;

String getMediumPicturePosterSeries(String path) => Endpoints.urlImagePosterSerie + path;

