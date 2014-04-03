
def make_change(amount, coins)
  return [] if amount == 0
  best_current = nil
  coins.sort.map do |coin_value|
    next if coin_value > amount
    break if amount < coins.first && amount > 0
    new_way_of_making_change = make_change(amount-coin_value, coins)
    best_current = new_way_of_making_change if best_current.nil?
    if best_current.length > new_way_of_making_change.length
      best_current = new_way_of_making_change
    end
  end
  best_current
end


p make_change(15, [4, 5, 6])
