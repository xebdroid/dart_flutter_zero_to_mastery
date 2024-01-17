part of 'advicer_bloc.dart';

@immutable
sealed class AdvicerEvent {}

/// event when button is pressed
class AdvicerRequestedEvent extends AdvicerEvent {}