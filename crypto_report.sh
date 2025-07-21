#!/bin/bash

# Load .env
source "$(dirname "$0")/.env"

# API endpoint
API_URL="https://api.coingecko.com/api/v3"

# Get global data
GLOBAL=$(curl -s "$API_URL/global")
BTCD=$(echo "$GLOBAL" | jq '.data.market_cap_percentage.btc')

# Get coins list from .env
IFS=',' read -ra COIN_IDS <<< "$COINS"
IFS=',' read -ra SYMBOLS_ARR <<< "$SYMBOLS"

# Get market data
MARKET_DATA=$(curl -s "$API_URL/coins/markets?vs_currency=usd&ids=$COINS&price_change_percentage=24h,7d")

# Start message
MESSAGE="📊 <b>Crypto Market Update</b>"$'\n'

# Loop over each coin
for i in "${!COIN_IDS[@]}"; do
  ID="${COIN_IDS[$i]}"
  SYMBOL="${SYMBOLS_ARR[$i]}"
  NAME=$(echo "$MARKET_DATA" | jq -r ".[] | select(.id==\"$ID\") | .name")
  PRICE=$(echo "$MARKET_DATA" | jq ".[] | select(.id==\"$ID\") | .current_price")
  CHANGE_24H=$(echo "$MARKET_DATA" | jq ".[] | select(.id==\"$ID\") | .price_change_percentage_24h")
  CHANGE_7D=$(echo "$MARKET_DATA" | jq ".[] | select(.id==\"$ID\") | .price_change_percentage_7d_in_currency")

  # Emoji trend
  EMOJI_24H="📈"; [[ $(echo "$CHANGE_24H < 0" | bc -l) -eq 1 ]] && EMOJI_24H="📉"
  EMOJI_7D="📈"; [[ $(echo "$CHANGE_7D > 10" | bc -l) -eq 1 ]] && EMOJI_7D="🚀"
  [[ $(echo "$CHANGE_7D < 0" | bc -l) -eq 1 ]] && EMOJI_7D="📉"

  # Tambahkan ke pesan
  MESSAGE+=$'\n'"<b>${SYMBOL}</b> ${NAME}"
  MESSAGE+="::: 💰 \$$(printf '%.2f' "$PRICE")"
  MESSAGE+=$'\n'"$EMOJI_24H 24H: $(printf '%.2f' "$CHANGE_24H")%  |  $EMOJI_7D 7D: $(printf '%.2f' "$CHANGE_7D")%"$'\n'
done

# Tambahkan BTCD
MESSAGE+=$'\n'"🔥 <b>BTC Dominance:</b> $(printf '%.2f' "$BTCD")%"

# Kirim ke Telegram
curl -s -X POST "https://api.telegram.org/bot$BOT_TOKEN/sendMessage" \
  -d chat_id="$CHAT_ID" \
  -d text="$MESSAGE" \
  -d parse_mode="HTML" > /dev/null
