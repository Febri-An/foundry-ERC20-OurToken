// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract ManualTokens {
    mapping(address => uint256) s_balances;

    function name() public pure returns (string memory) {
        return "Manual Token";
    }

    function decimals() public view returns (uint8) {
        return 18;
    }

    function totalSupply() public view returns (uint256) {
        return 100 ether; // 100^18
    }

    function balanceOf(address _owner) public view returns (uint256) {
        return s_balances[_owner];
    }

    function transfer(address _to, uint256 _value) public returns (bool) {
        uint256 prevBalances = balanceOf(msg.sender) + balanceOf(_to);
        s_balances[msg.sender] -= _value;
        s_balances[_to] += _value;
        require(balanceOf(msg.sender) + balanceOf(_to) == prevBalances);
    }

    // function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
    //     uint256 balancesTransfer = balanceOf(_from) + balanceOf(_to);
    //     s_balances[_from] -= _value;
    //     s_balances[_to] += _value;
    //     require(balanceOf(_from) + balanceOf(_to) == balancesTransfer);
    // }
}
