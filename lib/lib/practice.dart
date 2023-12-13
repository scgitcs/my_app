import 'dart:io';
void main() {
  print("welcome to dart!");
  // stdout.write("Enter your name:");
  // var name = stdin.readLineSync();
  // print("Welcome! $name");

  // dynamic section;
  // section = 5678901234567890;
  // print(section);

  var listname = [10, 20, 30, 40];
  listname.add(50);
  print(listname);
  var myc = myclass();
  myc.printName("Nuton");
}
class myclass{
  void printName(String name){
    print(name);
  }
}
