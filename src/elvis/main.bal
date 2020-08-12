import ballerina/io;

public function main() {
    string? x = ();

    string output = x is string ? "value is string: " + x : "value is nil";
    io:println("The output from the type-guard: " + output);

    string elvisOutput = x ?: "value is nil";
    io:println("The output from the elvis operator: " + elvisOutput);
}

