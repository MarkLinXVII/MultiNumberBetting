var MultiNumberBettingV2 = artifacts.require("./MultiNumberBettingV2.sol");

contract('MultiNumberBettingV2', function(accounts) {
    it("should  assert true", function() {
        var multi_number_betting_v2;
        return MultiNumberBettingV2.deployed().then(function(instance) {
            multi_number_betting_v2 = instance;
            // asking for guess
            multi_number_betting_v2.guess(5, "John");
            // check if winner
            return multi_number_betting_v2.getLastWinner.call();
        }).then(function(result) {
            console.log("The name of the winner is ", result);
            // asking a guess
            multi_number_betting_v2.guess(3, "Michael");
            // asking for name
            return multi_number_betting_v2.getLastWinner.call();
        }).then(function(result) {
            console.log("The name of the winner is ", result);
            assert.isTrue(result == 'Mic');
        });
    });
});