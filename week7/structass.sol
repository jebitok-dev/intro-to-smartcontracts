// SPDX-License-Identifier: MIT;

contract AfricanArtist {
    struct Artists {
        string name;
        uint noOfAlbums;
        uint noOfSingles;
        string socialMediaUrl;
        mapping(address => string) ArtistDetails;
        mapping(string)
    }

    struct TrendingMusic {
        uint no;
        string songTitle;
        uint noOfListeners;
        mapping(uint => address) musicNoOnCharts;
        Artists a;
    }

    mapping(string => TrendingMusic) TopMusic;

    struct ArtistsWithoutChartingSongs{
        Artists storage ar = ArtistDetails[name];
        ar.no = _n;
        ar.songTitle = _ns;
        ar.noOfListeners = _nl;
    }

    function seeArtists(string[] memory _art) public view returns(Artists[] memory) {
        for (uint i 0; i < _art.length; i++) {

        }
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


    function getArtistDetails(address artist, string calldata name) external view returns(uint chartNo) {
        chartNo = ArtistDetails[name];
    }

    function getArtistAddress(uint noOfAlbums, string memory socialMediaUrl, uint no, string calldata name) external view returns(address artName) {
        artName = TopMusic[name].a.ArtistDetails[noOfAlbums][no];
    }
}