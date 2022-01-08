String errorStack(stack, error, route, attempt) {
  return '''Attempted to $attempt::::
  Error from $route
      :::::::::::::
  Err::::: ${error.toString()}
      :::::::::::::::::
  thrown form $stack
  ''';
}
