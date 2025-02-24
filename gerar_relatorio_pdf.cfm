<cfset setEncoding("form", "utf-8")>
<cfset setEncoding("URL", "utf-8")>

<cfquery name="getProdutos" datasource="sistema_coldfision">
    SELECT * FROM produtos ORDER BY id DESC
</cfquery>

<!--- Gerar conteúdo HTML para o relatório ---> 
<cfset htmlContent = "<html><body>
    <h2>Relatório de Produtos</h2>
    <table border='1'>
        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Descrição</th>
            <th>Valor</th>
        </tr>" />

<cfloop query="getProdutos">
    <cfset htmlContent = htmlContent & "<tr>
        <td>#getProdutos.id#</td>
        <td>#getProdutos.nome#</td>
        <td>#getProdutos.descricao#</td>
        <td>R$ #getProdutos.valor#</td>
    </tr>" />
</cfloop>

<cfset htmlContent = htmlContent & "</table></body></html>" />

<!--- Salvar HTML em um arquivo temporário ---> 
<cfset filePath = expandPath("./produtos_relatorio.html")>
<cffile action="write" file="#filePath#" output="#htmlContent#">

<!--- Forçar o download do arquivo gerado ---> 
<cfheader name="Content-Disposition" value="attachment; filename=produtos_relatorio.html">
<cfcontent file="#filePath#" type="text/html">
