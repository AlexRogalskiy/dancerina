import ballerina/io;

# Country code for Sri Lanka.
# # Deprecated
# This constant is deprecated. Use the constant `LK` instead.
@deprecated
public const string LKA = "LKA";

# New country code for Sri Lanka.
public const string LK = "LK";

# Country code for USA.
public const string USA = "USA";

public type CountryCode LK|LKA|USA;

@deprecated
public type Address record {|
    string street;
    string city;
    CountryCode countryCode;
|};

@deprecated
public type Person object {
    public string firstName = "John";
    public string lastName = "Doe";

    Address addr = {
        street: "Palm Grove",
        city: "Colombo 3",

        countryCode: LKA
    };

    @deprecated
    public function getFullName() returns string {
        return self.firstName + " " + self.lastName;
    }

};

# Creates and returns a `Person` object given the parameters.
#
# + fname - First name of the person
# + lname - Last name of the person
# + street - Street the person is living at
# + city - The city the person is living in
# + countryCode - The country code for the country the person is living in
# + return - A new `Person` object
#
# # Deprecated
# This function is deprecated since the `Person` type is deprecated.
@deprecated
public function createPerson(string fname, string lname, string street,
    string city, CountryCode countryCode) returns Person {
    Person p = new;
    p.firstName = fname;
    p.lastName = lname;
    p.addr = {street, city, countryCode};
    return p;
}

public function main() {
    Person p = createPerson("Jane", "Doe", "Castro Street", "Mountain View", USA);
    io:println(p.getFullName());
}
