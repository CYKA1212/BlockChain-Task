// SPDX-License-Identifier: GPL-3.0
pragma solidity > 0.5.0 <=0.9.0;
contract VotingSystem{
    address public admin;
    bool public status;
    uint internal votesC1;
    uint internal votesC2;
    mapping(address => bool) public voter;
    constructor(){
        votesC1=0;
        votesC2=0;
        admin=msg.sender;
        status=true;
    }
    function vote(uint _candidateID) public {
        require(status==true, "Voting closed");
        require(voter[msg.sender]!=true, "Already Voted");
        require(_candidateID==1 || _candidateID==2, "No such candidate");               
        if (_candidateID==1){
            voter[msg.sender]=true;
            votesC1++;
        }
        else {
            voter[msg.sender]=true;
            votesC2++;
        }
    }
    function getVotes() public view returns(uint, uint){
        return(votesC1, votesC2);
    }
    function toggleVotingStatus() public{
        require(msg.sender==admin, "Only Admin has this power");
        status=!status;
    }
}