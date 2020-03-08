//import truffle assertions
const truffleAssert = require('truffle-assertions') 

// import the contract artifact
const CoToken = artifacts.require('./CoToken.sol')

contract('CoToken', function (accounts) {
    let CoTokenInstance

   beforeEach(async function () {   
    CoTokenInstance = await CoToken.new()
    })  
    
 // first test: checks mint function 
   it('should mint tokens if the correct price is used', async function () {
    await CoTokenInstance.mint(accounts[0], 100)
    let balance = await CoTokenInstance.balances(accounts[0])
    assert.equal(balance.toNumber(), 100, "100 tokens not minted")
  })  
  
 //second test: checks burn function 
 it('should check that only the owner calls the burn function', async function () {
   let owner = await CoTokenInstance.burn(owner = msg.sender)
   assert.equal(owner, msg.sender, "Owner did not call burn function")
  })

  // third test: checks destroy functon 
  it('should destroy the contract', async function () {
   await CoTokenInstance.require(owner = msg.sender)
   let destroy = CoTokenInstance.destroy()  
   assert.equal(owner, msg.sender, 'function not called by owner')  
  })
}))