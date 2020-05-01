
String typeTransictions({int index}) {
  if(index == 0) {
    return "Diário";
  } else if(index == 1) {
    return "Semanal";
  } else if(index == 2) {
    return "Mensal";
  } else {
    return "Anual";
  }
}
