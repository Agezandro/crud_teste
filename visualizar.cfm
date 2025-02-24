<cfcontent type="text/html; charset=UTF-8">
<cfset setEncoding("form", "utf-8")>
<cfset setEncoding("URL", "utf-8")>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Produtos</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #F3F4F6;
            color: #333;
        }
        .container {
            max-width: 900px;
        }
        .header {
            background-color: #1E3A8A;
            color: white;
            padding: 30px 0;
            text-align: center;
            border-radius: 8px;
            margin-bottom: 20px;
        }
        .table {
            background: white;
            border-radius: 8px;
            overflow: hidden;
        }
        .table th {
            background-color: #1E3A8A;
            color: white;
        }
        .table-hover tbody tr:hover {
            background-color: #E0F2FE;
        }
        .btn {
            border-radius: 6px;
        }
        .action-buttons {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>

    <cfquery name="getProdutos" datasource="sistema_coldfision">
        SELECT * FROM produtos ORDER BY id DESC
    </cfquery>

    <div class="container mt-5">
        <div class="header">
            <h2>Lista de Produtos</h2>
        </div>

        <div class="action-buttons">
            <a href="index.cfm" class="btn btn-secondary">
                <i class="bi bi-arrow-left"></i> Voltar para o Inicio
            </a>
            <div>
                <a href="add.cfm" class="btn btn-primary"><i class="bi bi-plus-lg"></i> Adicionar Produto</a>
                <a href="gerar_relatorio_pdf.cfm" class="btn btn-info"><i class="bi bi-file-earmark-pdf"></i> Gerar Relatorio PDF</a>
            </div>
        </div>

        <div class="table-responsive">
            <table class="table table-striped table-hover border shadow-sm">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nome</th>
                        <th>Descricao</th>
                        <th>Valor</th>
                        <th class="text-center">Acaes</th>
                    </tr>
                </thead>
                <tbody>
                    <cfoutput query="getProdutos">
                        <tr>
                            <td>#id#</td>
                            <td>#nome#</td>
                            <td>#descricao#</td>
                            <td>R$ #valor#</td>
                            <td class="text-center">
                                <a href="edit.cfm?id=#id#" class="btn btn-warning btn-sm"><i class="bi bi-pencil"></i> Editar</a>
                                <a href="delete.cfm?id=#id#" class="btn btn-danger btn-sm" onclick="return confirm('Tem certeza que deseja excluir?')">
                                    <i class="bi bi-trash"></i> Excluir
                                </a>
                            </td>
                        </tr>
                    </cfoutput>
                </tbody>
            </table>
        </div>
    </div>

</body>
</html>
