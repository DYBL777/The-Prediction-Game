# The Prediction Game Engine

**Oracle-Resolved Skill-Based Games with Eternal Seed Integration**

A universal game primitive for prediction competitions across any asset class, any time period, any structure. Built on Chainlink Price Feeds. Protected under BUSL-1.1.

---

## What Is This?

A single specification covering every possible configuration of oracle-resolved prediction games where players select N assets from M tracked assets and compete on prediction accuracy.

This is the second primitive from DYBL Foundation. The first, [The Eternal Seed](https://github.com/DYBL777/The-Eternal-Seed), defines how capital is retained and compounded. This primitive defines how games are structured, resolved, and rewarded on top of that retention mechanism.

The flagship implementation is **Crypto42**: 42 cryptocurrencies, pick 6, weekly resolution, 6-year lifecycle with breathing economics and OG endgame. See [DYBL-Lettery-v1](https://github.com/DYBL777/DYBL-Lettery-v1) for the broader protocol suite.

---

## Specification Coverage

The specification documents every variant across 8 dimensions. Any combination is protected.

### Asset Classes (A1-A7)

| Variant | Asset Type | Oracle Source | Status |
|---------|-----------|---------------|--------|
| A1 | Cryptocurrency | Chainlink Crypto/USD Feeds | **Implemented (Crypto42)** |
| A2 | Tokenized Equities | Chainlink Equity Feeds | Planned (24 feeds live Jan 2026) |
| A3 | Commodities | Chainlink Commodity Feeds | Specified |
| A4 | Forex / Currencies | Chainlink FX Feeds | Specified |
| A5 | Mixed Asset | Multiple feed types | Specified |
| A6 | Indices | Chainlink Index / Derived | Specified |
| A7 | ETFs / Funds | Chainlink SmartData / NAV | Specified |

**Pool sizes:** All integer values of M from 3 to 10,000.
**Pick counts:** All integer values of N from 1 to M-1.

This means Crypto3, Crypto4, Crypto5... through Crypto1000 are all covered. Same for Stocks3 through Stocks10000. And every pick count within each pool size.

### Temporal Variants (T1-T7)

| Variant | Resolution | Cooldown |
|---------|-----------|----------|
| T1 | Weekly | 7 days **(Implemented)** |
| T2 | Daily | 1 day |
| T3 | Monthly | ~30 days |
| T4 | Quarterly | ~90 days |
| T5 | Progressive | Changes over lifetime **(Implemented)** |
| T6 | Hourly / Speed | 1-24 hours |
| T7 | Custom Epoch | Any duration |

### Structural Variants (S1-S9)

| Variant | Structure |
|---------|----------|
| S1 | Standard Pool (tiered prizes) **(Implemented)** |
| S2 | Head-to-Head |
| S3 | League / Season Format |
| S4 | Tournament / Bracket |
| S5 | Streak Rewards |
| S6 | Weighted Picks (confidence scoring) |
| S7 | Contrarian / Bottom Prediction |
| S8 | Range Prediction |
| S9 | Ordering / Full Rank |

### Economic Variants (E1-E8)

| Variant | Model |
|---------|-------|
| E1 | Breathing Economics **(Implemented)** |
| E2 | Fixed Economics |
| E3 | Dynamic / Pot-Health |
| E4 | Subscription **(Implemented)** |
| E5 | Entry Fee (per draw) |
| E6 | Free-to-Play with Premium |
| E7 | Whale Edition **(Planned)** |
| E8 | Multi-Ticket |

### OG / Loyalty Variants (O1-O4)

| Variant | Loyalty Model |
|---------|--------------|
| O1 | Endgame OG **(Implemented)** |
| O2 | Yield OG (ongoing rewards) |
| O3 | Tiered OG (Bronze/Silver/Gold/Diamond) |
| O4 | Performance OG (skill + patience) |

### Cross-Chain Variants (X1-X4)

| Variant | Deployment |
|---------|-----------|
| X1 | Single Chain **(Implemented)** |
| X2 | Multi-Chain Independent |
| X3 | Multi-Chain Unified (CCIP) |
| X4 | Multi-Chain Leaderboard |

### Yield Variants (Y1-Y4)

| Variant | Yield Source |
|---------|-------------|
| Y1 | No Yield (raw USDC) **(Implemented at launch)** |
| Y2 | Single Source (Aave) **(Planned)** |
| Y3 | Multi-Yield Diversified |
| Y4 | ERC-4626 Vault Wrapper |

### Specialised Variants (G1-G8)

| Variant | Special Configuration |
|---------|--------------------|
| G1 | The Official Rug (time-decay seed) |
| G2 | Educational Predictor |
| G3 | Charity Prediction |
| G4 | Corporate / Team Prediction |
| G5 | Prediction Market Hybrid |
| G6 | Multi-Game Passport |
| G7 | Sharia-Compliant Prediction |
| G8 | Perpetual Game (no end date) |

### Combination Matrix

Any variant from each category combines with any from every other category.

**Total unique configurations: 3,612,672+**

All combinations, whether explicitly described or derivable from the matrix, are protected under BUSL-1.1.

---

## How It Works

1. **Players select N assets** from a pool of M oracle-tracked assets
2. **Oracle price feeds** determine actual performance over a fixed period
3. **Players whose selections best match top performers** win prizes
4. **All entry fees flow into a single pot** with Eternal Seed retention
5. **The pot floor only rises.** Prizes paid from a controlled percentage.

No randomness. No VRF. Pure skill. Players succeed through research, analysis, and market understanding. This is a game of skill, not chance.

---

## Infrastructure

| Component | Provider | Purpose |
|-----------|----------|---------|
| Price Feeds | Chainlink | Asset performance resolution |
| Automation | Chainlink | Scheduled draw execution |
| Data Streams | Chainlink | Low-latency feeds (speed rounds) |
| CCIP | Chainlink | Cross-chain communication |
| Yield | Aave V3/V4 | Optional yield on retained capital |
| Stablecoin | USDC (Circle) | Entry denomination |

---

## Index Product Derivatives

The data generated by prediction games has derivative value. Weekly top performers, as determined by thousands of players and verified by Chainlink oracles, create natural indices.

All index products, data licensing arrangements, and derivative instruments based on prediction game resolution data are covered by this specification under BUSL-1.1.

---

## Relationship to Other DYBL Primitives

| Primitive | Repository | Function |
|-----------|-----------|----------|
| The Eternal Seed | [The-Eternal-Seed](https://github.com/DYBL777/The-Eternal-Seed) | Capital retention and compounding |
| **The Prediction Game** | **This repo** | **Game resolution and rewards** |
| Protocol Protection Layer | [Protocol-Protection-Layer](https://github.com/DYBL777/Protocol-Protection-Layer) | Embedded user compensation |
| DYBL Lettery | [DYBL-Lettery-v1](https://github.com/DYBL777/DYBL-Lettery-v1) | VRF lottery (first implementation) |

---

## File Structure

```
The-Prediction-Game/
  PredictionGameEngine.sol    Core specification (all variants, BUSL-1.1)
  README.md                   This file
  LICENSE                     BUSL-1.1
```

---

## License

**Business Source License 1.1 (BUSL-1.1)**

- **Licensed Work:** PredictionGameEngine and all documented variants
- **Licensor:** DYBL Foundation
- **Change Date:** 10 May 2029
- **Change License:** MIT

Production use requires a commercial license from DYBL Foundation until the Change Date. After the Change Date, this code converts to MIT license.

---

## Contact

**DYBL Foundation**

- Email: dybl7@proton.me
- Twitter: [@DYBL77](https://twitter.com/DYBL77)
- Discord: dybl777
- GitHub: [DYBL777](https://github.com/DYBL777)

Commercial licensing, partnership, and integration enquiries welcome.

---

*Built with 900+ hours of development. One person. AI tools. Zero funding.*
*The primitive that makes prediction games a public good after 2029.*
