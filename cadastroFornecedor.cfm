<cfcontent type="text/html; charset=UTF-8">
<cfset setEncoding("form", "utf-8")>
<cfset setEncoding("URL", "utf-8")>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Cadastro de Fornecedores</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body {
            background-color: #F3F4F6;
        }
        .container {
            max-width: 900px;
        }
        .card {
            border-radius: 8px;
        }
    </style>
</head>
<body>

<div class="container mt-5">
    <h2 class="text-primary text-center">Cadastro de Fornecedores</h2>

    <!-- Botões -->
    <div class="d-flex justify-content-between mb-3">
        <a href="index.cfm" class="btn btn-secondary">Voltar</a>
        <a href="add_fornecedor.cfm?add=1" class="btn btn-success">Adicionar Fornecedor</a>
    </div>

    <!-- Consulta de Fornecedores -->
    <cfquery name="getFornecedores" datasource="sistema_coldfision">
        SELECT * FROM fornecedores ORDER BY id DESC
    </cfquery>

    <!-- Tabela de Fornecedores -->
    <div class="table-responsive">
        <table class="table table-striped table-hover border rounded shadow">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Contato</th>
                    <th>Acoes</th>
                </tr>
            </thead>
            <tbody>
                <cfoutput query="getFornecedores">
                    <tr>
                        <td>#id#</td>
                        <td>#nome#</td>
                        <td>#contato#</td>
                        <td>
                            <a href="add_fornecedor.cfm?edit=1&id=#id#" class="btn btn-warning btn-sm">Editar</a>
                            <a href="delete_fornecedor.cfm?delete=1&id=#id#" class="btn btn-danger btn-sm" onclick="return confirm('Tem certeza que deseja excluir?')">Excluir</a>
                        </td>
                    </tr>
                </cfoutput>
            </tbody>
        </table>
    </div>
</div>