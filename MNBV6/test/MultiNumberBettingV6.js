var MultiNumberBettingV6 = artifacts.require("./MultiNumberBettingV6.sol");

contract('MultiNumberBettingV6', function(accounts) {
  var johns_address = accounts[0];
  var bills_address = accounts[1];
  var franks_address= accounts[2];

  it("should assert true", function() {
    var multi_number_betting_v6;
    return MultiNumberBettingV6.deployed().then(function(instance){
      multi_number_betting_v6 = instance;

      // #2
      var sendValue = web3.utils.toWei(20,'ether').toFixed;
      web3.eth.sendTransaction({from:johns_address,to:multi_number_betting_v6.address, value:sendValue});

      return web3.eth.getBalance(johns_address);
    }).then(function(result){
      // Print contract balance
      console.log('John balance after initial send : ',web3.fromWei(result.toNumber(),'ether'));
      
      return web3.eth.getBalance(multi_number_betting_v6.address);
    }).then(function(result){
      console.log('Contract balance after initial send : ',web3.fromWei(result.toNumber(),'ether'));

      var receiveValue = web3.utils.toWei(2,'ether').toFixed();
      // #3 If this is called with any address othe than John - it will throw excep
      return multi_number_betting_v6.ownerWithdraw(receiveValue, {from:johns_address});

    }).then(function(){ 
      // Now get the balance for John
      return web3.eth.getBalance(johns_address);
    }).then(function(result){
      console.log("Johns final balance : ",web3.fromWei(result.toNumber(),'ether'));
      // Now get the balance for Contract
      return web3.eth.getBalance(multi_number_betting_v6.address);
    }).then(function(result){
      console.log("Contracts final balance : ",web3.fromWei(result.toNumber(),'ether'));
    });
  });
});