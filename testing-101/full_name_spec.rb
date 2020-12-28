require_relative 'full_name'

describe '#full_name' do

  it 'takes 2 strings as inputs' do
    expect(method(:full_name).arity).to eq(2)
  end

  it 'returns a string' do
    expect(full_name('', '')).to be_a String
  end

  it 'returns nil if no argument is given' do
    expect(full_name(nil, nil)).to eq(nil)
  end

  it 'returns full name of a given first name and last name' do
    expect(full_name('Ayushi', 'Gupta')).to eq('Ayushi Gupta')
  end

  it 'returns the capitalized full name' do
    expect(full_name('ayushi', 'gupta')).to eq('Ayushi Gupta')
  end

  it 'returns the first name if first name or last name is missing' do
    expect(full_name('ayushi', nil)).to eq('Ayushi')
  end
end
