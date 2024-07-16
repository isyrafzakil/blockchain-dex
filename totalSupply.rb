require 'ethereum'
require 'json'

# Polygon RPC URL
rpc_url = 'https://polygon-rpc.com/'

# MANA token contract address on Polygon
contract_address = '0xA1c57f48F0Deb89f569dFbE6E2B7f46D33606fD4'

# ERC20 ABI (including the totalSupply function)
abi = <<-ABI
[
  {
    "constant": true,
    "inputs": [],
    "name": "totalSupply",
    "outputs": [
      {
        "name": "",
        "type": "uint256"
      }
    ],
    "payable": false,
    "stateMutability": "view",
    "type": "function"
  }
]
ABI

# Initialize the Ethereum client
ethereum = Ethereum::HttpClient.new(rpc_url)

# Create the contract instance
contract = Ethereum::Contract.create(client: ethereum, name: 'MANA', address: contract_address, abi: JSON.parse(abi))

# Fetch the total supply of the MANA token
begin
  total_supply = contract.call.total_supply
  puts "Total Supply of MANA token on Polygon: #{total_supply}"
rescue NoMethodError => e
  puts "Error: #{e.message}"
  puts "Methods available: #{contract.call.methods.sort}"
end
