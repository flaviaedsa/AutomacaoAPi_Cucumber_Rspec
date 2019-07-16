
Dado("que me autentiquei na API de tarefas") do
    @login = autenticacao
end
  
Quando("cadastro uma tarefa") do
    @tarefa = cadastrarTarefa
end
  
Entao("devo receber o retorno de tarefa cadastrada com sucesso") do
    expect(@tarefa.code).to eql 201
end
  
