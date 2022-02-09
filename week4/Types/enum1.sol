contract Enum {
    enum Status {
        Pending,
        Shipped,
        Accepted,
        Rejected,
        Cancelled
    }

    struct {
        uint age;
        string name;
        bool On;
    }

    function foo (string memory _name) public {
        Name memory _Name;
        _Name.ig = _name;
    }

    Status public status 

    function get() public view returns (Status) {
        return status;
    }

    function set(Status _status) public {
        status = _status;
    }

    function check() public {
        status = Status.Canceled;
        require(status);
    }

    function cancel1() public {
        status;
    }
}