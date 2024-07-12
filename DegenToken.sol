// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable  {
    constructor(address initialOwner) ERC20("Degen Token", "DEGEN") Ownable(initialOwner) {
     _mint(msg.sender, 1000000 * 10 ** decimals());
}

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function transfer(address recipient, uint256 amount) public virtual override returns (bool) {
        require(amount <= balanceOf(msg.sender), "Insufficient balance");
        _transfer(msg.sender, recipient, amount);
        return true;
    }

    function redeem(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    function balanceOf(address account) public view virtual override returns (uint256) {
        return super.balanceOf(account);
    }
}
