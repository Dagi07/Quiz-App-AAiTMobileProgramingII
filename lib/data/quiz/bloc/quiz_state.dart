part of 'quiz_bloc.dart';

abstract class QuizState extends Equatable {
  const QuizState();

  @override
  List<Object> get props => [];
}

class QuizInitial extends QuizState {
  @override
  List<Object> get props => [];
}

class QuizSuccess extends QuizState {
  final List<Quiz> quizes;

  QuizSuccess({required this.quizes});

  @override
  List<Object> get props => [quizes];
}

class QuizLoading extends QuizState {}

class QuizFailure extends QuizState {}
