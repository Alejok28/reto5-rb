class Question
  attr_reader :num_question
  @@questions_txt = IO.readlines("questions.txt")

  def initialize(num_question)
    @num_question = num_question
  end

  def ask!
    ask = @@questions_txt[num_question]
  end

  def ans!
    answer = @@questions_txt[@num_question + 1]
  end
end

#
txt = IO.readlines("questions.txt")
# questions_array=[]
# answer_array=[]
# range = (0..txt.size)
# range.step(3){|x| questions_array << txt[x]}
# range2 = (1..txt.size)
# range2.step(3){|x| answer_array << txt[x]}
puts "Bienvenido a reto 5, Para jugar, solo ingresa el termino correcto para cada una de las definiciones, Listo? Vamos!"
puts

range = (0..txt.size)
actual_question = 0
attempts = 0
range.step(3) do
  p = Question.new(actual_question)
  puts "Pregunta:"
  puts p.ask!
  ans = p.ans!.chomp
  correct = false
  while correct == false
    print "Ingrese la Respuesta: "
    user_ans = gets.chomp
    if ans == user_ans
      puts "¡Correcto!"
      puts
      correct = true
    else
      puts "¡Incorrecto! Intenta de nuevo."
      puts
      correct = false
    end
    attempts += 1
  end
  actual_question += 3
end

puts "Felicitaciones!!! Has respondido correctamente las #{(txt.size + 1) / 3} preguntas en #{attempts} intentos"
puts
