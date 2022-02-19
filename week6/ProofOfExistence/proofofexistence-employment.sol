// SPDX-License-Identifier: MIT
// Proof of Existence Contract for Job Applications(Accept/Reject Applicants)
pragma solidity ^0.8.4;

contract ProofOfExistence {
    struct ApplicantDetails {
        uint ID;
        string fullname;
        uint yearsOfExp;
        string stack;
        uint hoursOfAvailability;
    }

    uint ID = 1000;

    address recruiter;

    mapping(address => uint) private applicantsToID;
    mapping(uint => ApplicantDetails) internal IDToRecord;
    mapping(uint => ApplicantDetails) public rejections;

    ApplicantDetails[] applicantRecord;

    constructor (address _recruiter) {
        recruiter = _recruiter;
    }

    modifier onlyRecruiter {
        require(msg.sender == recruiter, "Only recruiter can call this function");
        _;
    }

    function acceptApplicant(
        address _address,
        string memory _fullname,
        uint _yearsOfExp,
        string memory _stack,
        uint _hoursOfAvailability
    ) public onlyRecruiter returns(bool, uint) {
        if(applicantAlreadyAccepted(_address)) {
            return (false, 0);
        }

        ID = ID + 1;

        ApplicantDetails memory acceptedApplicant = ApplicantDetails(ID, _fullname, _yearsOfExp, _stack, _hoursOfAvailability);
        applicantRecord.push(acceptedApplicant);

        applicantsToID[_address] = ID;

        IDToRecord[ID] = acceptedApplicant;

        return(true, ID);
    }

    function findApplByID() external view returns (bool, uint256) {
        uint id = applicantsToID[msg.sender];
        if(id == 0) return (false, 0);
        return (true, id);
    }

    function recruiterFindApplById(address _address) onlyRecruiter external view returns(bool, uint256) {
        uint id = applicantsToID[_address];
        if(id == 0) return (false, 0);
        return (true, id);
    }

    function confirmDetails(uint256 _ID) external view returns(ApplicantDetails memory) {
        return IDToRecord[_ID];
    }

    function applicantAlreadyAccepted(address _address) internal view returns(bool) {
        return !(applicantsToID[_address] == 0);
    }

    function rejectedApplicant(uint256 IDToBeDeleted) external onlyRecruiter returns(bool) {
        require(IDToRecord[IDToBeDeleted].ID != 0, "Student does not exist");
        rejections[IDToBeDeleted] = IDToRecord[IDToBeDeleted];
        delete IDToRecord[IDToBeDeleted];

        uint applicantIdTobeRemoved;
        for(uint i; i < applicantRecord.length; i++) {
            if(applicantRecord[i].ID == IDToBeDeleted) {
                applicantIdTobeRemoved = i;
                break;
            }
        }
        applicantRecord[applicantIdTobeRemoved] = applicantRecord[applicantRecord.length - 1];
        applicantRecord.pop();
        return true;
    }
}