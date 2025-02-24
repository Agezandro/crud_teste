<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Index - Sistema de Gestao</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #F3F4F6;
            color: #333;
        }
        .header {
            background-color: #1E3A8A;
            color: white;
            text-align: center;
            padding: 50px 0;
        }
        .header h1 {
            font-weight: 600;
        }
        .navbar {
            background-color: #1E3A8A;
        }
        .navbar-brand, .nav-link {
            color: white !important;
            font-weight: 500;
        }
        .navbar-nav .nav-link:hover {
            background-color: #60A5FA;
            border-radius: 5px;
        }
        .content {
            padding: 40px 20px;
            text-align: center;
        }
        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s ease-in-out;
        }
        .card:hover {
            transform: scale(1.05);
        }
        .card-title {
            font-weight: 600;
            color: #1E3A8A;
        }
    </style>
</head>
<body>

    <div class="header">
        <h1>Bem-vindo ao Sistema de Gestao</h1>
        <p>Gerencie produtos, fornecedores e vendas com facilidade.</p>
    </div>

    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="#">Meu Sistema</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Alternar navegação">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link px-3" href="visualizar.cfm">Cadastro de Produto</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link px-3" href="cadastroFornecedor.cfm">Cadastro de Fornecedor</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link px-3" href="vendas.cfm">Vendas</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="content container">
        <div class="row justify-content-center">
            <div class="col-md-4 mb-4">
                <div class="card p-3">
                    <h5 class="card-title">Cadastro de Produto</h5>
                    <p>Registre novos produtos para o sistema.</p>
                    <a href="visualizar.cfm" class="btn btn-primary">Acessar</a>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card p-3">
                    <h5 class="card-title">Cadastro de Fornecedor</h5>
                    <p>Gerencie seus fornecedores com facilidade.</p>
                    <a href="cadastroFornecedor.cfm" class="btn btn-primary">Acessar</a>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card p-3">
                    <h5 class="card-title">Vendas</h5>
                    <p>Visualize e gerencie as vendas realizadas.</p>
                    <a href="vendas.cfm" class="btn btn-primary">Acessar</a>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
