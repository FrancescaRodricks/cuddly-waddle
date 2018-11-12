# Observer Design Pattern

class Employee
  attr_accessor :name, :title, :salary
  def initialize(name, title, salary)
    @name = name
    @title = title
    @salary = salary
  end
end

# since salary field is accessible via attr_accessor we can now update the salary for an employee

employee = Employee.new('John', 'Developer', 1000)

employee.salary = 1500

# need to keep the payroll department aware of salary changes

class Payroll
  def update(changed_employee)
    puts "#{changed_employee.name}"
    puts "salary is now #{changed_employee.salary}"
    puts "\n"
  end
end

payroll = Payroll.new
payroll.update(employee)

class Employee
  attr_reader :salary
  attr_accessor :name, :title

  def initialize(name, title, salary, payroll)
    @name = name
    @title = title
    @salary = salary
    @payroll = payroll
  end

  def salary= salary
    @salary = salary
    @payroll.update(self)
  end
end

# since salary field is accessible via attr_accessor we can now update the salary for an employee

employee = Employee.new('Doe', 'Engineer', 1000, Payroll.new)

employee.salary = 1200

# how can we separate out the things that are changing
# who gets the news about salary change ?

class Employee
  attr_reader :salary
  attr_accessor :name, :title, :observers

  def initialize(name, title, salary)
    @name = name
    @title = title
    @salary = salary
    @observers = []
  end

  def salary= salary
    @salary = salary
    notify_observers
  end

  def notify_observers
    @observers.each do |observer|
      observer.update(self)
    end
  end

  def add_observer(observer)
    @observers << observer
  end

  def delete_observer(observer)
    @observers.delete(observer)
  end
end

employee = Employee.new('Jack', 'Support', 1000)
employee.observers <<  Payroll.new
employee.salary = 1100

class TaxMan
  def update(changed_employee)
    puts "send #{changed_employee.name} a new tax bill"
  end
end

employee.add_observer(TaxMan.new)

employee.salary = 1200

# factoring out the observable support

class Subject
  attr_accessor :observers
  def initialize
    @observers = []
  end

  def add_observer(observer)
    observers.push(observer)
  end

  def delete_observer(observer)
    observers.delete(observer)
  end

  def notify_observers
    @observers.each { |observer| observer.update(self) }
  end
end

class Employee2 < Subject
  attr_accessor :name, :title
  def initialize(name, title, salary)
    super()
    @name = name
    @title = title
    @salary = salary
  end

  def salary= salary
    @salary = salary
    notify_observers
  end
end

employee = Employee2.new('Subject', 'SubjectObserverClass', 500)
employee.add_observer(TaxMan.new)
employee.salary = 300

