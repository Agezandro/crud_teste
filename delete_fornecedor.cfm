<cfcontent type="text/html; charset=UTF-8">
<cfset setEncoding("form", "utf-8")>
<cfset setEncoding("URL", "utf-8")>
<cfparam name="url.id" type="numeric">

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Excluir Produto</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body {
            background-color: #F3F4F6;
            font-family: Arial, sans-serif;
        }
        .container {
            max-width: 500px;
        }
        .card {
            border-radius: 8px;
        }
    </style>
</head>
<body>

    <div class="container mt-5">
        <div class="card p-4 shadow-lg text-center">
            <h2 class="text-danger">Excluindo Fornecedor...</h2>

            <cfquery datasource="sistema_coldfision">
                DELETE FROM fornecedores WHERE id = <cfqueryparam value="#url.id#" cfsqltype="cf_sql_integer">
            </cfquery>

            <p class="text-success mt-3">Fornecedor excluido com sucesso!</p>
            <a href="cadastroFornecedor.cfm" class="btn btn-secondary mt-2">Voltar</a>
        </div>
    </div>

    <script>
        setTimeout(function() {
            window.location.href = 'cadastroFornecedor.cfm';
        }, 2000);
    </script>

</body>
</html>
