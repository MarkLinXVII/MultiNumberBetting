pragma solidity ^0.5.0;

contract MultiNumberBettingV2 {
    uint8[3] storArray;
    uint8 public loserCount;
    uint8 public winnerCount;
    string lastWinnerName;
    uint lastWinnerAt;
    address winner;
    constructor(uint8 num1, uint8 num2, uint8 num3) public {
        storArray[0] = num1;
        storArray[1] = num2;
        storArray[2] = num3;
    }
    function guess(uint8 Guess, string memory name) public returns (bool) {
        require(Guess < 10, "greater than 10");
        if (storArray[0] == Guess || storArray[1] == Guess || storArray[2] == Guess) {
            winnerCount++;
            lastWinnerName = name;
            lastWinnerAt = now;
            winner = msg.sender;
            return true;
        } else {
            loserCount++;
            return false;
        }
    }
    function totalGuesses() public view returns (uint) {
        return winnerCount + loserCount;
    }
    function getLastWinner() public view returns (string memory) {
        bytes memory temp = bytes(lastWinnerName);
        if (temp.length == 0) {
            return "***";
        }
        string memory name = new string(3);
        bytes memory temp2 = bytes(name);
        for (uint i = 0; i < 3; i++) {
            temp2[i] = temp[i];
        }
        return string(temp2);
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