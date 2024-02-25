//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

interface IERC721 {
    function transferFrom(
        address _from,
        address _to,
        uint256 _id
    ) external;
}

contract Escrow {
    // 贷方
    address public lender;
    // 检查员
    address public inspector;
    // 卖家
    address payable public seller;
    // nft地址
    address public nftAddress;

    constructor(address _nftAddress, 
                address payable _seller, 
                address _inspector, 
                address _lender) {
        lender = _lender;
        inspector = _inspector;
        seller = _seller;
        nftAddress = _nftAddress;
    }

    function list(uint256 _nftID) public {
        IERC721(nftAddress).transferFrom(msg.sender, address(this), _nftID);
    }

}
