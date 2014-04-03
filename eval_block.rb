def eval_block (*argu, &prc)
  return "NO BLOCK GIVEN!" if prc.nil?
  prc.call(argu)
end

p eval_block(1,2,3) { |num1, num2, num3| num1 + num2 + num3}