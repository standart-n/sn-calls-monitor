<div class='container-fluid'>
  <div class='row-fluid'>
    <div class='span10 offset1'>
      <div class='well'>
        <div class='row-fluid'>
          <div class='span10 offset1'>
            <div id='signin-error'>
              <div class='alert alert-error'>
                <button class='close' data-dismiss='alert' type='button'>&times;</button>
                <strong>Ошибка!</strong>
                Вы ввели неверный логин или пароль.
              </div>
            </div>
            <form class='form-horizontal' id='fSignin'>
              <div class='control-group'>
                <label class='control-label' for='inputLogin'>Логин</label>
                <div class='controls'>
                  <input id='inputLogin' placeholder='login' type='text' />
                </div>
              </div>
              <div class='control-group'>
                <label class='control-label' for='inputPassword'>Пароль</label>
                <div class='controls'>
                  <input id='inputPassword' placeholder='password' type='password' />
                </div>
              </div>
              <div class='control-group'>
                <div class='controls'>
                  <button class='btn' type='submit'>Войти</button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
