require 'faker'

puts "Choose a category"
puts "1. DC Comics"
puts "2. Games"
puts "3. Books"
choice = gets.chomp

word = ""

if choice == "1"
    word = Faker::DcComics.unique.hero.downcase.split("")

elsif choice == "2"
    word = Faker::Game.unique.title.downcase.split("")

elsif choice == "3"
    word = Faker::Book.unique.title.downcase.split("")
end

lives = 6
guesses = [" ", ":", "'", ",", "!"]

while lives > 0
    blanks = 0
    word.map do | letter |
        if guesses.include? letter
            print letter
        else
            print "_ "
            blanks += 1
        end
    end
    puts ""

    if blanks == 0
        puts("YOU WIN!")
        break
    end
    
    puts "Guess a letter"
    guess = gets.chomp.downcase
    if guesses.include? guess
        puts "You already guessed that letter"
    else
        guesses << guess
        if !word.include? guess
            lives -= 1
            puts "You have #{lives} lives remaining"
        end
    end

    if lives == 0
        puts "YOU LOSE"
        puts "The word was #{word.join("")}"
    end

end