class RoomsController < ApplicationController
  def show
    @messages = Message.all
    Thread.new() {
      File.open('log/development.log') do |log|
        log.extend(File::Tail)
        log.interval = 1
        log.backward(10)
        log.tail { |line| Message.create! contect: line }
        # log.tail { |line| p 'logger:' + line}
      end
    }
      
  end

 
end
