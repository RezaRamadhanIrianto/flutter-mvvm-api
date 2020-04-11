import 'package:bloc/bloc.dart';
import 'package:flutter_fundamental/model/user.dart';

class UserBloc extends Bloc<int, User>{
  @override
  
  User get initialState => UnitializedUser();

  @override
  Stream<User> mapEventToState(int event) async* {
    try{
      
      User user = await User.getUsersFromAPI(event);
      yield user;
    }catch(_){

    }
    
  }

}