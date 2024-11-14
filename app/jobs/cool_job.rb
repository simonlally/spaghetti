class CoolJob < ApplicationJob
  def perform
    puts "Cool job!"
  end
end
