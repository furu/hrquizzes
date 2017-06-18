def foo(a)
  a
    .map(&:to_i)
    .map.with_index { |v, k| [k, v] }
    .sort_by { |v| v[1] }
end

DATA = %w[100 230 456 231 678 789 309]

context 'quiz 0004' do
  describe 'foo' do
    it "indexes and sorts an array" do
      expect(
        foo(DATA)
      ).to eq([
        [0, 100], [1, 230], [3, 231], [6, 309], [2, 456], [4, 678], [5, 789]
      ])
    end
  end
end
