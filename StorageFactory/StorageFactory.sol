// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;
import "./SimpleStorage.sol";

contract StorageFactory {

    address[] public simpleStorageArray;
    
    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(address(simpleStorage));
    }

     function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        // Address 
        // ABI 
        SimpleStorage(simpleStorageArray[_simpleStorageIndex]).store(_simpleStorageNumber);
        //simpleStorageArray[_simpleStorageIndex].store(_simpleStorageNumber);
    }
    
    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256) {
         return SimpleStorage(simpleStorageArray[_simpleStorageIndex]).retrieve();
        //return simpleStorageArray[_simpleStorageIndex].retrieve();
    }

    function sfStoreToAdress(address _storageAddress, uint256 _simpleStorageNumber) public {
          SimpleStorage(_storageAddress).store(_simpleStorageNumber);
    }

    function sfGetFromAddress(address _storageAddress) public view returns (uint256) {
         return SimpleStorage(_storageAddress).retrieve();
        //return simpleStorageArray[_simpleStorageIndex].retrieve();
    }
    
}