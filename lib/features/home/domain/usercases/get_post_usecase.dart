

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_pro/core/usecases/usercases.dart';
import 'package:test_pro/dependency_injection/injection_container.dart';
import 'package:test_pro/features/home/data/repositories/post_repository_impl.dart';
import 'package:test_pro/features/home/domain/entity/post_entity.dart';
import 'package:test_pro/features/home/domain/repositories/post_repository.dart';


@lazySingleton
class GetPostUseCase implements UseCase<List<PostEntity>, NoParams>{

  final PostRepository postRepository = getIt<PostRepositoryImpl>();

  @override
  Future<Either<Exception, List<PostEntity>>> call(NoParams params) {
   return postRepository.getPosts();
  }


}