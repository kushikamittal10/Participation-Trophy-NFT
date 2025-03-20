// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventNFT {

    string public name = "Event Participation NFT";
    string public symbol = "EPNFT";
    
    uint256 private tokenIdCounter = 0;
    address public owner;

    mapping(uint256 => address) public tokenOwner;
    mapping(address => uint256) public balances;

    // Event when a new token is minted
    event Mint(address indexed to, uint256 tokenId);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can mint tokens");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    // Mint function for the owner to create a new NFT
    function mint(address to) public onlyOwner {
        tokenIdCounter++;
        uint256 tokenId = tokenIdCounter;
        
        tokenOwner[tokenId] = to;
        balances[to]++;

        emit Mint(to, tokenId);
    }

    // Function to get the owner of a specific tokenId
    function ownerOf(uint256 tokenId) public view returns (address) {
        return tokenOwner[tokenId];
    }

    // Function to get the balance of NFTs owned by an address
    function balanceOf(address ownerAddress) public view returns (uint256) {
        return balances[ownerAddress];
    }
}
