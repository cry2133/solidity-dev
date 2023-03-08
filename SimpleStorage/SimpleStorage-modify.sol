// I'm a comment!
// SPDX-License-Identifier: MIT
pragma solidity 0.8.8;
contract SimpleStorage {

    uint256 private favoriteNumber;
    bytes3 public testbye = 'aaa';
    uint256 private age;

    struct People {
        uint256 favoriteNumber;
        string name;
        uint256 age;
        string gender;
    }
    // uint256[] public anArray;
    People[] public    people;

    mapping(string => uint256) public nameToFavoriteNumber;
    mapping(string => uint256) public nameToAge;

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
         retrieveAge();
    }
    
    function retrieve() public view returns (uint256){
        return favoriteNumber;
       
    }

    function storeAge(uint256 _age) public {
        age = _age;
    }

    function retrieveAge() public pure returns (uint256) {
 
        return 1 + 1;
    }



    function addPerson(string calldata _name, uint256 _favoriteNumber,uint256 _age ,string memory _gender) public  returns (People memory ){
        people.push(People(_favoriteNumber, _name, _age, _gender));
        nameToFavoriteNumber[_name] = _favoriteNumber;
        nameToAge[_name] = _age;
        addPersonOjbect(People(_favoriteNumber, _name, _age, _gender));
        return  People(_favoriteNumber, _name, _age, _gender) ;
    }

    function removePerson(string calldata _name) public {
         people.pop();
         delete nameToAge[_name];
         delete nameToFavoriteNumber[_name]; 

    }

    function addPersonOjbect(People memory _people) public returns(People memory) {
        people.push(_people);
        return _people;
      
    }
}