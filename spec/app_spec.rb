# Informations de configuration
require_relative '../lib/player.rb'

describe "the initialize function" do
  # let(player1 = Player.new("Josiane")) 
  # let(:name = "José")

  it "check the name of the robot fighter" do
    expect(initialize("Josiane")).to eq("Josiane")
  end

end