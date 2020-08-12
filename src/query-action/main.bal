import ballerina/io;

type Student record {
    string firstName;
    string lastName;
    float score;
};

type FullName record {|
    string firstName;
    string lastName;
|};

public function main() {
    Student s1 = {firstName: "Alex", lastName: "George", score: 1.5};
    Student s2 = {firstName: "Ranjan", lastName: "Fonseka", score: 0.9};
    Student s3 = {firstName: "John", lastName: "David", score: 1.2};

    Student[] studentList = [s1, s2, s3];

    FullName[] nameList = [];

    var e = from var student in studentList

        do {
            FullName fullName = {firstName: student.firstName, lastName: student.lastName};
            nameList.push(fullName);
        };

    foreach var name in nameList {
        io:println(name);
    }
}
