// SPDX-License-Identifier: Apache-2.0

pragma solidity ^0.8.18;

import "../RMRK/equippable/RMRKEquippableUpgradeable.sol";

/* import "hardhat/console.sol"; */

//Minimal public implementation of upgradeable RMRKEquippable for testing.
contract RMRKEquippableMockUpgradeable is RMRKEquippableUpgradeable {
    function initialize(
        string memory name,
        string memory symbol
    ) public virtual initializer {
        __RMRKEquippableUpgradeable_init(name, symbol);
    }

    function mint(address to, uint256 tokenId) external {
        _mint(to, tokenId, "");
    }

    function nestMint(
        address to,
        uint256 tokenId,
        uint256 destinationId
    ) external {
        _nestMint(to, tokenId, destinationId, "");
    }

    // Utility transfers:

    function transfer(address to, uint256 tokenId) public virtual {
        transferFrom(_msgSender(), to, tokenId);
    }

    function nestTransfer(
        address to,
        uint256 tokenId,
        uint256 destinationId
    ) public virtual {
        nestTransferFrom(_msgSender(), to, tokenId, destinationId, "");
    }

    function addAssetToToken(
        uint256 tokenId,
        uint64 assetId,
        uint64 replacesAssetWithId
    ) external {
        _addAssetToToken(tokenId, assetId, replacesAssetWithId);
    }

    function addEquippableAssetEntry(
        uint64 id,
        uint64 equippableGroupId,
        address catalogAddress,
        string memory metadataURI,
        uint64[] calldata partIds
    ) external {
        _addAssetEntry(
            id,
            equippableGroupId,
            catalogAddress,
            metadataURI,
            partIds
        );
    }

    function setValidParentForEquippableGroup(
        uint64 equippableGroupId,
        address parentAddress,
        uint64 partId
    ) external {
        _setValidParentForEquippableGroup(
            equippableGroupId,
            parentAddress,
            partId
        );
    }
}
