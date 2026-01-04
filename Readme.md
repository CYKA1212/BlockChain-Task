The address who deploys the contract is set as owner using owner=msg.sender
Anyone can deposit ETH but only owner can withdraw, this we ensure using require(msg.sender==owner, "Only owner can withdraw");
Another require statement require(msg.value>0, "Deposited amount must be greater than 0");checks that the deposites amt is more than 0 or not