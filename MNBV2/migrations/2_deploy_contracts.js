const MultiNumberBettingV2 = artifacts.require("MultiNumberBettingV2");
module.exports = function(deployer) {
    deployer.deploy(MultiNumberBettingV2,1,3,9);
}