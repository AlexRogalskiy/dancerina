import ballerina/io;

function add(int a, int b) returns int => a + b;

public function main() {
    int sum = add(10, 20);
    io:println(sum);

    var toEmployee = function (Person p, string pos) returns Employee => {
        name: p.fname + " " + p.lname,
        designation: pos
    };

    Person john = {fname: "John", lname: "Doe", age: 25};
    Employee johnEmp = toEmployee(john, "Software Engineer");

    io:println(johnEmp);
}

type Person record {|
    string fname;
    string lname;
    int age;
|};

type Employee record {|
    string name;
    string designation;
|};

