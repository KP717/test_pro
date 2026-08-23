

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_pro/features/comments/data/datasource/comment_datasource.dart';

import 'package:test_pro/features/comments/domain/entity/comment_entity.dart';

import '../../../../dependency_injection/injection_container.dart';
import '../../domain/repositories/comment_repository.dart';

@lazySingleton
class CommentRepositoryImpl  implements CommentRepository{

  @override
  Future<Either<Exception, List<CommentEntity>>> getComments() {
    return getIt<CommentDatasourceImpl>().getComments();
  }

}