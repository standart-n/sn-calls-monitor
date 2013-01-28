
<div class="container-fluid">
	<div class="row-fluid">
	
			<div class="span12">
				<div class="well well-small">
					<form id="fSubmit" class="form-inline">
						<div class="input-append">
							<input id="src" type="text" class="input-medium" placeholder="От кого" value="{$controls.src}">
							<span class="add-on"><i class="icon-user"></i></span>
						</div>
						<div class="input-append">
							<input id="dst" type="text" class="input-medium" placeholder="Кому" value="{$controls.dst}">
							<span class="add-on"><i class="icon-user"></i></span>
						</div>
				  	
				  		<div class="input-append date" id="dp1" data-date="{$controls.date1}" data-date-format="dd-mm-yyyy">
							<input id="date1" class="input-small" size="16" type="text" value="{$controls.date1}">
							<span class="add-on"><i class="icon-th"></i></span>
						</div>
						<div class="input-append date" id="dp2" data-date="{$controls.date2}" data-date-format="dd-mm-yyyy">
							<input id="date2" class="input-small" size="16" type="text" value="{$controls.date2}">
							<span class="add-on"><i class="icon-th"></i></span>
						</div>
						<div class="hidden">
							<input type="submit">
						</div>
					</form>
					<!--
					<form class="form-inline">
						<label class="checkbox">
							<input id="cb_short_calls" data-cb="show_short_calls" class="cb" type="checkbox" checked>Показывать короткие звонки
							<input id="show_short_calls" type="hidden" value="on">
						</label>
					</form>
					-->

					<form class="form-inline">
						<label class="hidden-phone">Выводить по </label>
						<div class="btn-group limit">
							<a href="#" class="btn btn-small" data-limit="10">10</a>
							<a href="#" class="btn btn-small active" data-limit="20">20</a>
							<a href="#" class="btn btn-small hidden-phone" data-limit="30">30</a>
							<a href="#" class="btn btn-small" data-limit="40">40</a>
						</div>
							<input id="limit" type="hidden" value="20">
						<div class="btn-group">
							<a class="btn btn-small dropdown-toggle" data-toggle="dropdown" href="#">
								Фильтры
								<span class="caret"></span>
							</a>
							<ul class="dropdown-menu filters" role="menu" aria-labelledby="dLabel">
								<li class="nav-header">Статусы</li>
								<li><a data-cb="show_answered" data-value="on" tabindex="-1" href="#"><i class="icon-ok"></i> Отвеченные</a></li>
								<li><a data-cb="show_no_answer" data-value="on" tabindex="-1" href="#"><i class="icon-ok"></i> Не отвеченные</a></li>
								<li><a data-cb="show_busy" data-value="on" tabindex="-1" href="#"><i class="icon-ok"></i> Занято</a></li>
								<li><a data-cb="show_failed" data-value="on" tabindex="-1" href="#"><i class="icon-ok"></i> Отмененные</a></li>
								<li class="divider"></li>
								<li class="nav-header">Посл. действ.</li>
								<li><a data-cb="show_dial" data-value="on" tabindex="-1" href="#"><i class="icon-ok"></i> Вызов</a></li>
								<li><a data-cb="show_playback" data-value="on" tabindex="-1" href="#"><i class="icon-ok"></i> ИВР</a></li>
								<li><a data-cb="show_wait" data-value="on" tabindex="-1" href="#"><i class="icon-ok"></i> Ожидание</a></li>
								<li><a data-cb="show_hangup" data-value="on" tabindex="-1" href="#"><i class="icon-ok"></i> Сброшено</a></li>
							</ul>
							<input id="show_answered" type="hidden" value="on">
							<input id="show_no_answer" type="hidden" value="on">
							<input id="show_busy" type="hidden" value="on">
							<input id="show_failed" type="hidden" value="on">
							<input id="show_hangup" type="hidden" value="on">
							<input id="show_playback" type="hidden" value="on">
							<input id="show_dial" type="hidden" value="on">
							<input id="show_wait" type="hidden" value="on">
						</div>
					</form>

						<a id="submit" href="#" class="btn btn-primary btn-medium"><i class="icon-ok icon-white">
							</i> Применить
						</a>

						<!--
						<div id="loading">
							<div class="progress progress-striped active">
								<div class="bar" style="width: 100%;"><strong>Загрузка данных...</strong></div>
							</div>
						</div>
						-->
					
				</div>
			</div>

	
		</form>
	</div>
</div>
