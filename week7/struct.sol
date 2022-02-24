// SPDX-License-Identfier: MIT;

pragma solidity ^0.8.4;

contract Functions {

    struct village {
        string head;
        uint houses;
        mapping(string => address) houseToWallet;
    }

    struct Cities {
        uint districts;
        string[] districtName;
        uint[] zipCodes;
        string governor;
        mapping(address => uint) balances;
        village v;
    }

    mapping(string => Cities) allCityNames;

    struct CitiesWithoutBalances{
        Cities storage c = allCityNames[cityName]; //mapping
        c.districts = _d;
        c.districtNames - _dn;
        c.zipCodes = _zc;
        c.governor = _g;
    }

    function seeCities(string[] memory _cn) public view returns(Cities[] memory) {
        for(uint i = 0; i < _cn.length; i++) {
            cOut_[i] = allCityNames[_cn][i];
        }
    }

    function checkCity(string calldata cityName) external view returns(CitiesWithoutBalances memory c) {
        Cities memory ci = allCityNames(cityName);
        c = CitiesWithoutBalances()
    }

    function changeGovernor(string calldata _newGovernor, string calldata _city) external {
        allCityNames[_city].governor = _newGovernor;
    }

    function getBalance(address who, string calldata cityName) external view returns(uint bal) {
        bal = allCityNames[cityName]
    }

    function getWallet(string huse, string memory house, uint no, string calldata cityName) external view returns(address) {
        wallet = allCityNames[cityName].v.houseToWallet[house][no];
    }
}