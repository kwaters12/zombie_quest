class ZombiesController < ApplicationController
  def new
    @zombie = Zombie.new
  end
  def create 
    @zombie = Zombie.new zombie_params
    @weapon1 = @zombie.weapons.new
    @weapon2 = @zombie.weapons.new
    @zombie.save
  end

  private

  def zombie_params
    params.require(:zombie).permit([:name, :iq, :vegetarian, :hungry])
  end
end
