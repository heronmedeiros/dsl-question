class Questao

  #@@gabarito = []

  def initialize(titulo, &bloco)
    @titulo = titulo
    @dados = {
    :item =>[],
    :resposta => nil
    }
    @mostrar= []
    @chars = ('a'..'z').to_a
    instance_eval(&bloco)
end
  
  def item it
    @dados[:item] << it
  end

  def resposta resp
    @dados[:resposta] = resp
  end
  
  def add_resposta_itens
    @dados[:item] << @dados[:resposta]
  end
  
  def  embaralha_itens
    @dados[:item].shuffle!
  end

  def letras_itens
    leng = @dados[:item].size 
    letras = @chars[0,leng]
    0.upto(leng-1) do |l|
      @mostrar  <<  "#{@chars[l]} - #{@dados[:item][l]}" 
    end
  end

  def ordem
    add_resposta_itens
     embaralha_itens
    letras_itens
  end

  def to_s
   <<-QUESTAO 
\n
Questao: #{@titulo}
\n 
#{@mostrar.join("\n")}
\n
    QUESTAO
  end
end

alias :imprima print

def questao(nome, &bloco)
  Questao.new(nome, &bloco)
end


questao_simples = questao  "Quanto eh 2 + 2? Responda se for capaz." do 
  item  1
  item  2
  item  3
  resposta 4
  ordem
 end

imprima questao_simples
