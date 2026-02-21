// Interface 
abstract class StudentEvent {
  double calcGPA();
  void printInfo();
}

// 2. Class FullName
class FullName {
  String firstName;
  String middleName;
  String surname;

  FullName(this.firstName, this.middleName, this.surname);

  @override
  String toString() => "$firstName $middleName $surname";
}

// Superclass Student
abstract class Student {
  String regNumber;
  FullName fullName;
  List<double> marks;

  Student(this.regNumber, this.fullName, this.marks);
}

//Undergraduate Student Class
class Undergraduate extends Student implements StudentEvent {
  Undergraduate(String reg, FullName name, List<double> marks) : super(reg, name, marks);

  @override
  double calcGPA() {
    double totalPoints = 0;
    for (var mark in marks) {
      if (mark >= 95) totalPoints += 12;
      else if (mark >= 90) totalPoints += 11.5;
      else if (mark >= 85) totalPoints += 11;
      else if (mark >= 80) totalPoints += 10;
      else if (mark >= 75) totalPoints += 9;
      else if (mark >= 70) totalPoints += 8;
      else if (mark >= 65) totalPoints += 7;
      else if (mark >= 60) totalPoints += 6;
      else if (mark >= 56) totalPoints += 5;
      else if (mark >= 53) totalPoints += 4;
      else if (mark >= 50) totalPoints += 3;
      else totalPoints += 0;
    }
    return totalPoints / (marks.length * 3);
  }

  @override
  void printInfo() {
    print("--- Undergraduate Student ---");
    print("ID: $regNumber");
    print("Name: $fullName");
    print("Marks: $marks");
    print("GPA: ${calcGPA().toStringAsFixed(2)}");
    print("----------------------------");
  }
}

// Postgraduate Student Class
class Postgraduate extends Student implements StudentEvent {
  Postgraduate(String reg, FullName name, List<double> marks) : super(reg, name, marks);

  @override
  double calcGPA() {
    double totalPoints = 0;
    for (var mark in marks) {
      if (mark >= 90) totalPoints += 12;
      else if (mark >= 85) totalPoints += (32 / 3);
      else if (mark >= 80) totalPoints += (31 / 3);
      else if (mark >= 75) totalPoints += 10;
      else if (mark >= 70) totalPoints += (22 / 3);
      else if (mark >= 65) totalPoints += 7;
      else if (mark >= 60) totalPoints += 6;
      else if (mark < 50) totalPoints += 0;
    }
    return totalPoints / (marks.length * 3);
  }

  @override
  void printInfo() {
    print("--- Postgraduate Student ---");
    print("ID: $regNumber");
    print("Name: $fullName");
    print("Marks: $marks");
    print("GPA: ${calcGPA().toStringAsFixed(2)}");
    print("----------------------------");
  }
}


void main() {
  
  var name1 = FullName("yasmine", "amgad", "soliman");
  var undergrad = Undergraduate("UG101", name1, [99, 99, 99, 99]); //kda w kda

  var name2 = FullName("Sara", "Mohamed", "monier");
  var postgrad = Postgraduate("PG202", name2, [95, 82, 75, 96]);

  
  undergrad.printInfo();
  postgrad.printInfo();
}