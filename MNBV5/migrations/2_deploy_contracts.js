const MultiNumberBettingV5 = artifacts.require("MultiNumberBettingV5");
module.exports = function(deployer) {
    deployer.deploy(MultiNumberBettingV5,1,3,9);
}