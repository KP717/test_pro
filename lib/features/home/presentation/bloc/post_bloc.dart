import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_pro/core/usecases/usercases.dart';
import 'package:test_pro/dependency_injection/injection_container.dart';
import 'package:test_pro/features/home/domain/usercases/create_post_usecase.dart';
import 'package:test_pro/features/home/domain/usercases/get_post_usecase.dart';
import 'package:test_pro/features/home/presentation/bloc/post_event.dart';
import 'package:test_pro/features/home/presentation/bloc/post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {

  PostBloc() : super(PostInitialState()){
    on<FetchPostEvent>((event, emit)async{
      emit(PostLoadingState(posts: state.posts));

      final result = await getIt<GetPostUseCase>().call(NoParams());
      
      result.fold(
        (left) => emit(PostErrorState(posts: state.posts, message: left.toString())), 
        (right) => emit(PostLoadedState(posts: right))
      );
    });

    on<CreatePostEvent>((event, emit)async {

      emit(PostLoadingState(posts: state.posts));

      final result = await getIt<CreatePostUseCase>().call(event.postEntity);
      
      result.fold(  
        (left){
          emit(PostErrorState(posts: state.posts, message: left.toString()));
        },
        (right){
          emit(PostLoadedState(posts: [right, ...state.posts]));
        }
      );
    });
  }


}

