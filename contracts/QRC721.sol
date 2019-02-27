pragma solidity ^0.5.0;

import "../node_modules/openzeppelin-solidity/contracts/token/ERC721/ERC721MetadataMintable.sol";
import "./IQRC721.sol";

contract QRC721 is IQRC721, ERC721MetadataMintable {
    constructor(string memory name, string memory symbol) ERC721Metadata(name, symbol) public {
    }
}