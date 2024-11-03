bool areListsEqual<T>(List<T> list1, List<T> list2) {
  if (list1.length != list2.length) return false;

  return list1.every((listItem) => list2.contains(listItem));
}
