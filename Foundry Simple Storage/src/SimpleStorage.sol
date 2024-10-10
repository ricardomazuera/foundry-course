// SPDX-License-Identifier: MIT
pragma solidity 0.8.24; // solidity version

// here we creating a contract
contract SimpleStorage {
    // Basic Types: boolean, uint, int, address, bytes

    // Bool
    // bool hasFavoriteNumber = true;

    // uint
    // in uint and int we can specify how many bits we want
    // that they use.
    // If you don't specify bits, default is 256
    //uint256 favoriteNumber = 88;

    // we can only declarate the variable and solidity sets
    // this according with the type. For e.g:
    uint256 myFavoriteNumber; // uint256 is 0 for standard

    // lists
    // uint256[] listOfFavoriteNumbers; // [0,10,25,85]

    // structs
    struct Person {
        uint256 favoriteNumber;
        string name;
    }

    /*
    Person public pat = Person({       
        favoriteNumber: 7, 
        name: "Pat"    
    });
    */

    // creating list of persons
    // static array
    // Person[3] listOfPeople;
    Person[] public listOfPeople;

    // int
    // int256 favoriteInt = -88;

    // string
    // string favoriteNumberText = "eighty eight";

    // address
    // address myAddress = 0x589605619b607C9eBF8520ce75D3007F4Dafd3d9;

    // bytes
    // bytes32 favoriteBytes32 = "cat";

    // mapping
    mapping(string => uint256) public nameToFavoriteNumber;

    // we'll create to new function
    function store(uint256 _favoriteNumber) public virtual {
        myFavoriteNumber = _favoriteNumber;
    }

    // view, pure
    // solidity have these two words when we only going to
    // read the state of the blockchain and don't write in this
    function retrieve() public view returns (uint256) {
        return myFavoriteNumber;
    }

    function addPerson(uint256 _favoriteNumber, string memory _name) public {
        // We can create a newPerson to then pass it to listOfPeople
        // Person memory newPerson = Person(_favoriteNumber, _name);

        // However, we can pass directly the newPerson to the listOfPeople
        listOfPeople.push(Person(_favoriteNumber, _name));

        // Pass _favoriteNumber to mapping nameToFavoriteNumber
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}
