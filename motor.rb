# dino_sample.rb
 
require 'dino'
 
board = Dino::Board.new(Dino::TxRx.new)

class Motor < Dino::Components::BaseComponent

  def d_w(pin=self.pin, value)
    self.board.digital_write(pin, value)
  end

  def a_w(pin=self.pin, value)
    self.board.analog_write(pin, value)
  end

  def s_p_m(pin=self.pin, mode)
    self.board.set_pin_mode(pin, mode, pullup)
  end

end

motor1 = Motor.new(pin: 9, board: board)
motor2 = Motor.new(pin: 10, board: board)


begin
  print "enter speed: "
  speed = gets.chomp.to_i
  motor1.a_w(speed)
  motor2.a_w(speed)
end until speed == -1