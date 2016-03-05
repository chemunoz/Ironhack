def shout method_name #recibe un parámetro y crea (define) el método shout_<parametro>
  define_method "shout_#{method_name}".to_sym do |param|
    self.send(method_name.to_sym, param).upcase
  end
end

class A
  shout :hi #Llama al método shout con el parametro hi
  def hi name
    "hi, #{name}!"
  end
end 


A.new.shout_hi("Fernando")