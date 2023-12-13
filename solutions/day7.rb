class Day7
  CARD_VALUES = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "T", "J", "Q", "K", "A"]

  Hand = Struct.new(:cards) do
    def hand_type
      type_value = case cards.split("").uniq.length
      when 5
        0 # high card
      when 4
        1 # one pair
      when 3
        # 3 of a kind or two pairs
        cards.split("").uniq.map { |c| cards.count(c) }.count(3) == 1 ? 3 : 2
      when 2
        # 4 of a kind or a full house
        cards.split("").uniq.map { |c| cards.count(c) }.count(4) == 1 ? 5 : 4
      when 1
        6 # five of a kind
      else
        -1
      end
    end
  end

  def process(input)
    hand_lines = input.split("\n")

    hands = hand_lines.map do |l|
      arr = l.split(" ")

      [Hand.new(arr[0]), arr[1].to_i]
    end
    # puts hands.inspect

    hands.sort! do |hand1, hand2|
      if hand1[0].hand_type == hand2[0].hand_type
        stronger(hand1[0], hand2[0]) ? 1 : -1
      else
        hand1[0].hand_type <=> hand2[0].hand_type
      end
    end
    # puts hands.inspect

    winnings = 0
    hands.each.with_index do |hand, ind|
      # puts "#{hand[1].to_i} * #{(ind + 1)}"
      winnings += hand[1].to_i * (ind + 1)
    end

    winnings
  end

  def stronger(hand1, hand2)
    hand1a = hand1.cards.split("")
    hand2a = hand2.cards.split("")

    return hand1a.each.with_index do |c, i|
      if CARD_VALUES.find_index(c) == CARD_VALUES.find_index(hand2a[i])
        # puts "#{c} = #{hand2a[i]}"
        next
      end

      if CARD_VALUES.find_index(c) > CARD_VALUES.find_index(hand2a[i])
        # puts "#{c} > #{hand2a[i]}"
        return true
      elsif CARD_VALUES.find_index(c) < CARD_VALUES.find_index(hand2a[i])
        # puts "#{c} < #{hand2a[i]}"
        return false
      end
    end
  end
end