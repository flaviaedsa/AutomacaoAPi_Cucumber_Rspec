

Dado("que me autentiquei na API de tarefas") do
    def login(email,password)
        @body = {
            session: {
                email: 'brunobatista66@gmail.com',
                password: '123456'
            }
        }.to_json
        @login = Login.post('/sessions', body: @body)
        puts @login.body
    end
end
  
Quando("cadastro uma tarefa") do
    
    def com sucesso
        @header = {
           'Content-Type': 'application/json',
            Accept: 'application/vnd.tasksmanager.v2',
            Authorization: @login.parsed_response['data']['attributes']['auth-token']
                
            }
                       
        @body = {
            task: {
            title: 'Tarefa teste5',
            description: 'Descrição da tarefa teste5',
            deadline: '2019-09-09 21:30:00',
            done: true
                 }
            }.to_json
            
        @tarefas = Cadastrar.post('/tasks', headers: @header, body: @body)
        puts @tarefas

    end
end
  
Entao("devo receber o retorno de tarefa cadastrada com sucesso") do
    expect(@tarefas.parsed_response['data']['attributes']['title']).to eql 'Tarefa teste5'
end
  
