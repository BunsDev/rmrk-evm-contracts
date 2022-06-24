// SPDX-License-Identifier: Apache-2.0

pragma solidity ^0.8.15;

import "../RMRK/access/RMRKIssuable.sol";
import "../RMRK/RMRKBaseStorage.sol";

contract RMRKBaseStorageMock is RMRKIssuable, RMRKBaseStorage {
    constructor(string memory _baseName)
    RMRKBaseStorage(_baseName) {}

    function addBaseEntry(IntakeStruct memory intakeStruct) external onlyIssuer {
        _addBaseEntry(intakeStruct);
    }

    function addBaseEntryList(IntakeStruct[] memory intakeStructs) external onlyIssuer {
        _addBaseEntryList(intakeStructs);
    }

    function addEquippableAddresses(
        uint64 _baseEntryId,
        address[] memory _equippableAddresses
    ) external onlyIssuer {
        _addEquippableAddresses(_baseEntryId, _equippableAddresses);
    }

    function addEquippableIdToAll(address _equippableAddress) external onlyIssuer {
        _addEquippableIdToAll(_equippableAddress);
    }

}
