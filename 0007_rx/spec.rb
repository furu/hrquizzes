require 'tapp'

def foo(text)
  text
    .split
    .map { |e| e.sub(/(\.|,|:|\?|'s)$/, '') }
    .uniq
    .sort
    .map { |e| [e, e.size] }
    .sort_by(&:last)
    .reverse
    .take(5)
    .map(&:first)
end

context 'quiz 0007' do
  describe 'foo' do
    it "returns the five longest words" do
      expect(
        foo(%{
          Sing, O goddess, the anger of Achilles son of Peleus, that brought
          countless ills upon the Achaeans. Many a brave soul did it send
          hurrying down to Hades, and many a hero did it yield a prey to dogs
          and vultures, for so were the counsels of Jove fulfilled from the day
          on which the son of Atreus, king of men, and great Achilles, first
          fell out with one another.

          And which of the gods was it that set them on to quarrel? It was the
          son of Jove and Leto; for he was angry with the king and sent a
          pestilence upon the host to plague the people, because the son of
          Atreus had dishonoured Chryses his priest. Now Chryses had come to
          the ships of the Achaeans to free his daughter, and had brought with
          him a great ransom: moreover he bore in his hand the sceptre of
          Apollo wreathed with a suppliant's wreath and he besought the
          Achaeans, but most of all the two sons of Atreus, who were their
          chiefs.
        })
      ).to eq(%w[
        dishonoured pestilence suppliant countless fulfilled
      ])
    end
  end
end
