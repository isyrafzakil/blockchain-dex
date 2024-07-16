# Contract Calls Knowledge

### Total Supply of MANA Token on Polygon

- [Refer code](./totalSupply.rb)

```
Total Supply: 5014904093285805223931666
```

## DEX Event Logs

1. **Recent Swaps (UniSWAP V2)**

   ![Recent Swaps](./UniSWAP%20V2%20Recent%20Swaps.png)

2. **Raw Number Origin (UniSWAP V2)**

   ![Screenshot1](./UniSWAP%20V2%20Raw%20Number.png)

This can be found in the [event logs](https://etherscan.io/tx/0x5e555836bacad83ac3989dc1ec9600800c7796d19d706f007844dfc45e9703ac/advanced#eventlog)

![Screenshot2](./UniSWAP%20V2%20Raw%20Number_1.png)

This can be found in ERC-20 Tokens Transferred: 3 section of the [Overview](https://etherscan.io/tx/0x5e555836bacad83ac3989dc1ec9600800c7796d19d706f007844dfc45e9703ac/) by clicking Net Transfers

![Screenshot3](./UniSWAP%20V2%20Raw%20Number_2.png)

This can be found at the bottom of [Overview](https://etherscan.io/tx/0x5e555836bacad83ac3989dc1ec9600800c7796d19d706f007844dfc45e9703ac/) by clicking More Details

Effective Price Calculation:

Using the provided swap details, we calculate the effective price during the swap:

Effective Price per ETH = USDC Received/ETH Amount Swapped = 3184.35/1.15481 ≈ 2758.29 USDC per ETH

The discrepancy between the effective price during the swap and the listed Ether price ($2,816.26) is due to factors such as slippage and price impact.

Slippage: This is like going to the store to buy something priced at $10, but when you get to the register it actually costs $10.05. Slippage can happen because of the trade size and the amount of currency available for trading (liquidity).

Price Impact: Imagine you're buying a lot of something at a store. Because you're taking a big chunk of what's available, the store might raise the price a little bit. Price impact is similar - your trade can affect the price of the currency you're buying in the liquidity pool, especially if the trade is large compared to the pool size. This can lead to you paying a bit more than the quoted price.

3. **Quickswap for Block #26444465**

   - [Refer code](./quickSwap.rb)

```
Swap events emitted for block #26444465:
Transaction Hash: 0x3483fd0fa5d38905e28245ca9ca87b0ab331a104c509e3d239be8f1e5337c01b
Sender: 0xa5e0829caced8ffdd4de3c43696c57f7d7a678ff, Amount0In: 0, Amount1In: 4487488303473224, Amount0Out: 8713302115784607036, Amount1Out: 0, To: 0xa5e0829caced8ffdd4de3c43696c57f7d7a678ff
---
```

4. **Price Impact**

### What is Price Impact?

Imagine you're shopping at a store with limited stock. If you buy a lot of something, the price might jump because there's less left. This is similar to price impact on Quickswap, a trading platform that uses special pools of currency instead of traditional order books.

### Why is Price Impact Important?

- **Less Stuff, Bigger Moves:**
  On Quickswap, these pools act like the store with limited stock. Big trades can use up a big chunk of the pool, causing prices to swing wildly.

- **Trade Smarter, Not Harder:**
  Knowing price impact helps traders guess how much the price might change due to their trade. This lets them adjust their strategy to avoid getting a bad deal.

### The Math Behind It

Price impact is usually calculated by comparing the size of your trade to the total amount of currency in the pool. Basically, a bigger trade compared to a smaller pool means a bigger price impact.

### Example: Watch Out for That Negative Sign!

Let's say a trader buys $10,000 worth of something on Quickswap, and the pool only has $100,000 total. This trade is 10% of the pool's size. Because it's such a big chunk, the price actually goes against the trader (indicated by a negative sign).

### The Bottom Line

Understanding price impact is crucial for trading on Quickswap. By keeping it in mind, traders can avoid nasty surprises and make smarter decisions in the wild world of decentralized finance.
