pragma solidity ^0.5.0;

import "./MultiNumberBettingAbstractV2.sol";

contract MultiNumberBettingV6 is MultiNumberBettingAbstractV2 {
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
        uint ethersReceived;
    }
    address owner;
 
    constructor(uint8 num1, uint8 num2, uint8 num3) public payable {
        storArray[0] = num1;
        storArray[1] = num2;
        storArray[2] = num3;
        owner = msg.sender;
    }
    modifier ownerOnly {
        if (msg.sender == owner) {
            _;
            return;
        } else {
            revert("Not owner.");
        }
    }

    function guess(uint8 Guess, string memory name) public payable returns (bool) {
        require(Guess < 10, "greater than 10");
        if (msg.value > MAX_BET && msg.value < MIN_BET) {
            revert("Outside the betting range.");
        }
        require(address(this).balance > 3*MAX_BET, "Contract is broke.");
        if (storArray[0] == Guess || storArray[1] == Guess || storArray[2] == Guess) {
            winnerCount++;
            winner = msg.sender;
            map[msg.sender].winnerAddress = msg.sender;
            map[msg.sender].name = name;
            map[msg.sender].guess = Guess;
            map[msg.sender].guessedAt = now;
            map[msg.sender].ethersReceived = msg.value;
            lastWinnerAt = map[msg.sender].guessedAt;
            uint winnings = msg.value*2;
            msg.sender.transfer(winnings);
            return true;
        } else {
            loserCount++;
            return false;
        }
    }
    function getLastWinnerInfo() public view returns (address winnerAddress,
                                                        string memory name,
                                                        uint winnerGuess,
                                                        uint timeGuessed,
                                                        uint ethersReceived) {
        winnerAddress = map[winner].winnerAddress;
        name = map[winner].name;
        winnerGuess = map[winner].guess;
        timeGuessed = map[winner].guessedAt;
        ethersReceived = map[winner].ethersReceived;
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
    function ownerWithdraw(uint amount) public ownerOnly {
        require(address(this).balance - amount > 3*MAX_BET, "Contract is broke.");
        msg.sender.transfer(amount);
    }
    // fallback function
    function() external payable {}
}