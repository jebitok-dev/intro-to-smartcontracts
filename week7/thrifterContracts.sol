// SPDX-License-Identifier: MIT;

pragma solidity ^0.8.4;

contract Struct2 {
    struct thriftOrg {
        address[] thrifters;
        uint256 maturityTime;
        address lastCollector;
        mapping(address=>uint) collections;
        bool valid;
        uint totalAmount;
        mapping(address => uint[]) thriftAmountCollected;
    }

    mapping(uint=>thriftOrg) public thrifts;
    uint thriftIndex = 0;

    function addThrift() external returns(uint tIndex_) {
        thriftOrg storage t = thrifts[thriftIndex]; //initiates new thrift
        t.maturityTime = block.timestamp + 100;
        t.valid = true; // valid for people to start joining
    }


    function joinThrift(uint _thriftId) external payable { //can be extensive
        confirm(_thriftId); //no restriction everyone can join thrift(extrenal) 
        thriftOrg storage t = thrifts[thriftIndex]; // confirm thrift is valid
        t.thrifters.push(msg.sender); //push address as one of the drifters
        t.collections[msg.sender] += msg.value; //amount contributed
        t.totalAmount += msg.value; //total amount sent
    }
//called by next person to collect whole pot
    function collectThrift(uint _tId) public { //you're the netx person to collect
        thriftOrg storage t = thrifts[thriftIndex]; 
        (address nxtCollector, uint index) = getNextCollector(t.thrifters, t.lastCollector); //collect two state varibales
            assert(msg.sender == nxtCollector);
            assert(block.timestamp >= t.maturityTime); // each thrift spend given time before next collector can come & collect
        payable(msg.sender).transfer(t.totalAmount);
        if(index == t.thrifters.length - 1) {
            reset(_tId);
        }
        t.thriftAmountCollected[msg.sender].push(t.totalAmount);
    }

    function confirm(uint _id) private {
        assert(thrifts[_id].valid);
    }
//array of addresses: whole thrifters next person 
    function getNextCollector(address[] memory _in, address _last) public returns(address _next, uint index) { // next address & index(i__) 
        assert(_in.length > 1); //check array you're passing: a lot of address & less should be 2
        if(_last == address(0)) { // if last person is index 0 there's no next
            _next = _in[0];
        }

        if(_last != address(0)) { // first person to collect
            uint i__= findIndex(_in, _last); //find address on the array
            _next = _in[i__+1]; // i__ is the next person to collect
            index=i__;
            // if(i__ == _in.length - 1) {
            //     reset(i__);
            // }
        }
    }
// array of addresses & target: its position & ensure address is not empty 
    function findIndex(address[] memory in1, address target) private returns(uint index) {
        assert(in1.length > 1);
        for(uint i = 0; i < in1.length; i++) { // return index
            if(target == in1[i]) { // index person who collected last the find next
                index = i; 
            }
        }
    }
//reset last collectors to 0: 
    function reset(address[] memory in1, uint _tId) private { 
        thrifts[_tId].lastCollector = address(0);
        thrifts[_tId].maturityTime += 100;
    }
}

//logic can be different but it should do what its suppose to do
// use counter instead of reset
// {uint256 rAmmount,,,,} = _getValue(tAmount)