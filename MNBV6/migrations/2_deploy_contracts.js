const MultiNumberBettingV6 = artifacts.require("MultiNumberBettingV6");
module.exports = function(deployer) {
    deployer.deploy(MultiNumberBettingV6,1,3,9);
}