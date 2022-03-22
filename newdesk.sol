//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;
pragma solidity ^0.8.4;

import "hardhat/console.sol";

contract DonationETH {
    address private owner;
    address private donationAddress;
    address[] benefactors;
    mapping(address => uint) listAmountDonation;
    uint[] listDonation;
    uint amountAllBenefactors;
    mapping(address => uint) listAmountDonation;

    constructor() {
        owner = msg.sender;
@@ -18,7 +18,7 @@ contract DonationETH {

    function makeDonation() public payable {
        require(
            msg.value >= .001 ether,
            msg.value >= 0.001 ether,
            "Need enter amount Ether"
        );
        listDonation.push(msg.value);
@@ -28,7 +28,9 @@ contract DonationETH {
    }

    function getBalance() public view returns(uint) {
        return donationAddress.balance;

        return donationAddress.balance ;

    }

    function withdrawAll(address _withdrawContract) public payable {
        require(
            owner == msg.sender && 
            donationAddress.balance > 0, 
            "You are not an owner"
        );
        address payable receiver = payable(_withdrawContract);
        receiver.transfer(donationAddress.balance);
    }
    // _amount uint256  00000000000000000000 ETH
    function withdraw(
        address _withdrawContract, 
        uint _amount
    ) public payable {
        require(
            owner == msg.sender && 
            donationAddress.balance > 0, 
            "You are not an owner"
