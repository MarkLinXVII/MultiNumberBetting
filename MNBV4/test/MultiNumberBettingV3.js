var MultiNumberBettingV3 = artifacts.require("./MultiNumberBettingV4.sol");

contract('MultiNumberBettingV4', function(accounts) {
    it("should assert true", function() {
        var multi_number_betting_v4;
        return MultiNumberBettingV4.deployed().then(function(instance) {
            multi_number_betting_v4 = instance;
            multi_number_betting_v4.guess(3, "Michael Scott");
            return multi_number_betting_v4.minutesSinceLastWinning.call();
        }).then(function(result) {
            console.log(result, "minutes since last");
            assert.isTrue(result <= 100);
        });
    });
});