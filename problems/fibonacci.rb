def generate_fib_num_recursive(step)
  step < 2 ? step : generate_fib_num(step-1) + generate_fib_num(step - 2)
end

def generate_fib_num_iterative(step)
  return step if step < 2
  num1 = 0
  num2 = 1
  num3 = num1 + num2
  step.times do
    num1 = num2
    num2 = num3
    num3 = num1 + num2
    puts "num1: #{num1} - num2: #{num2} - num3: #{num3}"
  end
  num1
end

generate_fib_num_iterative(10)
generate_fib_num_recursive(10)

fibonacci_numbers = Hash.new do |hash,key|
  hash[key] = key < 2 ? key : hash[key - 1] + hash[key - 2]
end

fibonacci_numbers[10]
fibonacci_numbers[50]
fibonacci_numbers[100]
fibonacci_numbers[500]
fibonacci_numbers[1000]
fibonacci_numbers[3000]
