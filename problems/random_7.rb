# using a random number generator that caps at 5, implement a function
# that returns a random number between 1 and 7.
def rand7()
  random_number = 0

  begin
    a = rand(5)
    b = rand(5)
    random_number = 5 * a + b
  end while random_number >= 21

  random_number % 7 + 1
end

