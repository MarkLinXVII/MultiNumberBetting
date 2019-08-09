pragma solidity ^0.5.0;

contract MultiNumberBettingV1 {
    uint8[3] storArray;
    uint8 loserCount;
    uint8 winnerCount;
    constructor(uint8 num1, uint8 num2, uint8 num3) public {
        storArray[0] = num1;
        storArray[1] = num2;
        storArray[2] = num3;
    }
    function guess(uint8 Guess) public returns (bool) {
        if (storArray[0] == Guess || storArray[1] == Guess || storArray[2] == Guess) {
            winnerCount++;
            return true;
        } else {
            loserCount++;
            return false;
        }
    }
    function totalGuesses() public view returns (uint) {
        return winnerCount + loserCount;
    }
}