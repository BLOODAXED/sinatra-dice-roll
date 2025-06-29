require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  erb(:elephant)
end

get("/dice/2/6") do
  @roll = "2d6"
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die
	
  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
	
  erb(:dice_roll)
end

get("/dice/2/10") do
  @roll = "2d10"
  first_die = rand(1..10)
  second_die = rand(1..10)
  sum = first_die + second_die
	
  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
	
  erb(:dice_roll)
end

get("/dice/1/20") do
	@roll = "1d20"
  @outcome = "You rolled a #{rand(1...20)}."
	
  erb(:dice_roll)
end

get("/dice/5/4") do
  @roll = "5d4"
  first_die = rand(1..4)
  second_die = rand(1..6)
  third_die = rand(1..4)
  fourth_die = rand(1..4)
  fifth_die = rand(1..4)
  sum = first_die + second_die + third_die + fourth_die + fifth_die
	
  @outcome = "You rolled a #{first_die}, #{second_die}, #{third_die}, #{fourth_die}, and a #{fifth_die} for a total of #{sum}."
	
  erb(:dice_roll)
end
