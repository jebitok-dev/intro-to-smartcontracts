pragma solidity ^0.8.0;

contract test11 {
    struct IN {
        string name;
        uint256 age;
    }

    library fillinData {
        event outt(IN)

        function reg(IN memory _in↑, mapping (uint => IN) storage insss↑) internal {
            IN storage = insss[1];
            i.name = _in↑.name;
            i.age = _in↑.age;
            emit outt(i);
        }

    }
}