const arg = require('arg');
const {Qtum} = require('qtumjs');

const args = arg({
    '--qtum_rpc':   String,
    '--solar_file': String,
});

const repo = require(args['--solar_file']);
const qtum = new Qtum(args['--qtum_rpc'], repo);
const contract = qtum.contract('contracts/QRC721.sol');

async function getData() {
    let res = {token: []};

    // get name
    data = await contract.call('name');
    res['name'] = data['outputs'][0];

    // get symbol
    data = await contract.call('symbol');
    res['symbol'] = data['outputs'][0];

    // get index
    data = await contract.call('totalSupply');
    index = data['outputs'][0].toNumber();
    res['totalSupply'] = index;

    // get tokenId
    res['tokenId'] = []
    for(let i = 0; i < index; i++){
        data = await contract.call('tokenByIndex',[i]);
        res['tokenId'].push(data['outputs'][0].toNumber());
    }

    // get tokenOwner
    res['tokenOwner'] = []
    for(let i = 0; i < index; i++){
        temp = res['tokenId'][i];
        data = await contract.call('ownerOf',[temp]);
        res['tokenOwner'].push(data['outputs'][0]);
    }

    // get tokenURI
    res['tokenURI'] = []
    for(let i = 0;i < index; i++){
        temp = res['tokenId'][i];
        data = await contract.call('tokenURI',[temp]);
        res['tokenURI'].push(data['outputs'][0]);
    }

    return res;
}

async function mint(to, tokenId) {
    const tx = await contract.send(
        "mint", 
        [to, tokenId], 
        {senderAddress: contract['info']['sender']});

    return tx;
}

async function mintWithTokenURI(to, tokenId, tokenURI) {
    const tx = await contract.send(
        "mintWithTokenURI", 
        [to, tokenId, tokenURI], 
        {senderAddress: contract['info']['sender']});

    return tx;
}

switch (args['_'][0]) {
    case 'getinfo':
        getData().then(function(data){
            console.log(data);
        });
        break;
    case 'mint':
        if (args['_'].length == 3) {
            mint(args['_'][1], args['_'][2]).then(function(data){
                console.log(data);
            });
        } else {
            mintWithTokenURI(args['_'][1], args['_'][2], args['_'][3]).then(function(data){
                console.log(data);
            });
        }
        break;

    default:
        console.log('bad command');
        console.log('bad command');
}