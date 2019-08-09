var MultiNumberBettingV5 = artifacts.require("./MultiNumberBettingV5.sol");

contract('MultiNumberBettingV4', function(accounts) {
    it("should assert true", function() {
        var multi_number_betting_v5;
        return MultiNumberBettingV5.deployed().then(function(instance) {
            multi_number_betting_v5 = instance;
            multi_number_betting_v5.guess(3, "Michael Scott");
            return multi_number_betting_v5.minutesSinceLastWinning.call();
        }).then(function(result) {
            console.log(result, "minutes since last");
            assert.isTrue(result <= 100);
        });
    });
});