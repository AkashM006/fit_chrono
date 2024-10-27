String somethingWentWrongMsg(String action) {
  return "Uh-oh! Something went wrong while $action. Please try again shortly, and we'll get it sorted!";
}

String doesNotExistMsg(String action) {
  return "Oops! It looks like the $action does not exist anymore. Please refresh and try again";
}

String multipleRecordsFound(String action) {
  return "Oops! Multiple records were found when trying to $action. Please try again while we get it sorted!";
}
