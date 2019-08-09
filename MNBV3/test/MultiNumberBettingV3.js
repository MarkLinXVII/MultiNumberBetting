var MultiNumberBettingV3 = artifacts.require("./MultiNumberBettingV3.sol");

contract('MultiNumberBettingV3', function(accounts) {
    it("should assert true", function() {
        var multi_number_betting_v3;
        return MultiNumberBettingV3.deployed().then(function(instance) {
            multi_number_betting_v3 = instance;
            multi_number_betting_v3.guess(3, "Michael Scott");
            return multi_number_betting_v3.minutesSinceLastWinning.call();
        }).then(function(result) {
            console.log(result, "minutes since last");
            assert.isTrue(result <= 100);
        });
    });
});