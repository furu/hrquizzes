def foo(path)
  IO.readlines(path).reject { |line| line == "\n" }.last.strip
end

context 'quiz 0008' do
  describe 'foo' do
    it "returns the last significant line of a file" do
      expect(foo(__FILE__)).to eq('# DEADBEEF')
    end
  end
end

# DEADBEEF

