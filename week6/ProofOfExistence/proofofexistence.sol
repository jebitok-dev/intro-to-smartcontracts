// SPDX-License-Identifier: MIT

pragma solidity 0.8.4;

contract ProofOfExistence {
    // the admin can create record for a student
    // then push the record into an array
    // generate an ID for that student
    // assign the studentID ID their address  
    // assign the students record to their ID
    // student can call a function fromtheir acccount to retrieve their id
    // student can give their id to anyone who can the use it to call a function that will return

    // struct is like a class
    struct StudentRecord {
        uint ID;
        string fullname;
        uint DOB;
        string gender;
        string state_of_origin;
    }

    uint ID = 1000;

    address admin;

    mapping(address => uint) private studentsToID;
    mapping(uint => StudentRecord) internal IDToRecord;
    mapping(uint => StudentRecord) public dropouts;

    StudentRecord[] studentRecords;

    constructor (address _admin) {
        admin = _admin;
    }

    modifier onlyAdmin {
        require(msg.sender == admin, "Only admin can call this function");
        _;
    }

    function addStudent(
        address _address,
        string memory _fullname, 
        uint _DOB, 
        string memory _gender,
        string memory _state_of_origin
    ) public onlyAdmin returns(bool, uint)  {

        if(addressExist(_address)) {
            return (false, 0);
        }

        ID = ID + 1;

        StudentRecord memory newStudent = StudentRecord(ID, _fullname, _DOB, _gender, _state_of_origin);

        studentRecords.push(newStudent);

        // mapping(most important allowing student to allows others to use their address/id)
        studentsToID[_address] = ID; // mapping of address to uint

        IDToRecord[ID] = newStudent;

        return (true, ID);
    } 

   
    function retrieveID() external view returns (bool, uint256) {
        uint id = studentsToID[msg.sender];
        if(id == 0) return (false, 0);
        return (true, id);
    }

     // Jumoke: for admin to retrieve student ID by their wallet address
    function adminRecovery(address _address) onlyAdmin external view returns(bool, uint256) {
        uint id = studentsToID[_address];
        if(id == 0) return(false, 0);
        return (true, id);
    }

    // a function to return the record of a student by their id
    function confirmRecord(uint256 _ID) external view returns(StudentRecord memory) {
        return IDToRecord[_ID];
    }

    // to confirm whether an address already has a record associated with it
    function addressExist(address _address) internal view returns(bool) {
        return !(studentsToID[_address] == 0);
    }

    function dropOut(uint256 IDTobeDeleted) external onlyAdmin returns(bool) {
        require(IDToRecord[IDTobeDeleted].ID != 0, "Student does not exist");
        dropouts[IDTobeDeleted] = IDToRecord[IDTobeDeleted];
        // dropouts[_ID] = IDToRecord[_ID]
        // if(IDToRecord[_ID].id == 0)
        delete IDToRecord[IDTobeDeleted];

        // first method
        // uint indexTobeRemoved;
        // for(uint i; i <= studentRecords.length; i++) {
        //    if(studentRecords[i].ID == IDTobeDeleted) {
        //        indexTobeRemoved = i;
        //        delete studentRecords[indexTobeRemoved];
        //    }
        // }
    
        // second method
        // for(uint i = indexTobeRemoved; i < studentRecords.length; i++) {
        //     studentRecords[i] = studentRecords[i + 1];
        // }
        // studentRecord.pop();

        // third method: recommended
        uint indexTobeRemoved;
        for(uint i; i < studentRecords.length; i++) {
            if(studentRecords[i].ID == IDTobeDeleted) {
                indexTobeRemoved = i;
                break;
            }
        }
        studentRecords[indexTobeRemoved] = studentRecords[studentRecords.length - 1];
        studentRecords.pop();
        // [1, 2, 3, 4]

        return true;
    } 
}