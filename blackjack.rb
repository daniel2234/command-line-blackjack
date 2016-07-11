# make a command line blackjack game

def calculate_total(cards) #[[],[]]
  arr = cards.map { |e| e[1]  }

  total = 0
  arr.each do |value|
    if value == "A"
      total += 11
    elsif value.to_i == 0
      total += 10
    else
      total += value.to_i
    end
  end
  arr.select{|e| e == "A"}.count.times do
    total -= 10 if total > 21
  end

  total
end

puts "Welcome to Blackjack!"

#Show cards
suits = ['H', 'D', 'S', 'C']
cards = ['2','3','4','5','6','7','8','9','10','J','Q','K','A']

deck = suits.product(cards)
deck.shuffle!

#Deal Cards
myCards = []
dealerCards = []

myCards << deck.pop
dealerCards << deck.pop
myCards << deck.pop
dealerCards << deck.pop

dealerTotal = calculate_total(dealerCards)
myTotal = calculate_total(myCards)

#show cards

puts "Dealer has #{dealerCards[0]} and #{dealerCards[0]}, for a total of #{dealerTotal}"
puts "You have: #{myCards[0]} and #{myCards[1]}, for a total of: #{myTotal}"
puts ""

#Player turn
if myTotal == 21
  puts "Congratulations, you hit blackjack! You win!"
  exit
end

while myTotal < 21
  puts "What would you like to say? 1) Hit or 2) Stay"
  hit_or_stay = gets.chomp

  if !['1', '2'].include?(hit_or_stay)
    puts "Error: you must enter 1 or 2"
    next
  end

  if hit_or_stay == "2"
    puts "You chose to stay."
    break
  end

  new_card = deck.pop
  puts "Dealing card to player: #{new_card}"
  myCards << new_card
  myTotal = calculate_total(myCards)
  puts "Your total is now: #{myTotal}"

  if myTotal == 21
    puts "Congratulations, you hit blackjack, You win!"
    exit
  elsif myTotal > 21
    puts "Sorry, it looks like you busted"
    exit
  end
end

if dealerTotal == 21
    puts "Sorry, dealer hit blackjack, You lose."
    exit
end

while dealerTotal < 17
    #hit
  new_card = deck.pop
  puts "Dealing new card for dealer"
  dealerCards << new_card
  dealerTotal = calculate_total(dealerCards)
  puts "Dealer total is now : #{dealerTotal}"

  if dealerTotal == 21
    puts "Sorry, dealer hit blackjack, You lose."
    exit
  elsif dealerTotal > 21
    puts "Congratulations, dealer busted, You win."
    exit
  end
end

# Compare hands
puts "Dealer cards: "
dealerCards.each do |card|
  puts "=> #{card}"
end
puts ""

puts "Your cards:"
myCards.each do |card|
  puts "=> #{card}"
end

puts ""

if dealerTotal > myTotal
  puts "Sorry dealer won"
elsif dealerTotal < myTotal
  puts "Congratulations, you win"
else
  puts "Its a tie."
end
  








