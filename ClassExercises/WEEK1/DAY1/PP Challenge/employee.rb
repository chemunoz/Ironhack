
class Employee
    attr_reader :name, :email
    def initialize(name, email)
      @name = name
      @email = email
    end
end




class HourlyEmployee < Employee
    def initialize(name, email, hourly_rate, hours_worked)
        super(name, email)
        @hourly_rate = hourly_rate
        @hours_worked = hours_worked
        @array_hourly=[]
    end

    def calculate_salary
      #returns the hours worked * hourly_rate
      #EN CADA TIPO HAY QUE CREAR UN ARRAY QUE VAYA ALMACENANDO LOS EMPLEADOS DE CADA TIPO
    end
end

class SalariedEmployee < Employee
    def initialize(name, email, hourly_rate, hours_worked)
        @name = name
        @email = email
        @hourly_rate = hourly_rate
        @hours_worked = hours_worked
        @array_hourly=[]
    end

    def calculate_salary
      #returns the hours worked * hourly_rate
      #EN CADA TIPO HAY QUE CREAR UN ARRAY QUE VAYA ALMACENANDO LOS EMPLEADOS DE CADA TIPO
    end
end


class MultipaymentEmployee < Employee
    def initialize(name, email, hourly_rate, hours_worked)
        @name = name
        @email = email
        @hourly_rate = hourly_rate
        @hours_worked = hours_worked
        @array_hourly=[]
    end

    def calculate_salary
      #returns the hours worked * hourly_rate
      #EN CADA TIPO HAY QUE CREAR UN ARRAY QUE VAYA ALMACENANDO LOS EMPLEADOS DE CADA TIPO
    end
end






class Payroll
    def initialize(employees)
      @employees = employees
      @total_hourly = 0
      @total_salaried = 0
      @total_multipayment = 0
      @array 
  	end

  def notify_employee(employee)
          #email them
  end

  def pay_employees
      # Should output how much we're paying each employee for this week and the total amount spent on payroll this week. 
      #CREAR ARRAY que almacene tipo de empleado y datos

      @array_hourly.each do |emp|
      	@total_hourly += emp.calculate_salary
      	puts "EMPLOYEE: #{emp.name}"
      	puts "EMAIL: #{emp.email}"
      	puts "SALARY: #{emp.calculate_salary}"
      	puts "--------------------------------"
	  end

	   @array_salaried.each do |emp|
      	@total_salaried += emp.calculate_salary
      	puts "EMPLOYEE: #{emp.name}"
      	puts "EMAIL: #{emp.email}"
      	puts "SALARY: #{emp.calculate_salary}"
      	puts "--------------------------------"
	  end

	   @array_multipayment.each do |emp|
      	@total_multipayment += emp.calculate_salary
      	puts "EMPLOYEE: #{emp.name}"
      	puts "EMAIL: #{emp.email}"
      	puts "SALARY: #{emp.calculate_salary}"
      	puts "--------------------------------"
	  end

	  puts "TOTAL EMPLOYEES: #{@total_hourly}"

  end
end

josh = HourlyEmployee.new('Josh', 'nachoemail@example.com', 35, 50)
nizar = SalariedEmployee.new('Nizar', 'starcraftrulez@gmail.com', 1000000)
ted = MultiPaymentEmployee.new('Ted', 'fortranr0x@gmail.com', 60000, 275, 55)



