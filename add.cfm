<cfcontent type="text/html; charset=UTF-8">
<cfset setEncoding("form", "utf-8")>
<cfset setEncoding("URL", "utf-8")>

<cfif structKeyExists(form, "submit")>
    <cfquery datasource="sistema_coldfision">
        INSERT INTO produtos (nome, descricao, valor)
        VALUES (
            <cfqueryparam value="#form.nome#" cfsqltype="cf_sql_varchar">,
            <cfqueryparam value="#form.descricao#" cfsqltype="cf_sql_longvarchar">,
            <cfqueryparam value="#form.valor#" cfsqltype="cf_sql_decimal">
        )
    </cfquery>
    <cflocation url="visualizar.cfm" addtoken="false">
</cfif>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Adicionar Produto</title>
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
            max-width: 600px;
        }
        .header {
            background-color: #1E3A8A;
            color: white;
            padding: 20px;
            text-align: center;
            border-radius: 8px;
            margin-bottom: 20px;
        }
        .card {
            border-radius: 8px;
        }
        .btn {
            border-radius: 6px;
        }
    </style>
</head>
<body>

    <div class="container mt-5">
        <div class="header">
            <h2>Adicionar Produto</h2>
        </div>

        <div class="card p-4 shadow-lg">
            <form method="post">
                <div class="mb-3">
                    <label class="form-label">Nome</label>
                    <input type="text" name="nome" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Descricao</label>
                    <textarea name="descricao" class="form-control"></textarea>
                </div>
                <div class="mb-3">
                    <label class="form-label">Valor</label>
                    <input type="number" name="valor" class="form-control" step="0.01" required>
                </div>

                <div class="d-flex justify-content-between">
                    <a href="index.cfm" class="btn btn-secondary">
                        <i class="bi bi-arrow-left"></i> Voltar para o Inicio
                    </a>
                    <button type="submit" name="submit" class="btn btn-success">
                        <i class="bi bi-save"></i> Salvar
                    </button>
                </div>
            </form>
        </div>
    </div>

</body>
</html>
