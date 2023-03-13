// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

contract GasContract {
    uint256 wasLastOdd = 1;
    uint256 public totalSupply = 0; // cannot be updated
    uint256 paymentCounter = 0;

    address contractOwner;
    mapping(address => uint256) balances;
    mapping(address => Payment[]) payments;
    mapping(address => uint256) public whitelist;
    address[5] public administrators;
    uint8 paymentType = 1;
    struct Payment {
        uint8 paymentType;
        uint256 paymentID;
        address recipient;
        uint256 amount;
    }
    struct ImportantStruct {
        uint256 valueA; // max 3 digits
        uint256 bigValue;
        uint256 valueB; // max 3 digits
    }

    modifier onlyAdminOrOwner() {
        require(checkForAdmin(msg.sender) || (msg.sender == contractOwner));
        _;
    }
    event Transfer(address recipient, uint256 amount);

    constructor(address[] memory _admins, uint256 _totalSupply) {
        contractOwner = msg.sender;
        totalSupply = _totalSupply;
        for (uint256 ii = 0; ii < administrators.length; ii++) {
            if (_admins[ii] != address(0)) {
                administrators[ii] = _admins[ii];
                if (_admins[ii] == contractOwner) {
                    balances[contractOwner] = totalSupply;
                }
            }
        }
    }

    function checkForAdmin(address _user) public view returns (bool admin_) {
        for (uint256 ii = 0; ii < administrators.length; ii++) {
            if (administrators[ii] == _user) {
                admin_ = true;
            }
        }
    }

    function balanceOf(address _user) public view returns (uint256 balance_) {
        balance_ = balances[_user];
    }

    function getTradingMode() public pure returns (bool mode_) {
        mode_ = true;
    }

    function getPayments(address _user)
        public
        view
        returns (Payment[] memory payments_)
    {
        payments_ = payments[_user];
    }

    function transfer(
        address _recipient,
        uint256 _amount,
        string memory _name
    ) public returns (bool status_) {
        balances[msg.sender] -= _amount;
        balances[_recipient] += _amount;
        emit Transfer(_recipient, _amount);
        payments[msg.sender].push(
            Payment(2, ++paymentCounter, _recipient, _amount)
        );
        return true;
    }

    function updatePayment(
        address _user,
        uint256 _ID,
        uint256 _amount,
        uint8 _type
    ) public onlyAdminOrOwner {
        for (uint256 ii = 0; ii < payments[_user].length; ii++) {
            if (payments[_user][ii].paymentID == _ID) {
                payments[_user][ii].paymentType = _type;
                payments[_user][ii].amount = _amount;
                break;
            }
        }
    }

    function addToWhitelist(address _userAddrs, uint8 _tier)
        public
        onlyAdminOrOwner
    {
        if (_tier > 3) {
            whitelist[_userAddrs] = 3;
        } else {
            whitelist[_userAddrs] = _tier;
        }
    }

    function whiteTransfer(
        address _recipient,
        uint256 _amount,
        ImportantStruct memory _struct
    ) public {
        address senderOfTx = msg.sender;
        balances[senderOfTx] -= (_amount - whitelist[senderOfTx]);
        balances[_recipient] += (_amount - whitelist[senderOfTx]);
    }
}