const MultiNumberBettingV3 = artifacts.require("MultiNumberBettingV3");
module.exports = function(deployer) {
    deployer.deploy(MultiNumberBettingV3,1,3,9);
}