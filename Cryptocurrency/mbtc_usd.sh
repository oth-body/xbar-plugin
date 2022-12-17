#!/bin/bash

# Shows last BTC price formatted as mBTC(in USD) on Bitfinex BTCUSD Order Book.
#
# <xbar.title>mBTC price</xbar.title>
# <xbar.version>v1.0</xbar.version>
# <xbar.author>oth-body</xbar.author>
# <xbar.author.github>oth-body</xbar.author.github>
# <xbar.desc>Shows last BTC price formatted as mBTC(in USD) on Bitfinex BTCUSD Order Book.</xbar.desc>
# <xbar.image>http://i.imgur.com/AJU4wmc.png</xbar.image>
#
# by oth-body
# Based on Coinbase bitbar plugin by Mat Ryer and xbar plugin by Roberto Santacroce Martins
echo -n "m₿TC $"; curl -s "https://api.bitfinex.com/v1/pubticker/BTCUSD" | egrep -o '"last_price":"[0-9]+(\.)?([0-9]{0,2}")?' | sed 's/"last_price"://' | sed 's/\"//g' | awk '{printf "%.2f", $1/1000}'
