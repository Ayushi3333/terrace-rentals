require_relative 'greeting'

describe '#greeting' do
  it "returns 'Hello World'" do
    expect(greeting).to eq('Hello World')
  end
end
