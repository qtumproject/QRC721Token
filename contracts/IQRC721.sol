pragma solidity ^0.5.0;

contract IQRC721 {
    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);
    event Approval(address indexed owner, address indexed approved, uint256 indexed tokenId);
    event ApprovalForAll(address indexed owner, address indexed operator, bool approved);

    function supportsInterface(bytes4 interfaceId) external view returns (bool);

    function name() external view returns (string memory);
    function symbol() external view returns (string memory);
    function tokenURI(uint256 tokenId) external view returns (string memory);

    function balanceOf(address owner) public view returns (uint256 balance);
    function ownerOf(uint256 tokenId) public view returns (address owner);

    function approve(address to, uint256 tokenId) public;
    function getApproved(uint256 tokenId) public view returns (address operator);

    function setApprovalForAll(address operator, bool _approved) public;
    function isApprovedForAll(address owner, address operator) public view returns (bool);

    function transferFrom(address from, address to, uint256 tokenId) public;
    function safeTransferFrom(address from, address to, uint256 tokenId) public;

    function safeTransferFrom(address from, address to, uint256 tokenId, bytes memory data) public;

    function totalSupply() public view returns (uint256);
    function tokenOfOwnerByIndex(address owner, uint256 index) public view returns (uint256 tokenId);

    function tokenByIndex(uint256 index) public view returns (uint256);

    function isMinter(address account) public view returns (bool);
    function addMinter(address account) public;
    function renounceMinter() public;

    function mintWithTokenURI(address to, uint256 tokenId, string memory tokenURI) public returns (bool);
}