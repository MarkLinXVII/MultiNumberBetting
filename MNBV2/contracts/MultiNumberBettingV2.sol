pragma solidity ^0.5.0;

contract MultiNumberBettingV2 {
    uint8[3] storArray;
    uint8 loserCount;
    uint8 winnerCount;
    string lastWinnerName;
    constructor(uint8 num1, uint8 num2, uint8 num3) public {
        storArray[0] = num1;
        storArray[1] = num2;
        storArray[2] = num3;
    }
    function guess(uint8 Guess, string memory name) public returns (bool) {
        if (storArray[0] == Guess || storArray[1] == Guess || storArray[2] == Guess) {
            winnerCount++;
            lastWinnerName = name;
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
}