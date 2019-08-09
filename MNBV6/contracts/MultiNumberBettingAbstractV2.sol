pragma solidity ^0.5.0;

contract MultiNumberBettingAbstractV2 {
    uint constant MAX_BET = 1 ether;
    uint constant MIN_BET = 5 ether;
    function guess(uint8 Guess, string memory name) public payable returns (bool);
    function getLastWinnerInfo() public view returns (address winnerAddress,
    string memory name,
    uint winnerGuess,
    uint timeGuessed,
    uint ethersReceived);
    function checkWinning(address winnerAddress) public view returns (address winnerAddress1,
    string memory name1,
    uint guessVal,
    uint timeGuessed);
    function totalGuesses() public view returns (uint);
    function daysSinceLastWinning() public view returns (uint);
    function hoursSinceLastWinning() public view returns (uint);
    function minutesSinceLastWinning() public view returns (uint);
}