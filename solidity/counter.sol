pragma solidity 0.5.1;

/**
  * Simple counter
 */
contract Counter {
    uint public count;
    event Increment(uint count);
    event Decrement(uint count);
    
    constructor() public {
        count = 0;
    }
    
    function getCount() view public returns(uint) {
        return count;
    }
    
    function increment() public {
        count++;
        emit Increment(count);
    }
    
    function decrement() public {
        count--;
        emit Decrement(count);
    }
}