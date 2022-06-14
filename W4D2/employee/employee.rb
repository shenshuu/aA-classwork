class Employee 
    def initialize(name, salary, title, boss=nil)
        @name = name 
        @salary = salary
        @title = title 
        @boss = boss 
        boss.employees << self if !boss.nil?
    end

    def bonus(multiplier)
        salary * multiplier
    end

    protected
    attr_reader :salary

end