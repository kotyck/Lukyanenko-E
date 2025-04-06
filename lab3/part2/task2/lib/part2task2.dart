List<int> removeEvenNumbers(List<int> list) {
  for(int i = 0; i < list.length-1; i++){
    if(list[i]%2 == 0){
      list.remove(list[i]);
    }
  }
  return list;
}
