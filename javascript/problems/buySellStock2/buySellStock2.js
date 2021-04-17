function maxProfit(pricesList) {
  let profit = 0;

  for (let i = 0; i < pricesList.length; i += 1) {
    const curPrice = pricesList[i];
    const next = pricesList[i + 1];
    if (next > curPrice) {
      profit += next - curPrice;
    }
  }

  return profit;
}

module.exports = maxProfit;
