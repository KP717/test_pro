import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_pro/core/usecases/usercases.dart';
import 'package:test_pro/dependency_injection/injection_container.dart';
import 'package:test_pro/features/posts/domain/usercases/create_post_usecase.dart';
import 'package:test_pro/features/posts/domain/usercases/get_post_usecase.dart';
import 'package:test_pro/features/posts/presentation/bloc/postBloc/post_event.dart';
import 'package:test_pro/features/posts/presentation/bloc/postBloc/post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {

  CancelToken? cancelToken;

  PostBloc() : super(PostInitialState()){

    on<FetchPostEvent>((event, emit)async{

      cancelToken = CancelToken();
      
      emit(PostLoadingState(posts: state.posts));

      await Future.delayed(const Duration(seconds: 5));

      final result = await getIt<GetPostUseCase>().call(NoParams(), cancelToken: cancelToken);
      
      result.fold(
        (left) => emit(PostErrorState(posts: state.posts, message: left.toString())), 
        (right) => emit(PostLoadedState(posts: right))
      );

    });

    on<CancleFetchPostEvent>((event, emit){
      

      if(cancelToken != null && !cancelToken!.isCancelled){
        cancelToken?.cancel("Cancelling posts request...");
        emit(RequestCancelledState(posts: state.posts, message: "Request Cancel"));
        cancelToken = null;
      }
    
    });

    on<CreatePostEvent>((event, emit)async {

      emit(PostLoadingState(posts: state.posts));

      final result = await getIt<CreatePostUseCase>().call(event.postEntity);

      result.fold(  
        (error){
          emit(PostLoadedState(error: error.toString(), posts: [...state.posts]));
        },
        (postEntity){
          emit(PostLoadedState(canPop: true,posts: [postEntity, ...state.posts]));
        }
      );
    });
  }


}

