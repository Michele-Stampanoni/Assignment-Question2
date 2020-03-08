pragma solidity >=0.5.0 <0.7.0; 

import "./Ownable.sol"; 
import "./ERC20.sol"; 
import "./safemath.sol"; 
 
contract CoToken is Ownable, ERC20 {

 using SafeMath for uint256; 


 function buyPrice(uint256 _totalSupply, uint256 _amountPurchased) public pure returns (uint256) {
 require(_totalSupply == 100); 
 uint256 total = _totalSupply.add(_amountPurchased); 
 uint256 price = 0.01*_totalSupply + 0.2;  
 return _price; 
 }


 function sellPrice(uint256 _totalSupply, uint256 _amountSold) public pure returns (uint256) {
   uint256 total =  _totalSupply.sub(_amountSold); 
   uint256 price = (0.01*_totalSupply + 0.2); 
   return _price; 
   }

 function mint(address account, uint256 amount) internal {
   emit Transfer(address(0), account, amount);
   if (_price == _buyPrice) {
   _totalSupply = _totalSupply.add(amount);
    }
 } 
 
 function burn(address account, uint256 amount) internal {
    require(account == msg.sender);
    if (_price == _sellPrice) {
    totalSupply = _totalSupply.sub(amount);
    }
    _burn(msg.sender); 
  }

 function destroy(address _owner) public {
   if (_totalSupply[_owner] == 100) {
   selfdestruct(_owner); 
   }
 } 