#!/usr/bin/env bash

# Shows most recent BTC price formatted as mBTC (0.001 BTC) with information pulled from Bitfinex BTCUSD Order Book.
#
# <xbar.title>mBTC price</xbar.title>
# <xbar.version>v1.0</xbar.version>
# <xbar.author>oth-body</xbar.author>
# <xbar.author.github>oth-body</xbar.author.github>
# <xbar.desc>Shows last BTC price formatted as mBTC. Easier to see signal for the average person.</xbar.desc>
#
# by oth-body
# Based on xbar plugin by Roberto Santacroce Martins
echo -n "mBTC $"; curl -s "https://api.bitfinex.com/v1/pubticker/BTCUSD" | egrep -o '"last_price":"[0-9]+(\.)?([0-9]{0,2}")?' | sed 's/"last_price"://' | sed 's/\"//g' | awk '{printf "%.2f", $1/1000}'
