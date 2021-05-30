pragma solidity 0.8.1;

// WIP
contract Auction {
    uint public token;
    address seller;
    Bid public highestBid;
    struct Bid {
        address bidder;
        uint256 amount;
    }
    
    constructor(uint _token) {
        token = _token;
        seller = msg.sender;
        highestBid = Bid(address(0), 0);
    }
    
    function bid(address sender, uint256 amount) payable public bidGuard {
        highestBid = Bid(sender, amount);
    }
    
    function endAuction() payable public {
        payable(seller).transfer(highestBid.amount);
    }
    
    modifier bidGuard() {
        require(msg.value > highestBid.amount);
        _;
    }
}