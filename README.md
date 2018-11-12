# QRC721
QRC721 Example Implementation

# Summary
QRC721 is an implementation of NFT(non-funhible token) on Qtum based on ERC721 of OpenZeppelin's lib. We defined standard interface for QRC721 include BasicInterface, Metadata and Enumeration,finished mint and mintWithTokenURI function in this example.

QRC721 can help you quickly issue your own NFT by deploying smart contracts by Solar(smart contract deployment tool by Qtum)on Qtum, and this NFT includes all the features of ERC721.

See [Docs of Qtum](https://docs.qtum.site/en/).

See [Solar](https://github.com/qtumproject/solar).

See [eip-721](https://github.com/ethereum/EIPs/blob/master/EIPS/eip-721.md).

See [OpenZeppelin-ERC721-lib](https://github.com/OpenZeppelin/openzeppelin-solidity/tree/master/contracts/token/ERC721).

# Issue NFT

## Dependencies
Before you issue you own NFT, just make sure Solar and Solc(Solidity compiler) are installed.You also need a Qtum full nodeand Node.js&npm installed.

See [Install Solc](https://solidity.readthedocs.io/en/v0.4.25/installing-solidity.html).

See [Get Qtum full node wallet](https://github.com/qtumproject/qtum/releases).

Install Solar:
```
$ go get -u github.com/qtumproject/solar/cli/solar
```
## Quick Start
Just git this example and install openzeppelin-solidity to get a quick start:
```
$ mkdir myToken

$ cd myToken

$ git colne https://github.com/lickey777/QRC721.git

$ npm install
```

## Start Qtum Full Node
Start testnet on Qtum-qt:
```
$ /Applications/Qtum-Qt.app/Contents/MacOS/Qtum-Qt -testnet -server -rpcuser=lickey -rpcpassword=qtum -rpcport=13889
```
You can define rpcuser,rpcpassword and rpcport by yourself.

## Deploy NFT contract
Deploy Qrc721.sol in the myToken/contracts
```
$ solar deploy contracts/QRC721.sol '["name","symbol"]' --qtum_rpc=http://lickey:qtum@127.0.0.1:13889 --qtum_sender='Your testnet address'
```
Just make sure qtumrpc is consistent with the previous settings.
If success you'll get :
```
🚀  All contracts confirmed
   deployed contracts/A.sol => 3b566019c5e69e3c33c4609b51597b4b83b00e74
```
Then,there will be solar.development.json in myToken/contracts,which includes all information such as ABI,deployed address and timestamp.

## Interact with contract

Copy ABI and address of contract insolar.development.json to Qtum-qt. Just like this:

![Qtum-qt sendto](./image/1.jpg)

Then,you can interact wtih deployed contract by sendto and call it.

For example,you can mint a token to an Qtum address.

You need get hexed address because you can only interact with contracts in hexadecimal address format.Open Debug Window:
```
$ gethexaddress "address"
```
You can choose mint or mintWithURI to mint a NFT with tokenId to someone.

Then you can call function ownerOf after this transaction is confirmed, you'll see state of this token has been changed.