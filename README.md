#Detecção de Objetos utilizando Keras-TF

## Passo de criaçao de um código para categorizar os objetos e marcar suas posições  
Foi utilizado Processing, devido à familiaridade com a ferramenta.  
Basta colocar todas as imagens na pasta ***images*** e abrir o arquivo.  
- Selecione o quadro que deseja marcar e digite a tecla para categorizá-lo  
- Botão **->** muda para próxima imagem  
- Botão **<-** muda para imagem anterior  

As categorias serão salvas no arquivo *"annotations.csv"* com os dados de cada linha separaos por *","*  
E veem no seguinte formato: *path, W, H, x0, y0, x1, y1, classe*  
