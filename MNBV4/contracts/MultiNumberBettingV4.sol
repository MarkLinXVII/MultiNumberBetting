pragma solidity ^0.5.0;

contract MultiNumberBettingV4 {
    uint8[3] storArray;
    uint8 public loserCount;
    uint8 public winnerCount;
    uint lastWinnerAt;
    address winner;

    mapping  (address => Winner) map;
    struct Winner {
        address winnerAddress;
        string name;
        uint guess;
        uint guessedAt;
    }

    constructor(uint8 num1, uint8 num2, uint8 num3) public {
        storArray[0] = num1;
        storArray[1] = num2;
        storArray[2] = num3;
    }
    function guess(uint8 Guess, string memory name) public returns (bool) {
        require(Guess < 10, "greater than 10");
        if (storArray[0] == Guess || storArray[1] == Guess || storArray[2] == Guess) {
            winner = msg.sender;
            map[msg.sender].winnerAddress = msg.sender;
            map[msg.sender].name = name;
            map[msg.sender].guess = Guess;
            map[msg.sender].guessedAt = now;
            return true;
        } else {
            loserCount++;
            return false;
        }
    }
    function getLastWinnerInfo() public view returns (address winnerAddress, string memory name, uint winnerGuess, uint timeGuessed) {
        winnerAddress = map[winner].winnerAddress;
        name = map[winner].name;
        winnerGuess = map[winner].guess;
        timeGuessed = map[winner].guessedAt;
    }
    function checkWinning(address winnerAddress) public view returns (address winnerAddress1,
    string memory name1,
    uint guessVal,
    uint timeGuessed) {
        Winner memory tempWinner = map[winnerAddress];
            if (tempWinner.guessedAt != 0) {
            winnerAddress1 = tempWinner.winnerAddress;
            name1 = tempWinner.name;
            guessVal = tempWinner.guess;
            timeGuessed = tempWinner.guessedAt;
        }
    }
    function totalGuesses() public view returns (uint) {
        return winnerCount + loserCount;
    }
    function daysSinceLastWinning() public view returns (uint) {
        return now - (lastWinnerAt * 1 days);
    }
    function hoursSinceLastWinning() public view returns (uint) {
        return now - (lastWinnerAt * 1 hours);
    }
    function minutesSinceLastWinning() public view returns (uint) {
        return now - (lastWinnerAt * 1 minutes);
    }

}