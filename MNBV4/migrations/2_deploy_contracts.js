const MultiNumberBettingV4 = artifacts.require("MultiNumberBettingV4");
module.exports = function(deployer) {
    deployer.deploy(MultiNumberBettingV4,1,3,9);
}