// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/introspection/IERC165.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

/// @title Invisible Token Contract
/// @author Elvis Wong
/// @dev based on a standard ERC721, invisible means it is not visible nor transferable to others or even in opensea, only viewable by owner.
contract InvisibleToken is ERC721, ERC721Enumerable, ERC721URIStorage, Ownable {

    using Counters for Counters.Counter;

    // Base URI
    string private _uri;

    // Counters
    Counters.Counter private _counter;

    // token invisibility
    mapping(uint256 => bool) private _invisibilities;

    constructor(string memory baseURI) ERC721("InvisibleToken", "IT") {
        _setBaseURI(baseURI);
    }

    function _beforeTokenTransfer(address from, address to, uint256 tokenId) internal virtual override(ERC721, ERC721Enumerable) {
        super._beforeTokenTransfer(from, to, tokenId);
    }

    function _burn(uint256 tokenId) internal virtual override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }
    
    function supportsInterface(bytes4 interfaceId) public view virtual override(IERC165, ERC721, ERC721Enumerable) returns (bool) {
        return super.supportsInterface(interfaceId);
    }

    function tokenURI(uint256 tokenId) public view virtual override(ERC721, ERC721URIStorage) returns (string memory) {
        if (_isInvisible(tokenId) && !ownerOf(tokenId)) {
            return "";
        } else {
            return super.tokenURI(tokenId);
        }
    }

    /// @notice disable approve from when invisible
    function approve(address to, uint256 tokenId) public virtual override(ERC721, IERC721) {
        require(!_isInvisible(tokenId), "Token is invisible");
        super.approve(to, tokenId);
    }

    /// @notice disable transfer from when invisible
    function transferFrom(address from, address to, uint256 tokenId) public virtual override(ERC721, IERC721) {
        require(!_isInvisible(tokenId), "Token is invisible");
        super.transferFrom(from, to, tokenId);
    }

    /// @notice safe transfer from only allow for whitelist and us when invisible
    function safeTransferFrom(address from, address to, uint256 tokenId, bytes memory _data) public virtual override(ERC721, IERC721) {
        require(!_isInvisible(tokenId), "Token is invisible");
        super.safeTransferFrom(from, to, tokenId, _data);
    }

    //  ------------------------------------- View only --------------------------------------

    /// @notice check whether token is now invisible to others or not
    function _isInvisible(uint256 tokenId) public view returns (bool) {
        return _invisibilities[tokenId];
    }

    //  ------------------------------------- New Functions only --------------------------------------

    /// @notice toggle token invisibility
    function toggleInvisible(uint256 tokenId) external {
        require(ownerOf(tokenId) == _msgSender(), "Token owner only");
        _invisibilities[tokenId] = !_invisibilities[tokenId];
    }

    //  ------------------------------------- Owner only -------------------------------------

    /// @notice mint token
    /// @dev Only `Owner` can mint
    function mint(address to, string memory uri) public virtual onlyOwner {
        // get tokenId from counter
        uint256 tokenId = _counter.current();
        // call ERC721 safe mint
        _safeMint(to, tokenId);
        // set token URI
        _setTokenURI(tokenId, uri);
        // increase tokenId by one
        _counter.increment();
    }

    /// @notice Set base URI, onlyOwner
    function _setBaseURI(string memory newUri) public virtual onlyOwner {
        _uri = newUri;
    }

    //  ------------------------------------- Private only ------------------------------------

    /// @notice get base URI
    function _baseURI() internal view virtual override returns (string memory) {
        return _uri;
    }

}