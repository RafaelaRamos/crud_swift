// CRUD de pessoas em memória.
// Armazenamento: dicionário com o nome como chave e [email, telefone, idade] como valor.

var pessoas: [String: [String]] = [:]

// Posições dos dados dentro do array de valores.
let idxEmail = 0
let idxTelefone = 1
let idxIdade = 2

// MARK: - Entrada

/// Imprime o prompt e devolve a linha digitada ("" no fim da entrada).
func lerTexto(_ prompt: String) -> String {
    print(prompt)
    return readLine() ?? ""
}

// MARK: - Operações

func incluirPessoa() {
    let nome = lerTexto("Digite o nome da pessoa:")

    if pessoas[nome] != nil {
        print("Já existe uma pessoa com esse nome.")
        return
    }

    let email = lerTexto("Digite o email da pessoa:")
    let telefone = lerTexto("Digite o telefone da pessoa:")
    let idade = lerTexto("Digite a idade da pessoa:")

    pessoas[nome] = [email, telefone, idade]
    print("Pessoa adicionada com sucesso!")
}

func alterarPessoa() {
    let nome = lerTexto("Digite o nome da pessoa que deseja alterar:")

    if pessoas[nome] == nil {
        print("Pessoa não encontrada.")
        return
    }

    let email = lerTexto("Digite o novo email da pessoa:")
    let telefone = lerTexto("Digite o novo telefone da pessoa:")
    let idade = lerTexto("Digite a nova idade da pessoa:")

    pessoas[nome] = [email, telefone, idade]
    print("Dados de \(nome) alterados com sucesso!")
}

func apagarPessoa() {
    let nome = lerTexto("Digite o nome da pessoa que deseja apagar:")

    if pessoas.removeValue(forKey: nome) == nil {
        print("Pessoa não encontrada.")
        return
    }

    print("Pessoa apagada com sucesso!")
}

func exibirPessoa() {
    let nome = lerTexto("Digite o nome da pessoa que deseja exibir:")

    guard let dados = pessoas[nome] else {
        print("Pessoa não encontrada.")
        return
    }

    print("Dados de \(nome):")
    print("Email: \(dados[idxEmail])")
    print("Telefone: \(dados[idxTelefone])")
    print("Idade: \(dados[idxIdade])")
}

func exibirTodasAsPessoas() {
    if pessoas.isEmpty {
        print("Nenhuma pessoa cadastrada.")
        return
    }

    print("Dados de todas as pessoas cadastradas:")
    for (nome, dados) in pessoas {
        print("Nome: \(nome)")
        print("Email: \(dados[idxEmail])")
        print("Telefone: \(dados[idxTelefone])")
        print("Idade: \(dados[idxIdade])")
    }
}

// MARK: - Menu

func exibirMenu() {
    print("Escolha uma opção:")
    print("1. Incluir dados de uma pessoa")
    print("2. Alterar dados de uma pessoa")
    print("3. Apagar dados de uma pessoa")
    print("4. Exibir dados de uma pessoa")
    print("5. Exibir dados de todas as pessoas")
    print("6. Finalizar o programa")
}

// MARK: - Programa principal

var executando = true

while executando {
    exibirMenu()
    let opcao = readLine() ?? ""

    switch opcao {
    case "1":
        incluirPessoa()
    case "2":
        alterarPessoa()
    case "3":
        apagarPessoa()
    case "4":
        exibirPessoa()
    case "5":
        exibirTodasAsPessoas()
    case "6":
        print("Programa finalizado.")
        executando = false
        continue
    default:
        print("Opção inválida.")
        continue
    }

    print(pessoas)
}
