// put as first the license-id: MIT
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8; // 0.8.12

contract SimpleStorage {
    // default types: boolean, uint, int, address, bytes
    uint256 favoriteNumber;

    mapping(string => uint256) public nameToFavoriteNumber;

    struct People {
        uint256 favoriteNumber;
        string name;
    }
    //People public person = People({favoriteNumber: 2, name: "Gabriele"});
    //List -> ex. uint256[] public favoreNumberList
    People[] public people;
    
    function store(uint256 _favoriteNumber) public virtual{
        favoriteNumber = _favoriteNumber;
    }

    // view or pure --> we just read, we dont spend gas. No transactions unless we call it from
    // a function that spend gas.
    function retrieve() public view returns(uint256) {
        return favoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}