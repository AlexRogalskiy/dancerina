import ballerina/http;
import ballerina/io;
import ballerina/runtime;

int count = 0;

http:Client clientEndpoint = new ("http://postman-echo.com");

public function main() {
    future<int> f1 = start sum(40, 50);

    int result = squarePlusCube(f1);

    _ = wait f1;
    io:println("SQ + CB = ", result);

    future<()> f2 = start countInfinity();

    f2.cancel();
    io:println("Counting done in one second: ", count);

    future<http:Response|error> f3 = @strand {thread:"any"} start clientEndpoint-> get("/get?test=123");

    http:Response|error response = wait f3;

    if (response is http:Response) {
        io:println(response.getJsonPayload());
    } else {
        io:println(response.detail()?.message);
    }

    future<int> f4 = start square(20);
    future<string> f5 = start greet("Bert");

    int|string anyResult = wait f4|f5;
    io:println(anyResult);

    future<int> f6 = start sum(40, 60);
    future<int> f7 = start cube(3);
    future<string> f8 = start greet("Moose");

    runtime:sleep(2000);

    map<int|string> resultMap = wait {first_field: f6, second_field: f7,
                                            third_field: f8};
    io:println(resultMap);

    record {int first_field; int second_field; string third_field;} rec =
                    wait {first_field: f6, second_field: f7, third_field: f8};
    io:println("first field of record --> ", rec.first_field);
    io:println("second field of record --> ", rec.second_field);
    io:println("third field of record --> ", rec.third_field);
}

function sum(int a, int b) returns int {
    return a + b;
}

function square(int n) returns int {
    return n * n;
}

function cube(int n) returns int {
    return n * n * n;
}

function greet(string name) returns string {

    runtime:sleep(2000);
    return "Hello " + name + "!!";
}

function squarePlusCube(future<int> f) returns int {
    worker w1 {
        int n = wait f;
        int sq = square(n);
        sq -> w2;
    }
    worker w2 returns int {
        int n = wait f;
        int cb = cube(n);
        int sq;
        sq = <- w1;
        return sq + cb;
    }

    return wait w2;
}

function countInfinity() {
    while (true) {
        runtime:sleep(1);
        count += 1;
    }
}
