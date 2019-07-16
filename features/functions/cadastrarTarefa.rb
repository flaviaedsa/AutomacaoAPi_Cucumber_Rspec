def autenticacao
    endpoint = 'https://api-de-tarefas.herokuapp.com/sessions'

    @header = {
        Accept: 'application/vnd.tasksmanagers.v2',
                'Content-Type': 'application/json'
    }
  
    @body = {
        session: {
            email: 'brunobatista66@gmail.com',
            password: '123456'
        }
    }.to_json

    @chamada_autenticacao = HTTParty.post("#{endpoint}", headers: @header, body: @body)
    return @chamada_autenticacao['data']['attributes']['auth-token']

end

def cadastrarTarefa
    endpoint = 'https://api-de-tarefas.herokuapp.com/tasks'

    @header = {
        'Content-Type': 'application/json',
         Accept: 'application/vnd.tasksmanager.v2',
         Authorization: autenticacao
          
         }
                    
     @body = {
         task: {
         title: 'Tarefa teste5',
         description: 'Descrição da tarefa teste5',
         deadline: '2019-09-09 21:30:00',
         done: true
              }
         }.to_json
         
     return HTTParty.post("#{endpoint}", headers: @header, body: @body)
end