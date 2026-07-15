// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract MedicalRecordRegistry {

    // =========================
    // STRUCTS
    // =========================

    struct Patient {
        string name;
        address wallet;
        bool isRegistered;
    }

    struct MedicalRecord {
        string recordHash;
        string recordType;
        string hospital;
        uint256 timestamp;
        address owner;
    }

    // =========================
    // STORAGE
    // =========================

    mapping(address => Patient) public patients;

    mapping(address => MedicalRecord[]) private medicalRecords;

    // patient => doctor => permission
    mapping(address => mapping(address => bool)) public accessPermissions;

    // =========================
    // EVENTS
    // =========================

    event PatientRegistered(address indexed patient, string name);

    event MedicalRecordAdded(
        address indexed patient,
        string recordHash,
        string recordType
    );

    event AccessGranted(
        address indexed patient,
        address indexed doctor
    );

    event AccessRevoked(
        address indexed patient,
        address indexed doctor
    );

    // =========================
    // PATIENT FUNCTIONS
    // =========================

    function registerPatient(string memory _name) public {

        require(
            !patients[msg.sender].isRegistered,
            "Already registered"
        );

        patients[msg.sender] = Patient(
            _name,
            msg.sender,
            true
        );

        emit PatientRegistered(msg.sender, _name);
    }

    // =========================
    // RECORD FUNCTIONS
    // =========================

    function addMedicalRecord(
        string memory _recordHash,
        string memory _recordType,
        string memory _hospital
    ) public {

        require(
            patients[msg.sender].isRegistered,
            "Register first"
        );

        medicalRecords[msg.sender].push(
            MedicalRecord(
                _recordHash,
                _recordType,
                _hospital,
                block.timestamp,
                msg.sender
            )
        );

        emit MedicalRecordAdded(
            msg.sender,
            _recordHash,
            _recordType
        );
    }

    // =========================
    // ACCESS CONTROL
    // =========================

    function grantAccess(address doctor) public {

        require(
            patients[msg.sender].isRegistered,
            "Register first"
        );

        accessPermissions[msg.sender][doctor] = true;

        emit AccessGranted(msg.sender, doctor);
    }

    function revokeAccess(address doctor) public {

        require(
            patients[msg.sender].isRegistered,
            "Register first"
        );

        accessPermissions[msg.sender][doctor] = false;

        emit AccessRevoked(msg.sender, doctor);
    }

    function hasAccess(
        address patient,
        address doctor
    )
        public
        view
        returns(bool)
    {
        return accessPermissions[patient][doctor];
    }

    // =========================
    // VIEW FUNCTIONS
    // =========================

    function getMyRecords()
        public
        view
        returns(MedicalRecord[] memory)
    {
        require(
            patients[msg.sender].isRegistered,
            "Register first"
        );

        return medicalRecords[msg.sender];
    }

    function getPatientRecords(address patient)
        public
        view
        returns(MedicalRecord[] memory)
    {

        require(
            accessPermissions[patient][msg.sender],
            "Access denied"
        );

        return medicalRecords[patient];
    }

    function getMyProfile()
        public
        view
        returns(
            string memory,
            address,
            bool
        )
    {

        Patient memory p = patients[msg.sender];

        return(
            p.name,
            p.wallet,
            p.isRegistered
        );
    }

    function getRecordCount()
        public
        view
        returns(uint256)
    {
        return medicalRecords[msg.sender].length;
    }
}