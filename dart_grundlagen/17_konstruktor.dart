
void main() {
  Car car1 = Car(color: "red", ps: 300);
}

class Car {
  Car({required this.color, required this.ps}){
    drive();
  }

  final String color; // final ist eine variable die nach der ersten zuweisung nicht mehr geändert werden kann
  final int ps;

  void drive() {
    print("car is moving");
  }
}