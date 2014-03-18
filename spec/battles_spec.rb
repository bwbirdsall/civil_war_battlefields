require 'rspec'
require 'pg'
require 'battles'

DB = PG.connect({:dbname => 'battles_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM battles *;")
  end
end

describe Battle do
  it 'is initialized with a place' do
    new_battle = Battle.new('Gettysburg')
    new_battle.should be_an_instance_of Battle
  end

  it 'tells you its place' do
    new_battle = Battle.new('Antietam')
    new_battle.place.should eq 'Antietam'
  end

  it 'is the same battle if it has the same place' do
    battle_1 = Battle.new('Antietam')
    battle_2 = Battle.new('Antietam')
    battle_1.should eq battle_2
  end

  it 'starts out with no battles' do
    Battle.all.should eq []
  end

  it 'lets you save a battle to the database' do
    new_battle = Battle.new('Antietam')
    new_battle.save
    Battle.all.should eq [new_battle]
  end

  it 'lets you set a state' do
    new_battle = Battle.new('Bull Run')
    new_battle.set_state('Virginia')
    new_battle.state.should eq 'Virginia'
  end

  it 'lets you set a confederate commander' do
    new_battle = Battle.new('Bull Run')
    new_battle.set_confederate_commander('P. G. T. Beauregard')
    new_battle.confederate_commander.should eq 'P. G. T. Beauregard'
  end

  it 'lets you set a union commander' do
    new_battle = Battle.new('Bull Run')
    new_battle.set_union_commander('Irvin McDowell')
    new_battle.union_commander.should eq 'Irvin McDowell'
  end

  it 'lets you set a winner' do
    new_battle = Battle.new('Bull Run')
    new_battle.set_winner('Confederate States of America')
    new_battle.winner.should eq 'Confederate States of America'
  end

  it 'lets you set casualties' do
    new_battle = Battle.new('Bull Run')
    new_battle.set_casualties(4872)
    new_battle.casualties.should eq 4872
  end

  it 'lets you set union force size' do
    new_battle = Battle.new('Bull Run')
    new_battle.set_union_force_size(31500)
    new_battle.union_force_size.should eq 31500
  end

  it 'lets you set confederate force size' do
    new_battle = Battle.new('Bull Run')
    new_battle.set_confederate_force_size(33000)
    new_battle.confederate_force_size.should eq 33000
  end

  it 'lets you set the starting date' do
    new_battle = Battle.new('Bull Run')
    new_battle.set_starting_date('07-21-1861')
    new_battle.starting_date.should eq '07-21-1861'
  end

  it 'lets you set the ending date' do
    new_battle = Battle.new('Bull Run')
    new_battle.set_ending_date('07-21-1861')
    new_battle.ending_date.should eq '07-21-1861'
  end
end
