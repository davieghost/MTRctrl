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

led = Motor.new(pin: 9, board: board)

begin
  print "enter speed: "
  speed = gets.chomp.to_i
  led.a_w(speed)
end until speed == -1