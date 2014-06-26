require 'jaccard.rb'

@ids = []
@parecidos = []
@producto = []

File.open('productos.txt', 'r') do |f|
  while linea = f.gets
    @producto.push(linea.split(" "))
  end
end

def principal
  interno = 0
  externo = 0  
  while externo < @producto.length
    while interno < @producto.length
        @co = Jaccard::coefficient(@producto[externo] , @producto[interno])
        if(@co > 0.2)
        @parecidos.push(@co)
        @ids.push(@producto[interno])
        end
      interno += 1
    end
    externo += 1
  end
  imprimir()
end


def imprimir
  contador = 0
  while contador < @ids.length
      print @parecidos[contador]
      print @ids[contador]
      contador += 1
  end
end   

principal()