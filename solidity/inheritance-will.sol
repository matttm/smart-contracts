pragma solidity ^0.5.7;

/**
 * Contract for distributing a fortune in a will.
 * 
 * This was written from following a tutorial on Medium
**/
contract InheritanceWill {
    
    address owner;
    uint fortune;
    bool isDeceased;
    address payable[] inheritors;
    
    mapping (address => uint) inheritance;
    
    constructor() public payable {
        owner = msg.sender;
        fortune = msg.value;
        isDeceased = false;
    }
    
    function setInheritance(address payable wallet, uint amount) public ownerGuard {
        inheritors.push(wallet);
        inheritance[wallet] = amount;
    }
    
    function distributeInheritance() private deceasedGuard {
        for (uint i = 0; i < inheritors.length; i++) {
            inheritors[i].transfer(inheritance[inheritors[i]]);
        }
    }
    
    function deceased() public ownerGuard {
        isDeceased = true;
        distributeInheritance();
    }
    
    modifier deceasedGuard() {
        require(isDeceased == true);
        _;
    }
    
    modifier ownerGuard() {
        require(msg.sender == owner);
        _;
    }
}