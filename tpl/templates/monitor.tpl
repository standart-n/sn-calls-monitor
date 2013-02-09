<div class="container-fluid">
	<div class="row-fluid">
		<h4>Подключенные клиенты</h4>
	</div>

	<div class="row-fluid">
		<div class="span12">
		<table class="table table-condensed table-striped">
			<thead>
				<tr>
					<th>№</th>
					<th class="hidden-phone">Тип</th>
					<th class="hidden-phone">ip</th>
					<th>Статус</th>
					<th>Пользователь</th>
					<th>Профиль</th>
				</tr>
			</thead>
			<tbody>
			{if isset($monitor)}
				{foreach from=$monitor item=key}
					{if ($key.phone!='-')}
						{if (($key.ip!='-none-') && ($key.status!='UNKNOWN'))}
							<tr>
								<td>
									{if isset($key.phone_color)}<span class="label label-{$key.phone_color}">{/if}
										<small>{$key.phone}</small>
									{if isset($key.phone_color)}</span>{/if}
								</td>
								<td class="hidden-phone">
									<small>{$key.type}</small>
								</td>
								<td class="hidden-phone">
									<small>{$key.ip}</small>
								</td>	
								<td>
									{if isset($key.status_color)}<span class="badge badge-{$key.status_color}">{/if}
										<small>{$key.status}</small>
									{if isset($key.status_color)}</span>{/if}
								</td>
								<td>
									{if (($key.phone_color=='info') && ($key.user!='-'))}
										<a href='../calls/index.php?src={$key.phone}&dst={$key.phone}' target='_blank'
									{/if}
									<small>{if ($key.user!='-')}{$key.user}{/if}</small>
									{if (($key.phone_color=='info') && ($key.user!='-'))}
										</a>
									{/if}
								</td>
								<td>
									<small>{if ($key.profile!='-')}{$key.profile}{/if}</small>
									<small>{if ($key.profile_id!='-')}<span class="badge badge-info">{$key.profile_id}</span>{/if}</small>
								</td>
							</tr>
						{/if}
					{/if}
				{/foreach}
			{/if}
			</tbody>
		</table>		
		</div>
	</div>
</div>