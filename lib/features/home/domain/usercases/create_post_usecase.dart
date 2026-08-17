

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_pro/core/usecases/usercases.dart';
import 'package:test_pro/dependency_injection/injection_container.dart';
import 'package:test_pro/features/home/data/repositories/post_repository_impl.dart';
import 'package:test_pro/features/home/domain/entity/post_entity.dart';


@lazySingleton
class CreatePostUseCase implements UseCase<PostEntity, PostEntity>{

  final PostRepositoryImpl postRepository = getIt<PostRepositoryImpl>();

  @override
  Future<Either<Exception, PostEntity>> call(PostEntity post)async{
    return postRepository.createPost(post);
  }
  
}