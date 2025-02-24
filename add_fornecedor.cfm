<cfcontent type="text/html; charset=UTF-8">
<cfset setEncoding("form", "utf-8")>
<cfset setEncoding("URL", "utf-8")>
<!-- Cadastro e Edição de Fornecedor -->

<cfif structKeyExists(url, "add") OR structKeyExists(url, "edit")>
    <cfif structKeyExists(url, "edit") AND structKeyExists(url, "id")>
        <cfquery name="getFornecedor" datasource="sistema_coldfision">
            SELECT * FROM fornecedores WHERE id = <cfqueryparam value="#url.id#" cfsqltype="cf_sql_integer">
        </cfquery>
        
        <cfif getFornecedor.recordCount EQ 1>
            <cfset id = getFornecedor.id>
            <cfset nome = getFornecedor.nome>
            <cfset contato = getFornecedor.contato>
        <cfelse>
            <cfset id = "">
            <cfset nome = "">
            <cfset contato = "">
        </cfif>
    <cfelse>
        <cfset id = "">
        <cfset nome = "">
        <cfset contato = "">
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
    <div class="container mt-4">
        <div class="card p-4 shadow-lg">
            <h2 class="text-success text-center"><cfif structKeyExists(url, "edit")>Editar<cfelse>Adicionar</cfif> Fornecedor</h2>
            <form method="post">
                <div class="mb-3">
                    <label class="form-label">Nome</label>
                    <input type="text" name="nome" class="form-control" value="<cfoutput>#nome#</cfoutput>" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Contato</label>
                    <input type="text" name="contato" class="form-control" value="<cfoutput>#contato#</cfoutput>" required>
                </div>
                <button type="submit" name="submit" class="btn btn-success">Salvar</button>
                <a href="cadastroFornecedor.cfm" class="btn btn-secondary">Cancelar</a>
            </form>
        </div>
    </div>
</cfif>

<!-- Processamento do Formulário -->
<cfif structKeyExists(form, "submit")>
    <cfif structKeyExists(url, "edit") AND structKeyExists(url, "id")>
        <!-- Atualizar Fornecedor -->
        <cfquery datasource="sistema_coldfision">
            UPDATE fornecedores
            SET nome = <cfqueryparam value="#form.nome#" cfsqltype="cf_sql_varchar">,
                contato = <cfqueryparam value="#form.contato#" cfsqltype="cf_sql_varchar">
            WHERE id = <cfqueryparam value="#url.id#" cfsqltype="cf_sql_integer">
        </cfquery>
    <cfelse>
        <!-- Inserir Novo Fornecedor -->
        <cfquery datasource="sistema_coldfision">
            INSERT INTO fornecedores (nome, contato)
            VALUES (
                <cfqueryparam value="#form.nome#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#form.contato#" cfsqltype="cf_sql_varchar">
            )
        </cfquery>
    </cfif>

    <cflocation url="cadastroFornecedor.cfm" addtoken="false">
</cfif>
<!-- Exclusão de Fornecedor -->
<cfif structKeyExists(url, "delete") AND structKeyExists(url, "id")>
    <div class="container mt-5">
        <div class="card p-4 shadow-lg text-center">
            <h2 class="text-danger">Excluindo Fornecedor...</h2>

            <cfquery datasource="sistema_coldfision">
                DELETE FROM fornecedores WHERE id = <cfqueryparam value="#url.id#" cfsqltype="cf_sql_integer">
            </cfquery>

            <p class="text-success mt-3">Fornecedor excluído com sucesso!</p>
            <a href="cadastroFornecedor.cfm" class="btn btn-secondary mt-2">Voltar</a>
        </div>
    </div>

    <script>
        setTimeout(function() {
            window.location.href = 'cadastroFornecedor.cfm';
        }, 2000);
    </script>
</cfif>

</body>
</html>