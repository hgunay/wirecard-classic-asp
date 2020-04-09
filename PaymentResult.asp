
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="content-language" content="tr">
    <meta http-equiv="content-type" content="text/html; charset=windows-1254">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WireCard Classic ASP Test Ortamı</title>
	<link rel="icon" href="/favicon.png">
	<!-- Styles -->
    <link href="/Assets/css/bootstrap.min.css" rel="stylesheet" />
	<link href="/Assets/css/style.css" rel="stylesheet" />
</head>
<body>
    <div class="container">
		<div class="row justify-content-md-center">
            <div class="col-sm-8">
                <div class="card">
                    <div class="card-header">
                        <strong>Ödeme Sonuç Bilgileri</strong>
                    </div>						
                    <div class="card-body">
                        <dl class="row">
                            <dt class="col-sm-4">OrderId</dt>
                            <dd class="col-sm-8"><%= request.form("OrderId") %></dd>
                            <dt class="col-sm-4">MPAY</dt>
                            <dd class="col-sm-8"><%= request.form("MPAY") %></dd>
                            <dt class="col-sm-4">StatusCode</dt>
                            <dd class="col-sm-8"><%= request.form("StatusCode") %></dd>
                            <dt class="col-sm-4">ResultCode</dt>
                            <dd class="col-sm-8"><%= request.form("ResultCode") %></dd>
                            <dt class="col-sm-4">ResultMessage</dt>
                            <dd class="col-sm-8"><%= request.form("ResultMessage") %></dd>
                            <dt class="col-sm-4">LastTransactionDate</dt>
                            <dd class="col-sm-8"><%= request.form("LastTransactionDate") %></dd>
                            <dt class="col-sm-4">MaskedCCNo</dt>
                            <dd class="col-sm-8"><%= request.form("MaskedCCNo") %></dd>
                            <dt class="col-sm-4">CCTokenId</dt>
                            <dd class="col-sm-8"><%= request.form("CCTokenId") %></dd>
                            <dt class="col-sm-4">Price</dt>
                            <dd class="col-sm-8"><%= request.form("Price") %></dd>
                            <dt class="col-sm-4">InstallmentCount</dt>
                            <dd class="col-sm-8"><%= request.form("InstallmentCount") %></dd>
                            <dt class="col-sm-4">CustomerIPAddress</dt>
                            <dd class="col-sm-8"><%= request.form("CustomerIPAddress") %></dd>
                            <dt class="col-sm-4">CurrencyCode</dt>
                            <dd class="col-sm-8"><%= request.form("CurrencyCode") %></dd>
                            <dt class="col-sm-4">ExtraParam</dt>
                            <dd class="col-sm-8"><%= request.form("ExtraParam") %></dd>
                        </dl>
                    </div>
                </div>
            </div>
        </div>
    </div>
<!-- Scripts -->
<script src="/Assets/js/jquery-3.4.1.min.js"></script>
<script src="/Assets/js/bootstrap.min.js"></script>
<script src="/Assets/js/site.js"></script>
</body>
</html>