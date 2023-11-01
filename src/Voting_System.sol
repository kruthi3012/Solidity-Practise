// Solidity function to implement a voting system, where each address can vote only once.

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Voting_System {
    struct Candidate {
        string name;
        uint256 voteCount;
    }

    mapping(address => bool) hasVoted;

    Candidate[] public listOfCandidates;

    constructor() {
        addCandidate("monica");
        addCandidate("chandler");
        addCandidate("ross");
    }

    function addCandidate(string memory _name) public {
        listOfCandidates.push(Candidate(_name, 0));
    }

    function showCandidates() public view returns (Candidate[] memory) {
        return listOfCandidates;
    }

    function vote(uint256 candidateIndex) public {
        require(!hasVoted[msg.sender], "Address has already voted");

        require(candidateIndex < listOfCandidates.length, "Invalid candidate");

        hasVoted[msg.sender] = true;

        listOfCandidates[candidateIndex].voteCount++;
    }

    function getWinner() public view returns (string memory) {
        uint256 maxVotes;
        uint256 winningCandidateIndex;

        for (uint256 i = 0; i < listOfCandidates.length; i++) {
            if (listOfCandidates[i].voteCount > maxVotes) {
                maxVotes = listOfCandidates[i].voteCount;
                winningCandidateIndex = i;
            }
        }

        return listOfCandidates[winningCandidateIndex].name;
    }
}
