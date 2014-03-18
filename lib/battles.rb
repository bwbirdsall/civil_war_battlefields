class Battle

  attr_reader :state, :confederate_commander, :union_commander, :winner, :casualties, :union_force_size, :confederate_force_size, :starting_date, :ending_date

  def initialize(name)
    @place = name
    @state = ""
    @confederate_commander = ""
    @union_commander = ""
    @winner = ""
    @casualties = 0
    @union_force_size = 0
    @confederate_force_size = 0
    @starting_date = "04-21-1865"
    @ending_date = "04-21-1865"
  end

  def place
    @place
  end

  def ==(another_place)
    self.place == another_place.place
  end

  def self.all
    results = DB.exec("SELECT * FROM battles;")
    battles = []

    results.each do |battle|
      place = battle['place']
      state = battle['state']
      confederate_commander = battle['confederate_commander']
      union_commander = battle['union_commander']
      winner = battle['winner']
      casualties = battle['casualties']
      union_force_size = battle['union_force_size']
      confederate_force_size = battle['confederate_force_size']
      starting_date = battle['starting_date']
      ending_date = battle['ending_date']
      temp_battle = Battle.new(place)
      temp_battle.set_state(state)
      temp_battle.set_confederate_commander(confederate_commander)
      temp_battle.set_union_commander(union_commander)
      temp_battle.set_winner(winner)
      temp_battle.set_casualties(casualties)
      temp_battle.set_union_force_size(union_force_size)
      temp_battle.set_confederate_force_size(confederate_force_size)
      temp_battle.set_starting_date(starting_date)
      temp_battle.set_ending_date(ending_date)
      battles << temp_battle
    end
    battles
  end

  def set_state(state)
    @state = state
  end

  def set_confederate_commander(confederate_commander)
    @confederate_commander = confederate_commander
  end

  def set_union_commander(union_commander)
    @union_commander = union_commander
  end

  def set_winner(winner)
    @winner = winner
  end

  def set_casualties(casualties)
    @casualties = casualties
  end

  def set_union_force_size(union_force_size)
    @union_force_size = union_force_size
  end

  def set_confederate_force_size(confederate_force_size)
    @confederate_force_size = confederate_force_size
  end

  def set_starting_date(starting_date)
    @starting_date = starting_date
  end

  def set_ending_date(ending_date)
    @ending_date = ending_date
  end

  def save
    DB.exec("INSERT INTO battles (place, state, confederate_commander, union_commander, winner, casualties, union_force_size, confederate_force_size, starting_date, ending_date) VALUES ('#{(@place)}', '#{@state}', '#{@confederate_commander}', '#{@union_commander}', '#{@winner}', #{@casualties}, #{@union_force_size}, #{@confederate_force_size}, '#{@starting_date}', '#{@ending_date}');")
  end
end
