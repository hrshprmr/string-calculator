require './string_calculator'
RSpec.describe StringCalculator do
  describe '.add' do
    it 'returns 0 for an empty string' do
      expect(StringCalculator.add("")).to eq(0)
    end

    it 'returns the number itself when only one number is provided' do
      expect(StringCalculator.add("1")).to eq(1)
    end

    it 'returns sum of two numbers separated by a comma' do
      expect(StringCalculator.add("1,2")).to eq(3)
    end

    it 'returns sum of multiple numbers separated by commas' do
      expect(StringCalculator.add("1,2,3,4,5")).to eq(15)
    end

    it 'allows new lines as delimiters' do
      expect(StringCalculator.add("1\n2,3")).to eq(6)
    end

    it 'supports custom delimiters' do
      expect(StringCalculator.add("//;\n1;2")).to eq(3)
    end

    it 'raises an error for negative numbers' do
      expect { StringCalculator.add("1,-2,3,-4") }
        .to raise_error("negative numbers not allowed: -2,-4")
    end
  end
end