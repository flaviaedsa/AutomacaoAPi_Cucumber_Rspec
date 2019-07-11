#language: pt

Funcionalidade: Cadastrar tarefa
-Como aplicação
-Quero cadastrar uma tarefa 
-Para ter acesso a vincular uma nova tarefa cadastrada a um contato qualquer

    Contexto:
    Dado que me autentiquei na API de tarefas

    Cenario: Tarefa cadastrada com sucesso
    Quando cadastro uma tarefa
    Entao devo receber o retorno de tarefa cadastrada com sucesso