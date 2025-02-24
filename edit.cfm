<cfquery datasource="sistema_coldfision" name="query">
    SELECT nome, descricao, valor
    FROM produtos
    WHERE id = <cfqueryparam value="#url.id#" cfsqltype="cf_sql_integer">
</cfquery>

<cfif query.recordCount gt 0>
    <cfset nome = query.nome>
    <cfset descricao = query.descricao>
    <cfset valor = query.valor>
<cfelse>
    <cfset nome = "">
    <cfset descricao = "">
    <cfset valor = "">
</cfif>

<!--- Verificar se o formulário foi enviado --->  
<cfif structKeyExists(form, "submit")>
    <!--- Atualizar o produto no banco de dados --->  
    <cfquery datasource="sistema_coldfision">
        UPDATE produtos
        SET nome = <cfqueryparam value="#form.nome#" cfsqltype="cf_sql_varchar">,
            descricao = <cfqueryparam value="#form.descricao#" cfsqltype="cf_sql_longvarchar">,
            valor = <cfqueryparam value="#form.valor#" cfsqltype="cf_sql_decimal">
        WHERE id = <cfqueryparam value="#url.id#" cfsqltype="cf_sql_integer">
    </cfquery>

    <!--- Redirecionamento para visualizar.cfm após edição --->  
    <cflocation url="visualizar.cfm" addtoken="false">
</cfif>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Produto</title>
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
            <h2>Editar Produto</h2>
        </div>

        <div class="card p-4 shadow-lg">
            <form method="post">
                <div class="mb-3">
                    <label for="nome" class="form-label">Nome</label>
                    <input type="text" id="nome" name="nome" class="form-control" value="<cfoutput>#nome#</cfoutput>" required />
                </div>
                <div class="mb-3">
                    <label for="descricao" class="form-label">Descrição</label>
                    <textarea id="descricao" name="descricao" class="form-control"><cfoutput>#descricao#</cfoutput></textarea>
                </div>
                <div class="mb-3">
                    <label for="valor" class="form-label">Valor</label>
                    <input type="text" id="valor" name="valor" class="form-control" value="<cfoutput>#valor#</cfoutput>" required />
                </div>

                <div class="d-flex justify-content-between">
                    <a href="index.cfm" class="btn btn-secondary">
                        <i class="bi bi-arrow-left"></i> Voltar para o Início
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
