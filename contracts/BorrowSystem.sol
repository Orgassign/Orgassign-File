// SPDX-License-Identifier: MIT
pragma solidity ^0.5.4;

 import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
 import "@openzeppelin/contracts/math/SafeMath.sol";

contract BorrowSystem {
    // using SafeMath for uint256;

    address public owner;

    enum ProposalState {WAITING, ACCEPTED, REPAID}

    struct Proposal {
        address payable lender;
        uint256 loanId;
        ProposalState state;
        uint256 rate;
        uint256 amount;
    }

    enum LoanState {ACCEPTING, LOCKED, SUCCESSFUL, FAILED}

    struct Loan {
        address borrower;
        LoanState state;
        uint256 dueDate;
        uint256 amount;
        uint256 proposalCount;
        uint256 collected;
        uint256 startDate;
        bytes32 mortgage;
        mapping(uint256 => uint256) proposal;
    }

    Loan[] public loanList;
    Proposal[] public proposalList;

    mapping(address => uint256[]) public loanMap;
    mapping(address => uint256[]) public lendMap;

    constructor() public {
        owner = msg.sender;
    }
}
