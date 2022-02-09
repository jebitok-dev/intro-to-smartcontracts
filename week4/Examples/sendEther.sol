pragma solidity ^0.8.10;

/*
which function is called fallback() or receive()

        send Ether
            |
        msg.data is empty
        /    \
        Yes    No
    receive 
*/

contact SendEther {
    function sendViaTransfer(address payable _to) public payable {
        _to.transfer(msg.value);
    }

    function sendViaSend(address payable _to) public payable {
        bool sent = _to.send(msg.value);
        require(sent, "Failed to send Ether");
    }

    function sendViaCall(address payable _to) public payable {
        (bool send, bytes memory data) = _to.call(value; msg.value)("");
        require(sent, "Failed to send Ether");
    }
}