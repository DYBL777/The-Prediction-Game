// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.20;

/**
 * =============================================================================
 *
 *                    PREDICTION GAME PRIMITIVE
 *                         VERSION 1.0
 *
 *                  Oracle-Resolved Skill-Based Games
 *                    with Eternal Seed Integration
 *
 * =============================================================================
 *
 * @title PredictionGameEngine
 * @author DYBL Foundation
 * @notice Core specification of the Prediction Game primitive and all variants
 *
 * @dev LICENSE: Business Source License 1.1
 *      Licensed Work: PredictionGameEngine and all documented variants
 *      Licensor: DYBL Foundation
 *      Change Date: 10 May 2029
 *      Change License: MIT
 *
 *      Use Limitation: Production use requires a commercial license from
 *      DYBL Foundation until the Change Date. After the Change Date, this
 *      code converts to MIT license.
 *
 *      Contact: dybl7@proton.me
 *
 * @dev V1.0 Initial specification:
 *      - 8 asset class variants (A1-A8) including catch-all for future feeds
 *      - 7 temporal variants (T1-T7)
 *      - 9 structural variants (S1-S9)
 *      - 8 economic variants (E1-E8)
 *      - 4 OG/loyalty variants (O1-O4)
 *      - 4 cross-chain variants (X1-X4)
 *      - 4 yield variants (Y1-Y4)
 *      - 13 specialised game variants (G1-G13)
 *      - Index product derivatives specification
 *      - Combination matrix: 6,709,248 unique variant combinations
 *      - Pool sizes M from 3 to 10,000 with picks N from 1 to M-1
 *      - Base implementation with IPredictionGame interface
 *
 * =============================================================================
 *                     INTELLECTUAL PROPERTY NOTICE
 * =============================================================================
 *
 * All variants documented in this specification, whether implemented in code
 * or described in NatSpec comments, constitute protected intellectual property
 * under BUSL-1.1 until the Change Date (10 May 2029).
 *
 * This includes but is not limited to:
 * - The prediction game primitive concept as defined herein
 * - All named variants (A1-A8, T1-T7, S1-S9, E1-E8, O1-O4, X1-X4, Y1-Y4, G1-G13)
 * - All unnamed variants derivable from the combination matrix
 * - All pool sizes (M) and pick counts (N) within documented ranges
 * - The integration of Eternal Seed retention with prediction game mechanics
 * - Index products and data derivatives from game resolution data
 *
 * Production use of any variant described herein requires a commercial
 * license from DYBL Foundation until the Change Date.
 *
 * =============================================================================
 *                         THE PREDICTION GAME PRIMITIVE
 * =============================================================================
 *
 * A prediction game is an oracle-resolved, skill-based competition where:
 *
 * 1. Players select N assets from a pool of M tracked assets
 * 2. Oracle price feeds determine actual performance over a fixed period
 * 3. Players whose selections best match top performers win prizes
 * 4. All entry fees flow into a single pot with Eternal Seed retention
 * 5. The pot floor only rises. Prizes paid from a controlled percentage.
 *
 * Core Properties:
 * - Skill-based: No randomness (VRF). Pure prediction from analysis.
 * - Oracle-resolved: Chainlink Price Feeds (or equivalent) determine outcomes.
 * - Transparent: All prices, picks, and results verifiable on-chain.
 * - Eternal Seed integrated: Percentage of pot retained forever, compounding.
 * - Progressive: Draw frequency and prize rates can change over game lifetime.
 * - Immutable core: Prize rates, tier splits, and seed retention are constants.
 *
 * Regulatory Distinction:
 * - No randomness source means this is a game of skill, not chance.
 * - Players succeed through research, analysis, and market understanding.
 * - This distinction separates prediction games from lotteries/gambling
 *   in most jurisdictions (legal review required per jurisdiction).
 *
 * Infrastructure Dependencies:
 * - Chainlink Price Feeds: Asset price resolution
 * - Chainlink Automation: Scheduled draw execution
 * - Aave (optional): Yield on retained capital
 * - USDC/stablecoin: Entry denomination
 *
 * =============================================================================
 *                     ASSET CLASS VARIANTS (What players predict)
 * =============================================================================
 *
 * All variants below share the same game engine. The difference is the
 * oracle feed source and the asset class being predicted.
 *
 * -----------------------------------------------------------------------------
 * VARIANT A1: CRYPTOCURRENCY PREDICTION [IMPLEMENTED - Crypto42]
 * -----------------------------------------------------------------------------
 * @dev Players predict top-performing cryptocurrencies over a fixed period.
 *
 * Implementation: Crypto42 (42 cryptos, pick 6, weekly resolution)
 *
 * Oracle: Chainlink Crypto/USD Price Feeds
 * Resolution: Weekly (Friday 17:00 UTC via Chainlink Automation)
 * Skill element: Crypto market analysis, news interpretation, technical analysis
 *
 * Feed requirements: M crypto/USD feeds on deployment chain
 * Current availability (Feb 2026):
 * - Ethereum Mainnet: 80-100+ crypto feeds (guaranteed)
 * - Arbitrum: 50-70+ feeds (very likely sufficient for 42)
 * - Base: 20-35 feeds (growing, may need 33 variant initially)
 * - Polygon: 40-60+ feeds (probably sufficient)
 *
 * Sub-variants by feed count:
 * - Crypto3 (pick 1): Minimum viable. 3 assets. Entry-level.
 * - Crypto6 (pick 2): Small pool. Quick analysis.
 * - Crypto10 (pick 3): Focused selection. Top 10 by market cap.
 * - Crypto15 (pick 4): Mid-range pool.
 * - Crypto20 (pick 5): Broad selection.
 * - Crypto25 (pick 6): Quarter-hundred pool.
 * - Crypto30 (pick 6): Thirty pool.
 * - Crypto33 (pick 6): Lettery character set alignment.
 * - Crypto42 (pick 6): Flagship. [IMPLEMENTED]
 * - Crypto50 (pick 8): Half-hundred. Deeper analysis required.
 * - Crypto60 (pick 10): Large pool.
 * - Crypto75 (pick 10): Extensive coverage.
 * - Crypto100 (pick 10-15): Full market coverage. "S&P of crypto."
 *
 * All integer values of M from 3 to 1000 are covered by this specification.
 * All integer values of N (picks) from 1 to M-1 are covered.
 * The constraint is: 1 <= N < M <= number of available oracle feeds.
 *
 * -----------------------------------------------------------------------------
 * VARIANT A2: TOKENIZED EQUITY PREDICTION (Stocks)
 * -----------------------------------------------------------------------------
 * @dev Players predict top-performing tokenized stocks over a fixed period.
 *
 * Oracle: Chainlink Tokenized Equity Feeds
 * Status: 24 feeds live since January 2026. Growing.
 *
 * Sub-variants by feed count:
 * - Stocks3 (pick 1) through Stocks24 (pick 6): Available now.
 * - Stocks25-42: When feeds reach threshold.
 * - Stocks50-100: When feeds reach threshold.
 * - Stocks500: "S&P 500" equivalent. When 500 equity feeds exist.
 * - Stocks1000: Full market. When feeds exist.
 *
 * All integer values of M from 3 to 10000 are covered.
 * All integer values of N from 1 to M-1 are covered.
 *
 * Regulatory note: Stock prediction games may require additional compliance.
 * Skill-based argument identical to crypto variant.
 *
 * -----------------------------------------------------------------------------
 * VARIANT A3: COMMODITY PREDICTION
 * -----------------------------------------------------------------------------
 * @dev Players predict top-performing commodities.
 *
 * Oracle: Chainlink Commodity Price Feeds (Gold, Silver, Oil, etc.)
 * Status: Limited feeds available. Specification for future deployment.
 *
 * Sub-variants: Commodities3 through Commodities100 (all M from 3 to 1000).
 * All pick counts N from 1 to M-1.
 *
 * -----------------------------------------------------------------------------
 * VARIANT A4: FOREX / CURRENCY PREDICTION
 * -----------------------------------------------------------------------------
 * @dev Players predict top-performing fiat currencies against a base.
 *
 * Oracle: Chainlink FX Price Feeds
 * Resolution: Weekly or daily (FX markets operate on different cycles)
 *
 * Sub-variants: Forex3 through Forex100 (all M from 3 to 1000).
 * All pick counts N from 1 to M-1.
 *
 * Note: FX feeds often use different quote conventions (e.g., EUR/USD vs
 * USD/JPY). Game engine normalises all to percentage change from period open.
 *
 * -----------------------------------------------------------------------------
 * VARIANT A5: MIXED ASSET PREDICTION
 * -----------------------------------------------------------------------------
 * @dev Players predict across multiple asset classes simultaneously.
 *
 * Oracle: Multiple Chainlink feed types combined
 *
 * Examples:
 * - Mixed21: 7 crypto + 7 stocks + 7 commodities, pick 6 across all
 * - Mixed42: 14 crypto + 14 stocks + 14 FX, pick 6 across all
 * - CrossAsset10: 5 crypto + 5 stocks, pick 3
 *
 * All combinations of asset classes with total M from 3 to 10000.
 * All pick counts N from 1 to M-1.
 *
 * Skill element: Cross-asset correlation analysis. Macro understanding.
 *
 * -----------------------------------------------------------------------------
 * VARIANT A6: INDEX PREDICTION
 * -----------------------------------------------------------------------------
 * @dev Players predict relative performance of market indices.
 *
 * Oracle: Chainlink Index Feeds (when available) or derived from components
 *
 * Examples:
 * - IndexBattle5: 5 indices (DeFi, L1, L2, Meme, AI), pick 2
 * - SectorRotation10: 10 crypto sectors, pick 3
 *
 * All M from 3 to 1000. All N from 1 to M-1.
 *
 * -----------------------------------------------------------------------------
 * VARIANT A7: ETF / FUND PREDICTION
 * -----------------------------------------------------------------------------
 * @dev Players predict top-performing tokenized funds.
 *
 * Oracle: Chainlink SmartData / NAV Feeds
 * Status: Emerging feed category. Specification for future deployment.
 *
 * All M from 3 to 10000. All N from 1 to M-1.
 *
 * -----------------------------------------------------------------------------
 * VARIANT A8: ANY ORACLE-RESOLVABLE ASSET CLASS (CATCH-ALL)
 * -----------------------------------------------------------------------------
 * @dev Prediction game on ANY asset class resolvable by oracle price feeds.
 *
 * This variant covers all future asset classes not explicitly named above,
 * including but not limited to:
 * - Real World Assets (RWA) tokenized price feeds
 * - DePIN token performance
 * - Liquid Staking Token (LST/LRT) performance
 * - NFT collection floor prices (when oracle feeds available)
 * - Interest rate predictions (Fed rate, DeFi lending rates)
 * - Gas price predictions (L1/L2 gas fees)
 * - Carbon credit prices
 * - Weather derivatives (when oracle feeds available)
 * - Insurance-linked securities
 * - Any data feed published by Chainlink, Pyth, Redstone, API3,
 *   Band Protocol, DIA, Tellor, UMA, or any future oracle provider
 *
 * The prediction game primitive applies to ANY quantifiable, oracle-
 * resolvable data point where relative performance can be measured
 * over a fixed time period. All such applications are covered by
 * this specification under BUSL-1.1 until the Change Date.
 *
 * All M from 3 to 10000. All N from 1 to M-1.
 *
 * =============================================================================
 *                  TEMPORAL VARIANTS (How often games resolve)
 * =============================================================================
 *
 * All asset class variants above can be combined with any temporal variant.
 *
 * -----------------------------------------------------------------------------
 * VARIANT T1: WEEKLY RESOLUTION [IMPLEMENTED - Crypto42]
 * -----------------------------------------------------------------------------
 * @dev Standard weekly draw. Friday 17:00 UTC.
 *
 * DRAW_COOLDOWN: 7 days
 * Automation cron: 0 17 * * 5
 * Sweet spot for: casual players, weekly analysis routine
 *
 * -----------------------------------------------------------------------------
 * VARIANT T2: DAILY RESOLUTION
 * -----------------------------------------------------------------------------
 * @dev Daily draw. Every day at fixed time.
 *
 * DRAW_COOLDOWN: 1 day
 * Higher engagement. Smaller prize pools per draw.
 * Better for: active traders, high-frequency players
 *
 * -----------------------------------------------------------------------------
 * VARIANT T3: MONTHLY RESOLUTION
 * -----------------------------------------------------------------------------
 * @dev Monthly draw. First Friday of each month (or calendar month end).
 *
 * DRAW_COOLDOWN: ~30 days
 * Larger prize pools. Less frequent engagement.
 * Better for: long-term analysts, macro thinkers
 *
 * -----------------------------------------------------------------------------
 * VARIANT T4: QUARTERLY RESOLUTION
 * -----------------------------------------------------------------------------
 * @dev Quarterly draw aligned with financial quarters.
 *
 * DRAW_COOLDOWN: ~90 days
 * Institutional-friendly cadence. Large prize pools.
 *
 * -----------------------------------------------------------------------------
 * VARIANT T5: PROGRESSIVE RESOLUTION [IMPLEMENTED - Crypto42]
 * -----------------------------------------------------------------------------
 * @dev Draw frequency changes over game lifetime.
 *
 * Implementation: Crypto42 uses monthly (Y1), biweekly (Y2-3), weekly (Y4-6)
 *
 * Concept: Early draws are infrequent (pot compounds between them).
 * Late draws are frequent (excitement at scale).
 * Progressive draws act as a growth throttle in early years.
 *
 * Any progression schedule from any starting frequency to any ending
 * frequency over any game duration is covered by this specification.
 *
 * -----------------------------------------------------------------------------
 * VARIANT T6: HOURLY / SPEED ROUNDS
 * -----------------------------------------------------------------------------
 * @dev Ultra-high-frequency prediction rounds.
 *
 * DRAW_COOLDOWN: 1-24 hours
 * Requires: Chainlink Data Streams (sub-second feeds) for accurate resolution
 * Better for: day traders, high-engagement apps
 * Smaller stakes per round. Higher volume.
 *
 * -----------------------------------------------------------------------------
 * VARIANT T7: CUSTOM EPOCH
 * -----------------------------------------------------------------------------
 * @dev Arbitrary time periods defined at deployment.
 *
 * DRAW_COOLDOWN: Any duration from 1 hour to 365 days
 * Enables: event-based games (e.g., "predict performance during ETH Denver")
 *
 * =============================================================================
 *                  STRUCTURAL VARIANTS (How the game is structured)
 * =============================================================================
 *
 * -----------------------------------------------------------------------------
 * VARIANT S1: STANDARD POOL [IMPLEMENTED - Crypto42]
 * -----------------------------------------------------------------------------
 * @dev All players contribute to single pot. Top performers win tiers.
 *
 * Implementation: Crypto42 with M1-M4 tiers (6/6, 5/6, 4/6, 3/6 matches)
 *
 * Tier structures covered by this specification:
 * - Any number of tiers from 1 to N
 * - Any tier split percentages summing to 100%
 * - Any match threshold for each tier (1 correct to N correct)
 * - Any jackpot allocation within tiers
 * - Rolling jackpots (miss carries forward within single pot)
 *
 * -----------------------------------------------------------------------------
 * VARIANT S2: HEAD-TO-HEAD
 * -----------------------------------------------------------------------------
 * @dev Two players compete directly against each other.
 *
 * Mechanism:
 * - Player A and Player B each pick N from M assets
 * - Resolution compares who picked more top performers
 * - Winner takes combined pot (minus seed retention and treasury)
 * - Draw: pot carries forward or splits
 *
 * Matching: Peer-to-peer matching (on-chain order book or off-chain matching)
 * Stakes: Both players must deposit equal amounts
 * Seed: Percentage of combined stake retained in pot
 *
 * -----------------------------------------------------------------------------
 * VARIANT S3: LEAGUE / SEASON FORMAT
 * -----------------------------------------------------------------------------
 * @dev Cumulative scoring across multiple resolution periods.
 *
 * Mechanism:
 * - Season = X consecutive resolution periods (e.g., 13 weeks = 1 quarter)
 * - Each period: players pick N from M, scored by match count
 * - Points accumulate across the season
 * - Season end: top cumulative scorers win season prize pool
 *
 * Season lengths: 4 weeks to 52 weeks (any duration)
 * Scoring: points per correct pick, bonus for perfect rounds
 * Prize structure: season champions, division winners, most improved
 *
 * -----------------------------------------------------------------------------
 * VARIANT S4: TOURNAMENT / BRACKET
 * -----------------------------------------------------------------------------
 * @dev Elimination-style competition across rounds.
 *
 * Mechanism:
 * - Round 1: all players pick. Bottom 50% eliminated.
 * - Round 2: survivors pick again. Bottom 50% eliminated.
 * - Continue until final round.
 * - Last players standing win prize pool.
 *
 * Bracket sizes: 8 to 1,000,000+ players
 * Elimination rate: configurable per round
 * Re-entry: optional (at higher cost)
 *
 * -----------------------------------------------------------------------------
 * VARIANT S5: STREAK REWARDS
 * -----------------------------------------------------------------------------
 * @dev Bonus prizes for consecutive successful predictions.
 *
 * Mechanism:
 * - Track consecutive weeks/periods where player achieves threshold score
 * - Streak milestones unlock bonus prizes from dedicated pool
 * - Streak breaks reset counter
 * - Longest active streak earns special recognition
 *
 * Streak thresholds: any number of consecutive periods (2 to unlimited)
 * Bonus structure: fixed, percentage, or exponential
 *
 * -----------------------------------------------------------------------------
 * VARIANT S6: WEIGHTED PICKS
 * -----------------------------------------------------------------------------
 * @dev Players assign confidence weights to their picks.
 *
 * Mechanism:
 * - Player picks N assets AND assigns weight (1-5) to each pick
 * - Higher-weighted correct picks score more points
 * - Higher-weighted incorrect picks lose more points
 * - Net score determines tier placement
 *
 * Adds skill dimension: not just WHICH assets, but HOW CONFIDENT
 *
 * -----------------------------------------------------------------------------
 * VARIANT S7: CONTRARIAN / BOTTOM PREDICTION
 * -----------------------------------------------------------------------------
 * @dev Players predict WORST performers instead of (or alongside) best.
 *
 * Mechanism:
 * - Pick N assets you think will perform WORST
 * - Resolution: bottom N performers determined
 * - Matches against worst performers win prizes
 *
 * Can be combined with standard (pick best AND worst simultaneously)
 * Adds shorting-like skill without actual short exposure
 *
 * -----------------------------------------------------------------------------
 * VARIANT S8: RANGE PREDICTION
 * -----------------------------------------------------------------------------
 * @dev Players predict the price range an asset will fall within.
 *
 * Mechanism:
 * - For each of N picks, player specifies a percentage range
 *   (e.g., "BTC will move between +2% and +5% this week")
 * - Narrower correct ranges score higher
 * - Resolution checks if actual performance falls within predicted range
 *
 * Skill element: not just direction but magnitude
 *
 * -----------------------------------------------------------------------------
 * VARIANT S9: ORDERING / FULL RANK
 * -----------------------------------------------------------------------------
 * @dev Players predict the exact ordering of top N performers.
 *
 * Mechanism:
 * - Pick N assets AND predict their exact rank order (1st, 2nd, 3rd...)
 * - Perfect order = maximum score
 * - Partial order match = partial score (e.g., Kendall tau correlation)
 *
 * Highest difficulty. Highest potential rewards.
 *
 * =============================================================================
 *                  ECONOMIC VARIANTS (How money flows)
 * =============================================================================
 *
 * -----------------------------------------------------------------------------
 * VARIANT E1: BREATHING ECONOMICS [IMPLEMENTED - Crypto42]
 * -----------------------------------------------------------------------------
 * @dev Inhale/exhale prize rate over multi-year game lifecycle.
 *
 * Implementation: Crypto42 v1.8
 * - Inhale (Y1-Y5): Fixed low prize rate (0.777%), pot grows
 * - Exhale (Y6): Linear ramp to 2x ceiling, biggest prizes ever
 * - Progressive draws: monthly to weekly over 6 years
 * - OG endgame: 90% of final pot to patient players
 * - Gambler subsidy: short-term players fund long-term savers
 *
 * Any combination of:
 * - Inhale rate: 0.01% to 10% per draw
 * - Exhale ceiling: 1x to 10x inhale rate
 * - Inhale duration: 1 to 50 years
 * - Exhale duration: 1 week to 10 years
 * - Ramp shape: linear, exponential, step, sigmoid
 *
 * -----------------------------------------------------------------------------
 * VARIANT E2: FIXED ECONOMICS
 * -----------------------------------------------------------------------------
 * @dev Constant prize rate throughout game lifetime.
 *
 * Simple. Predictable. No breathing.
 * Prize rate: any percentage from 0.01% to 100% of pot per draw
 * Game duration: 1 week to perpetual
 *
 * -----------------------------------------------------------------------------
 * VARIANT E3: DYNAMIC / POT-HEALTH ECONOMICS
 * -----------------------------------------------------------------------------
 * @dev Prize rate adjusts based on pot health metrics.
 *
 * Mechanism:
 * - healthRatio = currentPot / targetPot (or similar metric)
 * - High health: prize rate increases (reward players)
 * - Low health: prize rate decreases (protect pot)
 * - Requires on-chain health oracle or pure function calculation
 *
 * This was the original "Model B" from Crypto42 v1.7.
 * Replaced by linear ramp (E1) for simplicity, but remains a valid variant.
 *
 * -----------------------------------------------------------------------------
 * VARIANT E4: SUBSCRIPTION MODEL [IMPLEMENTED - Crypto42]
 * -----------------------------------------------------------------------------
 * @dev Players pay recurring entry fees (weekly, monthly, etc.).
 *
 * Implementation: Crypto42 ($10/week for 6 years)
 *
 * Variants:
 * - Fixed subscription: same amount every period
 * - Tiered subscription: different price levels with different benefits
 * - Dynamic subscription: price adjusts with pot size or player count
 * - One-time entry: single payment covers entire game duration
 *
 * -----------------------------------------------------------------------------
 * VARIANT E5: ENTRY FEE MODEL
 * -----------------------------------------------------------------------------
 * @dev Players pay per-draw entry fee (not subscription).
 *
 * No commitment. Pay to play each round.
 * Fee: any amount from $0.01 to $10,000+ per entry
 * No OG mechanism (no long-term commitment tracked)
 *
 * -----------------------------------------------------------------------------
 * VARIANT E6: FREE-TO-PLAY WITH PREMIUM
 * -----------------------------------------------------------------------------
 * @dev Base game is free. Premium features cost money.
 *
 * Free tier: play with virtual points, leaderboard only
 * Premium tier: real money entry, real prizes
 * Conversion funnel: free players upgrade when confident
 *
 * Pot funded entirely by premium players.
 * Free players provide liquidity of attention/engagement.
 *
 * -----------------------------------------------------------------------------
 * VARIANT E7: WHALE EDITION [PLANNED - Crypto42 ETH L1]
 * -----------------------------------------------------------------------------
 * @dev Higher entry fee targeting high-value players.
 *
 * Same game mechanics. Higher stakes.
 * Entry: $50-$100+/week
 * Target: 5,000-20,000 players (vs 55,000+ standard)
 * Deployment: ETH mainnet or premium L2
 * Pot: potentially $1B+ at scale
 *
 * -----------------------------------------------------------------------------
 * VARIANT E8: MULTI-TICKET
 * -----------------------------------------------------------------------------
 * @dev Players can purchase multiple entries per draw.
 *
 * Each ticket has different picks. Same player, different strategies.
 * Cap: configurable maximum tickets per player per draw
 * Pot contribution: each ticket contributes to pot independently
 *
 * Already partially implemented in Crypto42 (2 tickets per player).
 * Extendable to any cap from 1 to unlimited.
 *
 * =============================================================================
 *                  OG / LOYALTY VARIANTS (How patience is rewarded)
 * =============================================================================
 *
 * -----------------------------------------------------------------------------
 * VARIANT O1: ENDGAME OG [IMPLEMENTED - Crypto42]
 * -----------------------------------------------------------------------------
 * @dev Long-term players receive share of final pot at game end.
 *
 * Implementation: Crypto42 (4+ year commitment, 90% of final pot split)
 *
 * Parameters (all configurable):
 * - OG threshold: minimum commitment period (1 month to full game)
 * - Endgame split: 1% to 100% of final pot to OGs
 * - Charity allocation: 0% to 50% of endgame to charity
 * - Non-OG returnee pricing: 1x to 10x standard price
 * - Latecomer OG bonus allocation: 0% to 100% of premium to OG pool
 *
 * -----------------------------------------------------------------------------
 * VARIANT O2: YIELD OG
 * -----------------------------------------------------------------------------
 * @dev Long-term players receive ongoing yield from pot.
 *
 * Instead of endgame lump sum, OGs earn continuous yield.
 * Yield source: Aave yield on pot capital.
 * Distribution: proportional to tenure and commitment level.
 * No endgame. Perpetual rewards for staying.
 *
 * -----------------------------------------------------------------------------
 * VARIANT O3: TIERED OG
 * -----------------------------------------------------------------------------
 * @dev Multiple OG levels based on commitment duration.
 *
 * Tiers:
 * - Bronze OG: 1 year commitment
 * - Silver OG: 2 year commitment
 * - Gold OG: 3 year commitment
 * - Diamond OG: 4+ year commitment
 *
 * Higher tiers receive larger share of endgame/yield.
 * Tiers, durations, and splits all configurable.
 *
 * -----------------------------------------------------------------------------
 * VARIANT O4: PERFORMANCE OG
 * -----------------------------------------------------------------------------
 * @dev OG status requires both commitment AND performance.
 *
 * Must maintain minimum prediction accuracy over commitment period.
 * Rewards skill + patience, not just patience.
 * Performance threshold: any accuracy from 1% to 100%
 *
 * =============================================================================
 *                  CROSS-CHAIN / INFRASTRUCTURE VARIANTS
 * =============================================================================
 *
 * -----------------------------------------------------------------------------
 * VARIANT X1: SINGLE CHAIN [IMPLEMENTED]
 * -----------------------------------------------------------------------------
 * @dev Game deployed on one chain. Standard model.
 *
 * -----------------------------------------------------------------------------
 * VARIANT X2: MULTI-CHAIN INDEPENDENT
 * -----------------------------------------------------------------------------
 * @dev Same game deployed independently on multiple chains.
 *
 * Separate pot per chain. Separate players per chain.
 * Same rules. Different deployments.
 * No cross-chain communication needed.
 *
 * -----------------------------------------------------------------------------
 * VARIANT X3: MULTI-CHAIN UNIFIED (CCIP)
 * -----------------------------------------------------------------------------
 * @dev Single game spanning multiple chains via Chainlink CCIP.
 *
 * Players on any supported chain. Single unified pot.
 * CCIP handles cross-chain messaging.
 * Circle CCTP handles USDC burn/mint for cross-chain transfers.
 * Aave V4 CCLL provides unified cross-chain yield.
 *
 * -----------------------------------------------------------------------------
 * VARIANT X4: MULTI-CHAIN LEADERBOARD
 * -----------------------------------------------------------------------------
 * @dev Independent games per chain, unified global leaderboard via CCIP.
 *
 * Each chain has its own pot and prizes.
 * CCIP aggregates scores for global ranking.
 * Global prizes from dedicated cross-chain pool.
 *
 * =============================================================================
 *                  YIELD INTEGRATION VARIANTS
 * =============================================================================
 *
 * -----------------------------------------------------------------------------
 * VARIANT Y1: NO YIELD (RAW USDC) [IMPLEMENTED - Crypto42 launch]
 * -----------------------------------------------------------------------------
 * @dev Pot held as raw stablecoin. No yield source.
 *
 * Simplest. Safest. No third-party risk.
 * Used at launch before Aave activation.
 *
 * -----------------------------------------------------------------------------
 * VARIANT Y2: SINGLE YIELD SOURCE (AAVE) [PLANNED]
 * -----------------------------------------------------------------------------
 * @dev Pot deposited to single yield protocol.
 *
 * Implementation: Aave V3 (current) or V4 (when ready)
 * Activated via timelocked proposal (7-day public review)
 *
 * -----------------------------------------------------------------------------
 * VARIANT Y3: MULTI-YIELD DIVERSIFIED
 * -----------------------------------------------------------------------------
 * @dev Pot split across multiple yield sources.
 *
 * E.g., 50% Aave + 30% Compound + 20% Morpho
 * Reduces single-protocol risk. More complex.
 * Rebalancing via Chainlink Automation.
 *
 * -----------------------------------------------------------------------------
 * VARIANT Y4: YIELD VAULT WRAPPER
 * -----------------------------------------------------------------------------
 * @dev Pot deposited to ERC-4626 vault that handles yield strategy.
 *
 * Game contract only interacts with vault interface.
 * Vault handles yield optimisation internally.
 * Clean separation of game logic and yield logic.
 *
 * =============================================================================
 *                  SPECIALISED GAME VARIANTS
 * =============================================================================
 *
 * -----------------------------------------------------------------------------
 * VARIANT G1: THE OFFICIAL RUG
 * -----------------------------------------------------------------------------
 * @dev Time-decay seed variant. The "rug" IS the mechanism.
 *
 * Seed slowly releases over time (Eternal Seed Variant 10).
 * Game is transparent about the decay schedule.
 * "The only rug pull you can see coming."
 *
 * Combines prediction game with time-decay seed economics.
 * Players know exactly when and how much releases.
 *
 * -----------------------------------------------------------------------------
 * VARIANT G2: EDUCATIONAL PREDICTOR
 * -----------------------------------------------------------------------------
 * @dev Prediction game framed as learning tool.
 *
 * Post-draw analysis: "Here's why these 6 won this week"
 * Backward learning: study winners to improve predictions
 * Low entry fee ($1-5/week) to minimise risk for learners
 * Score tracking shows improvement over time
 *
 * Same game mechanics. Different framing and UX.
 *
 * -----------------------------------------------------------------------------
 * VARIANT G3: CHARITY PREDICTION
 * -----------------------------------------------------------------------------
 * @dev All or partial proceeds to charitable causes.
 *
 * Combines Eternal Seed Variant 15 (Charitable Seed) with prediction game.
 * Players compete. Charities benefit.
 * Seed yield flows to verified charity registry.
 * Player prizes from pot. Charity from seed yield.
 *
 * -----------------------------------------------------------------------------
 * VARIANT G4: CORPORATE / TEAM PREDICTION
 * -----------------------------------------------------------------------------
 * @dev Teams (companies, DAOs, friend groups) compete collectively.
 *
 * Team picks: aggregate of individual member predictions.
 * Team scoring: combined accuracy across all members.
 * Team prizes: split among team members.
 *
 * Enables: corporate team-building, DAO competitions, social groups.
 *
 * -----------------------------------------------------------------------------
 * VARIANT G5: PREDICTION MARKET HYBRID
 * -----------------------------------------------------------------------------
 * @dev Prediction game with market-like pricing for picks.
 *
 * Popular picks cost more. Contrarian picks cost less.
 * If popular pick wins: lower payout (many picked it).
 * If contrarian pick wins: higher payout (few picked it).
 *
 * Adds market-making dynamics to prediction game.
 *
 * -----------------------------------------------------------------------------
 * VARIANT G6: MULTI-GAME PASSPORT
 * -----------------------------------------------------------------------------
 * @dev Single subscription covers multiple prediction games.
 *
 * Pay once. Play Crypto42 + Stocks24 + Commodities10.
 * Passport NFT tracks access across games.
 * Bundled economics: cheaper than individual subscriptions.
 *
 * -----------------------------------------------------------------------------
 * VARIANT G7: SHARIA-COMPLIANT PREDICTION
 * -----------------------------------------------------------------------------
 * @dev Game structured to comply with Islamic finance principles.
 *
 * No interest (Aave yield directed entirely to charity/seed).
 * Skill-based competition (not gambling).
 * Transparent, pre-agreed terms.
 * Ethical investment screening on asset pool.
 *
 * Requires: Sharia advisory board review.
 * Enables: access to Muslim-majority markets.
 *
 * -----------------------------------------------------------------------------
 * VARIANT G8: PERPETUAL GAME (No End Date)
 * -----------------------------------------------------------------------------
 * @dev Game runs indefinitely with no Y6 endgame.
 *
 * No OG endgame lump sum. Continuous play.
 * Seed grows forever. Prizes from controlled percentage.
 * Players enter and exit freely.
 * Closest to "infrastructure" rather than "game."
 *
 * -----------------------------------------------------------------------------
 * VARIANT G9: PAIR TRADING PREDICTION
 * -----------------------------------------------------------------------------
 * @dev Players predict which asset outperforms another in a pair.
 *
 * Mechanism:
 * - M/2 pairs presented (e.g., BTC vs ETH, SOL vs AVAX)
 * - Player picks winner of each pair
 * - Resolution: which asset had higher % change
 * - Score: number of correct pair predictions
 *
 * Pairs can be: same class (crypto vs crypto), cross-class (crypto vs stock),
 * or themed (L1 vs L1, meme vs meme).
 *
 * All pair counts from 1 to 5000 covered.
 *
 * -----------------------------------------------------------------------------
 * VARIANT G10: PORTFOLIO RETURN PREDICTION
 * -----------------------------------------------------------------------------
 * @dev Players build a weighted portfolio. Total return vs benchmark.
 *
 * Mechanism:
 * - Player allocates 100% across N picks with custom weights
 * - Resolution: weighted portfolio return calculated
 * - Players whose portfolio beats benchmark (or peers) win
 *
 * Benchmarks: equal-weight basket, BTC, ETH, specific index.
 * Adds asset allocation skill on top of selection skill.
 *
 * -----------------------------------------------------------------------------
 * VARIANT G11: MULTI-PERIOD PREDICTION
 * -----------------------------------------------------------------------------
 * @dev Players predict outcomes for multiple future periods at once.
 *
 * Mechanism:
 * - Submit picks for next 2-52 periods simultaneously
 * - Each period resolved independently
 * - Bonus for consecutive correct multi-period predictions
 *
 * Adds: forward-looking analysis, macro trend identification.
 *
 * -----------------------------------------------------------------------------
 * VARIANT G12: THRESHOLD PREDICTION
 * -----------------------------------------------------------------------------
 * @dev Players predict which assets will cross a specific threshold.
 *
 * Mechanism:
 * - "Which of these 42 cryptos will gain more than 5% this week?"
 * - Player picks all they think will cross threshold
 * - Score based on precision and recall (correct picks / total picks)
 *
 * Thresholds: any percentage from -100% to +1000%.
 * Variable difficulty based on threshold chosen.
 *
 * -----------------------------------------------------------------------------
 * VARIANT G13: ELIMINATION SURVIVOR
 * -----------------------------------------------------------------------------
 * @dev Long-running elimination game across multiple periods.
 *
 * Mechanism:
 * - All players start. Each period, worst-scoring players eliminated.
 * - Last players standing win the accumulated pot.
 * - Season length: 4 to 52 periods.
 * - Entry fee contributes to prize pool and seed.
 *
 * Re-entry: optional at higher cost.
 * Creates sustained engagement across entire season.
 *
 * =============================================================================
 *                       INDEX PRODUCT DERIVATIVES
 * =============================================================================
 *
 * The data generated by prediction games (weekly top performers as
 * determined by thousands of players) has derivative value:
 *
 * - C42 Index: Top 6 performing cryptos each week (community-validated)
 * - S42 Index: Top 6 performing stocks each week
 * - Performance indices across any asset class and time period
 * - Historical performance data (permanent, on-chain)
 * - Sentiment indicators (what players predict vs what happens)
 *
 * All index products, data licensing arrangements, and derivative
 * instruments based on prediction game resolution data are covered
 * by this specification under BUSL-1.1 until the Change Date.
 *
 * =============================================================================
 *                       COMBINATION MATRIX
 * =============================================================================
 *
 * Any variant from each category can be combined with any variant
 * from every other category. The total combination space is:
 *
 * Asset (A1-A8) x Temporal (T1-T7) x Structural (S1-S9)
 *   x Economic (E1-E8) x OG (O1-O4) x Chain (X1-X4)
 *   x Yield (Y1-Y4) x Special (G1-G13)
 *
 * = 8 x 7 x 9 x 8 x 4 x 4 x 4 x 13 = 6,709,248 unique combinations
 *
 * Plus: all M values from 3 to 10,000 and all N values from 1 to M-1.
 *
 * ALL combinations, whether explicitly described above or derivable
 * from the combination matrix, are covered by this specification
 * and protected under BUSL-1.1 until the Change Date.
 *
 * SCOPE OF PROTECTION:
 * This specification covers:
 * - Every named variant above (A1-A8, T1-T7, S1-S9, E1-E8, O1-O4,
 *   X1-X4, Y1-Y4, G1-G13)
 * - Every combination of the above variants
 * - Every pool size M from 3 to 10,000 assets
 * - Every pick count N from 1 to M-1
 * - Every asset class resolvable by oracle price feeds
 * - Every temporal resolution from 1 hour to 365 days
 * - All index products, data licensing, and derivative instruments
 *   based on prediction game resolution data
 * - The core primitive: "oracle-resolved, skill-based prediction
 *   competition with Eternal Seed capital retention"
 * - All future variants derivable from the categories and parameters
 *   documented herein
 *
 * Relationship to Eternal Seed (SeedEngine.sol):
 * - This specification extends the Eternal Seed primitive (BUSL-1.1,
 *   same Change Date) into the prediction game domain
 * - All 16 Seed variants can be combined with all Prediction Game variants
 * - Combined protection: SeedEngine x PredictionGameEngine
 * - Neither specification limits the other
 *
 * =============================================================================
 *                       IMPLEMENTATION NOTES
 * =============================================================================
 *
 * All variants share the core game engine interface:
 *
 * Core Functions:
 * - subscribe(): Enter the game
 * - submitPicks(): Submit predictions for current period
 * - resolveWeek(): Oracle-resolved draw execution
 * - claimPrize(): Winners claim their prizes
 * - claimOGEndgame(): Long-term players claim endgame share
 *
 * Oracle Integration:
 * - Chainlink Price Feeds: Asset performance data
 * - Chainlink Automation: Scheduled resolution triggers
 * - Chainlink Data Streams: Low-latency feeds (speed rounds)
 * - Chainlink CCIP: Cross-chain communication
 *
 * Yield Integration:
 * - Aave V3/V4: Primary yield source
 * - ERC-4626: Vault standard compatibility
 * - aaveEnabled toggle: Timelocked activation/deactivation
 *
 * Security:
 * - Eternal Seed retention on all variants
 * - Immutable prize rates and tier splits
 * - Timelocked feed updates (7-day public proposal)
 * - Dormancy mechanism for abandoned games
 * - Permissionless resolution fallback
 * - All security patterns from Crypto42 v1.8 apply
 *
 * =============================================================================
 *                       CONTACT AND LICENSING
 * =============================================================================
 *
 * DYBL Foundation
 *
 * Email: dybl7@proton.me
 * Twitter: @DYBL77
 * Discord: dybl777
 * GitHub: github.com/DYBL777
 *
 * Commercial licensing available before Change Date (10 May 2029).
 * After Change Date, all specifications convert to MIT license.
 *
 * Contact for partnership, integration, or licensing enquiries.
 *
 * =============================================================================
 */

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {SafeERC20} from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import {ReentrancyGuard} from "@openzeppelin/contracts/utils/ReentrancyGuard.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title IPredictionGame
 * @notice Core interface for all prediction game variants
 */
interface IPredictionGame {
    /// @notice Returns the number of assets in the pool (M)
    function getPoolSize() external view returns (uint256);

    /// @notice Returns the number of picks required (N)
    function getPickCount() external view returns (uint256);

    /// @notice Returns the draw cooldown period in seconds
    function getDrawCooldown() external view returns (uint256);

    /// @notice Returns whether the game is currently active
    function isActive() external view returns (bool);

    /// @notice Emitted when a draw is resolved
    event DrawResolved(
        uint256 indexed drawNumber,
        uint256 timestamp,
        uint256[] topPerformerIndices,
        int256[] allPerformances,
        uint256 totalPrizePool
    );

    /// @notice Emitted when a player submits picks
    event PicksSubmitted(
        address indexed player,
        uint256 indexed drawNumber,
        uint256[] picks
    );

    /// @notice Emitted when a prize is claimed
    event PrizeClaimed(
        address indexed player,
        uint256 indexed drawNumber,
        uint256 amount,
        uint256 tier
    );
}

/**
 * @title PredictionGameEngine
 * @notice Base implementation of the Prediction Game primitive
 * @dev This contract implements the core engine.
 *      All variants documented in NatSpec above.
 *      Crypto42 is the flagship implementation.
 */
contract PredictionGameEngine is IPredictionGame, ReentrancyGuard, Ownable {
    using SafeERC20 for IERC20;

    /*//////////////////////////////////////////////////////////////
                              STATE
    //////////////////////////////////////////////////////////////*/

    /// @notice The stablecoin used for entries and prizes
    IERC20 public immutable entryToken;

    /// @notice Number of assets in the pool (M)
    uint256 public immutable poolSize;

    /// @notice Number of picks per player (N)
    uint256 public immutable pickCount;

    /// @notice Time between draws in seconds
    uint256 public immutable drawCooldown;

    /// @notice Current draw number
    uint256 public currentDraw;

    /// @notice Timestamp of last completed draw
    uint256 public lastDrawTimestamp;

    /// @notice Entry fee per draw in token units
    uint256 public immutable entryFee;

    /*//////////////////////////////////////////////////////////////
                            CONSTANTS
    //////////////////////////////////////////////////////////////*/

    uint256 public constant BPS_DENOMINATOR = 10000;

    /*//////////////////////////////////////////////////////////////
                             ERRORS
    //////////////////////////////////////////////////////////////*/

    error InvalidPoolSize();
    error InvalidPickCount();
    error DrawNotReady();
    error InvalidPicks();
    error GameNotActive();

    /*//////////////////////////////////////////////////////////////
                           CONSTRUCTOR
    //////////////////////////////////////////////////////////////*/

    /**
     * @notice Initialises the PredictionGameEngine
     * @param _entryToken Stablecoin address (e.g., USDC)
     * @param _poolSize Number of tracked assets (M)
     * @param _pickCount Number of picks per player (N)
     * @param _drawCooldown Seconds between draws
     * @param _entryFee Entry fee in token units
     */
    constructor(
        address _entryToken,
        uint256 _poolSize,
        uint256 _pickCount,
        uint256 _drawCooldown,
        uint256 _entryFee
    ) Ownable(msg.sender) {
        if (_poolSize < 3) revert InvalidPoolSize();
        if (_pickCount < 1 || _pickCount >= _poolSize) revert InvalidPickCount();

        entryToken = IERC20(_entryToken);
        poolSize = _poolSize;
        pickCount = _pickCount;
        drawCooldown = _drawCooldown;
        entryFee = _entryFee;
        lastDrawTimestamp = block.timestamp;
    }

    /*//////////////////////////////////////////////////////////////
                          VIEW FUNCTIONS
    //////////////////////////////////////////////////////////////*/

    /// @inheritdoc IPredictionGame
    function getPoolSize() external view returns (uint256) {
        return poolSize;
    }

    /// @inheritdoc IPredictionGame
    function getPickCount() external view returns (uint256) {
        return pickCount;
    }

    /// @inheritdoc IPredictionGame
    function getDrawCooldown() external view returns (uint256) {
        return drawCooldown;
    }

    /// @inheritdoc IPredictionGame
    function isActive() external view returns (bool) {
        return true; // Override in derived contracts for lifecycle logic
    }
}
