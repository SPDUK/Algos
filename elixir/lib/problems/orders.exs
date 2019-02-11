defmodule Orders do
  # if the current order is in one of the rates that need to be adjusted, change the rate, else just add the total amount
  def get_order(orders, rates) do
    for [{_, _id}, {_, ship_to}, {_, net_amount}] = order <- orders do
      case Keyword.fetch(rates, ship_to) do
        {:ok, rate} -> Keyword.put(order, :total_amount, net_amount + rate * net_amount)
        :error -> Keyword.put(order, :total_amount, net_amount)
      end
    end
  end
end

book_orders = [
  [id: 123, ship_to: :NC, net_amount: 100.00],
  [id: 124, ship_to: :OK, net_amount: 35.50],
  [id: 125, ship_to: :TX, net_amount: 24.00],
  [id: 126, ship_to: :TX, net_amount: 44.80],
  [id: 127, ship_to: :NC, net_amount: 25.00],
  [id: 128, ship_to: :MA, net_amount: 10.00],
  [id: 129, ship_to: :CA, net_amount: 102.00],
  [id: 130, ship_to: :NC, net_amount: 50.00]
]

tax_rates = [NC: 0.075, TX: 0.08]

IO.inspect(Orders.get_order(book_orders, tax_rates))

# Write a function that takes both lists and returns a copy of the orders, but
# with an extra field, total_amount, which is the net plus sales tax. If a
# shipment is not to NC or TX, there’s no tax applied.

# [
#   [total_amount: 107.5, id: 123, ship_to: :NC, net_amount: 100.0],
#   [total_amount: 35.5, id: 124, ship_to: :OK, net_amount: 35.5],
#   [total_amount: 25.92, id: 125, ship_to: :TX, net_amount: 24.0],
#   [total_amount: 48.384, id: 126, ship_to: :TX, net_amount: 44.8],
#   [total_amount: 26.875, id: 127, ship_to: :NC, net_amount: 25.0],
#   [total_amount: 10.0, id: 128, ship_to: :MA, net_amount: 10.0],
#   [total_amount: 102.0, id: 129, ship_to: :CA, net_amount: 102.0],
#   [total_amount: 53.75, id: 130, ship_to: :NC, net_amount: 50.0]
# ]
