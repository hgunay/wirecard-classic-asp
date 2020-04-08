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
			<form method="post" action="/PaymentNon3d.asp">
				<div class="col-sm-12">
					<div class="card">
						<div class="card-header">
							<strong>Ödeme Formu</strong>
							<small>Lütfen kart bilgilerinizi giriniz.</small>
						</div>
						
							<div class="card-body">						
								<div class="row">
									<div class="col-sm-12">
										<div class="form-group">
											<label for="name">Kart Üzerindeki İsim</label>
											<input class="form-control" id="name" type="text" autocomplete="cc-additional-name">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12">
										<div class="form-group">
											<label for="ccnumber">Kart No</label>
											<div class="input-group">
												<input class="form-control" id="cc-number" type="text" placeholder="0000 0000 0000 0000" autocomplete="cc-number" maxlength="19">
												<div class="input-group-append">
													<span class="input-group-text">
														<img id="card-logo">
													</span>
												</div>
											</div>
											
										</div>
									</div>
								</div>
								<div class="row">
									<div class="form-group col-sm-4">
										<label for="ccmonth">Month</label>
										<select class="form-control" id="ccmonth" autocomplete="cc-exp-month">
											<option>1</option>
											<option>2</option>
											<option>3</option>
											<option>4</option>
											<option>5</option>
											<option>6</option>
											<option>7</option>
											<option>8</option>
											<option>9</option>
											<option>10</option>
											<option>11</option>
											<option>12</option>
										</select>
									</div>
									<div class="form-group col-sm-4">
										<label for="ccyear">Year</label>
										<select class="form-control" id="ccyear" autocomplete="cc-exp-year">
											<option>2020</option>
											<option>2021</option>
											<option>2022</option>
											<option>2023</option>
											<option>2024</option>
											<option>2025</option>
											<option>2026</option>
											<option>2027</option>
											<option>2028</option>
											<option>2029</option>
											<option>2030</option>
										</select>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<label for="cvv">CVV/CVC</label>
											<input class="form-control" id="cvv" type="text" placeholder="123" autocomplete="cc-csc">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12">
										<div class="form-check">
											<input type="checkbox" class="form-check-input" id="cc3dsec">
											<label class="form-check-label" for="cc3dsec">3D Secure ile ödeme</label>
										</div>
									</div>
								</div>												
							</div>					
							<div class="card-footer">
								<button class="btn btn-sm btn-success float-right" type="submit">Ödeme Yap</button>
							</div>
						
					</div>
				</div>		
				
			</form>
		</div>
	</div>
<!-- Scripts -->
<script src="/Assets/js/jquery-3.4.1.min.js"></script>
<script src="/Assets/js/bootstrap.min.js"></script>
<script src="/Assets/js/site.js"></script>
</body>
</html>