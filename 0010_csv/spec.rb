def foo(a)
  a.map { |r|
    r
      .map(&:to_s)
      .map { |f| f.include?('"') ? f.gsub('"', '""') : f }
      .map { |f| f.match(/(,|\n|")/) ? "\"#{f}\"" : f }
  }.map { |r| r.join(',') }.join("\n")
end

context 'quiz 0010' do
  describe 'foo' do
    it "turns an array into a CSV string" do
      expect(
        foo [
          ['basset cafe', 'koi naka, hiroshima-shi', 7],
          ["shake-hands", 'kamiyachou, hiroshima-shi', 6]
        ]
      ).to eq(%q{
basset cafe,"koi naka, hiroshima-shi",7
shake-hands,"kamiyachou, hiroshima-shi",6
      }.strip)
    end
  end
end
