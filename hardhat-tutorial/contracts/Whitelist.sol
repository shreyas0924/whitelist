// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract Whitelist {
    uint256 public  maxWhitelistedAddresses;

    mapping (address => bool) whitelistedAddresses; //if address is whitelisted then we will set it to true

    uint256 public  numAddressesWhitelisted; // no. of whitelisted addresses

    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses =  _maxWhitelistedAddresses;
    }

    function addAddressToWhitelist() public {
        require(!whitelistedAddresses[msg.sender], 'Sender has already been whitelisted ');

        require(numAddressesWhitelisted < maxWhitelistedAddresses, 'More addresses cannot be added, limit reached');

        whitelistedAddresses[msg.sender] = true;

        numAddressesWhitelisted += 1;
    }



}
