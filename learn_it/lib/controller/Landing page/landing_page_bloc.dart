import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'landing_page_event.dart';
part 'landing_page_state.dart';

class LandingPageBloc extends Bloc<LandingPageEvent, LandingPageState> {
  LandingPageBloc() : super(LandingPageInitial()) {
 
  }
}
