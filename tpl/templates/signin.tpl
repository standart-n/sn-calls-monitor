



<div class="container-fluid">
	<div class="row-fluid">
		<div class="span10 offset1">
			<div class="well">

				<div class="row-fluid">
					<div class="span10 offset1">

						<div id="signin-error">	
							<div class="alert alert-error">
								<button type="button" class="close" data-dismiss="alert">&times;</button>
								<strong>Ошибка!</strong> Вы ввели неверный логин или пароль.
							</div>
						</div>

						<div id="signin-info">	
							<div class="alert alert-info">
								<button type="button" class="close" data-dismiss="alert">&times;</button>
								<strong>Подождите!</strong> Идет загрузка данных.
							</div>
						</div>
						
						<form id="fSignin" class="form-horizontal">
				
							<div class="control-group">
								<label class="control-label" for="inputLogin">Логин</label>
								<div class="controls">
									<input type="text" id="inputLogin" placeholder="login">
								</div>
							</div>
    
							<div class="control-group">
								<label class="control-label" for="inputPassword">Пароль</label>
								<div class="controls">
									<input type="password" id="inputPassword" placeholder="password">
								</div>
							</div>

							<div class="control-group">
								<div class="controls">
									<!--
									<label class="checkbox">
										<input type="checkbox"> Запомнить меня
									</label>
									-->
									<button type="submit" class="btn">Войти</button>
								</div>
							</div>
			
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
