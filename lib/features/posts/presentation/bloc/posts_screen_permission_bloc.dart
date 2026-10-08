



import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class PostScreenPermissionState{}
class InitPermissionsState extends PostScreenPermissionState{} 
class ValidatingPermissionsState extends PostScreenPermissionState{} 
class AskPermissionsState extends PostScreenPermissionState{
  PermissionStatus notificationStatus;

  AskPermissionsState({required this.notificationStatus});
}
class DoNotPermissionsState extends PostScreenPermissionState{}


abstract class PostScreenPermissionEvent{}
class ValidateAndAskPermissions extends PostScreenPermissionEvent{}



class PostsScreenPermissionBloc extends Bloc<PostScreenPermissionEvent, PostScreenPermissionState>{

  PostsScreenPermissionBloc():super(InitPermissionsState()){

    on<ValidateAndAskPermissions>(_validateAndAskPermissions);

  }


  void _validateAndAskPermissions(ValidateAndAskPermissions event, Emitter<PostScreenPermissionState> emit)async{
    emit(ValidatingPermissionsState());

    PermissionStatus notificationStatus = await Permission.notification.status;

    if(notificationStatus != PermissionStatus.granted){
      emit(AskPermissionsState(notificationStatus: notificationStatus));
      return;
    }

    emit(DoNotPermissionsState());

  }

}