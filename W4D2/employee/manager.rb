require_relative './employee.rb'

class Manager < Employee
    attr_accessor :employees
    def initialize(name, salary, title, boss=nil)
        @employees = [] 
        super 
    end

    def bonus(multiplier)
        get_total(multiplier) * multiplier
    end

    def get_total(multiplier)
        total = 0
        employees.each do |emp|
            if emp.instance_of?(Manager)
                total += (emp.get_total(multiplier) + emp.salary) * multiplier
            else
                total += emp.salary
            end
        end
        total 
    end
end 

ned = Manager.new("Ned", 1_000_000, "Founder")
darren = Manager.new("Darren", 78_000, "TA Manager", ned)
shawna = Employee.new("Shawna", 12_000, "TA", darren)
david = Employee.new("David", 10_000, "TA", darren)

p ned.get_total(5)
p david.bonus(3)
p darren.bonus(4)
