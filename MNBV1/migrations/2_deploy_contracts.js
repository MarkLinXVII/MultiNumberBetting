const MultiNumberBettingV1 = artifacts.require("MultiNumberBettingV1");
module.exports = function(deployer) {
    deployer.deploy(MultiNumberBettingV1,1,3,9);
}