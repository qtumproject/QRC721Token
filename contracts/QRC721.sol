pragma solidity ^0.4.24;

import "./node_modules/openzeppelin-solidity/contracts/token/ERC721/ERC721Enumerable.sol";
import "./node_modules/openzeppelin-solidity/contracts/token/ERC721/ERC721Metadata.sol";
import "./node_modules/openzeppelin-solidity/contracts/access/roles/MinterRole.sol";
import "./IQRC721.sol";

 // @title Full ERC721 Token
 // This implementation includes all the required and some optional functionality of the QRC721 standard
contract QRC721 is ERC721Enumerable, ERC721Metadata, MinterRole, IQRC721 {
  constructor(string name, string symbol) ERC721Metadata(name, symbol)
    public
  {
  }
  function mint(
    address to,
    uint256 tokenId
  )
    public
    onlyMinter
    returns (bool)
  {
    _mint(to, tokenId);
    return true;
  }
  function mintWithTokenURI(
    address to,
    uint256 tokenId,
    string tokenURI
  )
    public
    onlyMinter
    returns (bool)
  {
    _mint(to, tokenId);
    _setTokenURI(tokenId, tokenURI);
    return true;
  }
}
