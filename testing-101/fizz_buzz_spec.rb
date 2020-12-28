require_relative 'fizz_buzz'

describe '#fizz_buzz' do
  it 'should take an integer as input' do
    expect(fizz_buzz).to receive(:number).with(an_instance_of(Integer))
  end

  it 'returns an array which contains a series of integer from 1 to the integer input' do

  end

  it 'multiple of 3 is replaced by "Fizz"' do
  
  end

  it 'multiple of 5 is replaced by "Buzz"' do

  end

  it 'any multiple of both 3 and 5 is replaced by "FizzBuzz"' do

  end
end