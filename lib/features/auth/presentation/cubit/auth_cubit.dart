import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository repository;

  AuthCubit({required this.repository}) : super(const AuthState());

  Future<void> login(String email, String password) async {
    emit(state.copyWith(isLoading: true, error: null));
    
    try {
      final user = await repository.login(email, password);
      emit(state.copyWith(
        isLoading: false,
        isAuthenticated: true,
        userEmail: user.email,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: 'Login failed: $e',
      ));
    }
  }

  Future<void> register(String email, String password, String name) async {
    emit(state.copyWith(isLoading: true, error: null));
    
    try {
      final user = await repository.register(email, password, name);
      emit(state.copyWith(
        isLoading: false,
        isAuthenticated: true,
        userEmail: user.email,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: 'Registration failed: $e',
      ));
    }
  }

  Future<void> logout() async {
    emit(state.copyWith(isLoading: true));
    
    try {
      await repository.logout();
      emit(const AuthState());
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: 'Logout failed: $e',
      ));
    }
  }

  Future<void> checkAuthStatus() async {
    emit(state.copyWith(isLoading: true));
    
    try {
      final isLoggedIn = await repository.isLoggedIn();
      if (isLoggedIn) {
        final user = await repository.getCurrentUser();
        emit(state.copyWith(
          isLoading: false,
          isAuthenticated: true,
          userEmail: user.email,
        ));
      } else {
        emit(state.copyWith(isLoading: false));
      }
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: 'Auth check failed: $e',
      ));
    }
  }

  void clearError() {
    emit(state.copyWith(error: null));
  }
}
