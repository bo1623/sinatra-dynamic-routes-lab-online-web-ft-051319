require_relative 'config/environment'
require "pry"

class App < Sinatra::Base

  get '/reversename/:name' do
    @name = params[:name]
    "#{@name.reverse}"
  end

  get '/square/:number' do
    @number = params[:number].to_i
    "#{@number**2}"
  end


  get '/say/:word1/:word2/:word3/:word4/:word5' do
    "#{[params[:word1],params[:word2],params[:word3],params[:word4],params[:word5]].join(" ")}."
  end

  get '/say/:number/:phrase' do
    @number = params[:number].to_i
    @phrase = params[:phrase]
    array = Array.new(@number,@phrase) #forming an array with n times of the phrase
    "#{array.join("\n")}" #printing out the array constituents joined by new line
    # @number.times do
    #   @phrase
    # end #why does this result in an error
  end

  get '/:operation/:number1/:number2' do
    @operation = params[:operation]
    @number1 = params[:number1].to_i
    @number2 = params[:number2].to_i
    case @operation
    when "add"
      ans = @number1+@number2
    when "multiply"
      ans = @number1*@number2
    when "divide"
      ans = @number1/@number2
    when "subtract"
      ans = @number1-@number2
    end

    "#{ans}"

  end

end
