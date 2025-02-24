Um simples CRUD em produtos e Fornecedor em Adobe ColdFusion V7.

<!--- Script de criar tabela fornecedores --->

CREATE TABLE fornecedores (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    contato VARCHAR(255) NULL
);
<!--- Script de criar tabela produtos --->
CREATE TABLE produtos (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    fornecedor_id INT NOT NULL,
    FOREIGN KEY (fornecedor_id) REFERENCES fornecedores(id) ON DELETE CASCADE
);

