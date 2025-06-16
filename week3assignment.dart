class HealthRecord {
  double temperature;
  bool isHealthy;

  HealthRecord(this.temperature, this.isHealthy);
}

abstract class Animal {
  String name;
  int age;
  HealthRecord healthRecord;

  Animal(this.name, this.age, this.healthRecord);

  void makeSound();
  void feed();
}

class Lion extends Animal {
  Lion(String name, int age, HealthRecord healthRecord)
      : super(name, age, healthRecord);

  @override
  void makeSound() {
    print("$name roars!");
  }

  @override
  void feed() {
    print("$name eats meat.");
  }
}

class Elephant extends Animal {
  Elephant(String name, int age, HealthRecord healthRecord)
      : super(name, age, healthRecord);

  @override
  void makeSound() {
    print("$name trumpets!");
  }

  @override
  void feed() {
    print("$name eats grass and fruits.");
  }
}

void main() {
  // Create HealthRecords (Encapsulation)
  HealthRecord lionHealth = HealthRecord(38.5, true);
  HealthRecord elephantHealth = HealthRecord(36.0, true);

  // Create animals (Inheritance + Abstraction)
  Animal lion = Lion("Leo", 5, lionHealth);
  Animal elephant = Elephant("Ella", 10, elephantHealth);

  // Use Polymorphism to call overridden methods
  List<Animal> zoo = [lion, elephant];

  for (var animal in zoo) {
    print("----- ${animal.name}'s Daily Routine -----");
    animal.makeSound();
    animal.feed();
  }

  // Access encapsulated health data
  print("\n🔒 Health Check:");
  print("${lion.name}'s temperature: ${lionHealth.temperature}");
  print("${elephant.name}'s health status: ${elephantHealth.isHealthy ? "Healthy" : "Unwell"}");
}
