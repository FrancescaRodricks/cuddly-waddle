# Composite design pattern
# Component - the base class for all the objects - example here - Task Class
# Manufacture Cake
  # Make Cake -> Make Batter -> AddDryIngredients, AddLiquids, Mix
  #           -> Fill Pan
  #           -> Bake
  #           -> Frost
  # Package Cake -> Box, Label

class Task
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def get_time_required
    0.0
  end
end

class AddDryIngredientsTask < Task
  def initialize
    super('Add dry ingredients')
  end

  def get_time_required
    1.0
  end
end

class AddLiquidsTask < Task
  def initialize
    super('Add liquids')
  end

  def get_time_required
    2.0
  end

end

class MixTask < Task
  def initialize
    super('Mix')
  end

  def get_time_required
    3.0
  end
end

class CompositeTask < Task
  attr_accessor :subtasks

  def add_subtasks(task)
    subtasks.push(task)
  end

  def remove_subtask(task)
    subtasks.delete(task)
  end

  def get_time_required
    time = 0.0
    time += subtasks.map { |subtask| subtask.get_time_required }.reduce(:+)
  end
end

class MakeBatterTask < CompositeTask
  def initialize
    super('make batter')
    @subtasks = []
    add_subtasks(AddDryIngredientsTask.new)
    add_subtasks(AddLiquidsTask.new)
    add_subtasks(MixTask.new)
  end
end

p MakeBatterTask.new.get_time_required
