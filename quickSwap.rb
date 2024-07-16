require 'ethereum'
require 'digest/sha3'

rpc_url = 'https://polygon-rpc.com/'
block_number = 26444465

# Event signature for Swap event
swap_event_text_signature = "Swap(address,uint256,uint256,uint256,uint256,address)"

# Compute the Keccak-256 hash of the event signature manually
event_signature_hash = Digest::SHA3.hexdigest(swap_event_text_signature, 256).gsub('0x', '')

# Initialize Ethereum client
ethereum = Ethereum::HttpClient.new(rpc_url)

def get_swap_events(ethereum, block_number, event_signature_hash)
  # Convert block number to hex
  block_hex = '0x' + block_number.to_s(16)

  # Prepare RPC params
  params = {
    fromBlock: block_hex,
    toBlock: block_hex,
    topics: ["0x" + event_signature_hash]
  }

  # Get logs using eth_getLogs RPC method
  begin
    response = ethereum.eth_get_logs(params)

    if response["result"].nil? || response["result"].empty?
      puts "No swap events found for block ##{block_number}"
    else
      puts "Swap events emitted for block ##{block_number}:"

      response["result"].each do |log|
        begin
          # Extract transaction hash from log
          tx_hash = log["transactionHash"]

          # Decode log data
          data = log["data"].gsub('0x', '')

          event = {
            sender: "0x" + log["topics"][1][26..-1],
            amount0In: data[0...64].to_i(16),
            amount1In: data[64...128].to_i(16),
            amount0Out: data[128...192].to_i(16),
            amount1Out: data[192...256].to_i(16),
            to: "0x" + log["topics"][2][26..-1]
          }

          # Output event details including transaction hash
          puts "Transaction Hash: #{tx_hash}"
          puts "Sender: #{event[:sender]}, Amount0In: #{event[:amount0In]}, Amount1In: #{event[:amount1In]}, Amount0Out: #{event[:amount0Out]}, Amount1Out: #{event[:amount1Out]}, To: #{event[:to]}"
          puts "---"
        rescue => e
          puts "Error processing log: #{e.message}"
          puts log
        end
      end
    end
  rescue IOError => e
    puts "Error fetching logs: #{e.message}"
  end
end

# Fetch swap events for the specified block
get_swap_events(ethereum, block_number, event_signature_hash)
