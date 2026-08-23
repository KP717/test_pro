


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_pro/core/usecases/usercases.dart';
import 'package:test_pro/features/comments/domain/usecases/get_comment_usecase.dart';

import '../../../../dependency_injection/injection_container.dart';
import '../../domain/entity/comment_entity.dart';

abstract class CommentState{
  List<CommentEntity> commentList;
  CommentState(this.commentList);
}

class CommentInitialState extends CommentState{
  CommentInitialState():super([]);
}
class CommentLoadingState extends CommentState{
  CommentLoadingState(super.commentList);
}

class CommentLoadedState extends CommentState{
  CommentLoadedState(super.commentList);
}

class CommentErrorState extends CommentState{
  String message;
  CommentErrorState(this.message, super.commentList);
}

abstract class CommentEvent{}
class FetchCommentEvent extends CommentEvent{}

class CommentBloc extends Bloc<CommentEvent, CommentState>{

  CommentBloc():super(CommentInitialState()){

    on<FetchCommentEvent>((event, emit)async{
      emit(CommentLoadingState(state.commentList));
      var response = await getIt<GetCommentUseCase>().call(NoParams());

      response.fold(
              (error){
                emit(CommentErrorState(error.toString(), state.commentList));
              },
              (commentList){
                emit(CommentLoadedState(commentList));
              });

    });

  }

}