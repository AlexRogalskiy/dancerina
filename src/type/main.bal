import ballerina/io;

public function main() {
    any a = "Hello, world!";

    boolean b = a is string;
    io:println("Is 'a' a string? ", b);

    if (a is int) {
        io:println("'a' is an int with value: ", a);
    } else if (a is string) {
        io:println("'a' is a string with value: ", a);
    } else {
        io:println("'a' is not an int or string, with value: ", a);
    }

    Student alex = {name: "Alex"};
    Student|Person|Vehicle x = alex;

    if (x is Student) {
        io:println("Alex is a student");
    } else {
        io:println("Alex is not a student");
    }

    if (x is Person) {
        io:println("Alex is a person");
    } else {
        io:println("Alex is not a person");
    }

    if (x is Vehicle) {
        io:println("Alex is a vehicle");
    } else {
        io:println("Alex is not a vehicle");
    }

    boolean isStudent = foo("student") is Student;
    io:println("Does foo return a student? ", isStudent);
    isStudent = foo("vehicle") is Student;
    io:println("Does foo return a student? ", isStudent);
}

type Person record {
    string name;
};

type Student record {
    string name;
    int age = 0;
};

type Vehicle record {
    string brand;
};

function foo(string t) returns any {
    if (t == "student") {
        return <Student>{name: "Alex"};
    } else if (t == "vehicle") {
        return <Vehicle>{brand: "Honda"};
    }
    return "invalid type";
}
