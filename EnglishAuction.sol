// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

interface IERC721 {
    function safeTransferFrom(address from, address to, uint tokenId) external;
    function transferFrom(address _from, address _to, uint _nftId) external;
}

contract EnglishAuction {
    event Start();
    event Bid(address indexed bidder, uint bid);
    event Withdraw(address indexed withdrawer, uint balance);
    event End(address indexed winner, uint bid);

    IERC721 immutable nft;
    uint public immutable nftId;

    address payable public immutable seller;
    uint32 public endAt; // upwards to 100 years
    bool public started;
    bool public ended;

    address public highestBidder;
    uint public highestBid;
    mapping(address => uint) public bids;

    constructor(address _nft, uint _nftId, uint _startingBid) {
        nft = IERC721(_nft);
        nftId = _nftId;

        seller = payable(msg.sender);
        highestBid = _startingBid;
    }

    function start() external {
        require(!started, "Auction has already started.");
        require(msg.sender == seller, "Function only accessible to seller");

        nft.transferFrom(seller, address(this), nftId);
        started = true;
        endAt = uint32(block.timestamp + 60); // For demo purpose this auction is set to end in 60s
        emit Start();
    }

    function bid() external payable {
        require(started, "This auction has not started");
        require(!ended, "This auction has ended");
        require(msg.value > highestBid, "You must enter an amount higher than the current bid");

        if (highestBidder != address(0)) {
            bids[highestBidder] += highestBid; // when the first bidder bids, the highest bidder is address(0)
        }

        highestBidder = msg.sender;
        highestBid = msg.value;
        
        emit Bid(msg.sender, msg.value);
    }

    function withdraw() external {
        uint bal = bids[msg.sender];
        bids[msg.sender] = 0; // prevents reentrancy
        payable(msg.sender).transfer(bal);

        emit Withdraw(msg.sender, bal);
    }

    function end() external {
        require(started, "This auction has not started");
        require(block.timestamp >= endAt, "This auction has not ended");
        require(!ended, "This auction has ended");

        ended = true;

        if (highestBidder != address(0)) {
            nft.safeTransferFrom(address(this), highestBidder, nftId);
            seller.transfer(highestBid);
        } else {
            nft.safeTransferFrom(address(this), seller, nftId);
        }

        emit End(highestBidder, highestBid);
    }
}