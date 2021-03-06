{if NOT $permission_addban}
Access Denied!
{else}
<div id="msg-green" style="display:none;">
	<i><img src="./images/yay.png" alt="Success" /></i>
	<b>Dodanie Bana</b><br />
	Nowy ban został dodany do systemu.<br /><br />
	<i>Redirecting back to bans page</i>
</div>
<div class="row">
	<div class="col-lg-12 grid-margin">
		<div class="card">
			<div class="card-body" id="add-group1">
				<h3>Dodaj Bana</h3>
				<p>Aby uzyskać więcej informacji lub pomocy dotyczących określonego tematu, przesuń kursor myszy nad znakiem zapytania.</p>
				<br /><br />
				<div id="banlist" class="table-responsive">
					<table id="group.details" class="table table-striped">
						<tr>
							<td>
								<div class="rowdesc">
									<i class="text-primary mdi mdi-help-circle" data-toggle="tooltip" data-placement="bottom" title="Podaj nick gracza."></i>
									Nick
								</div>
							</td>
							<td>
								<div align="left">
									<input type="hidden" id="fromsub" value="" />
									<input type="text" TABINDEX=1 class="form-control"  id="nickname" name="nickname"/>
								</div>
								<div id="nick.msg" class="badentry"></div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="rowdesc">
									<i class="text-primary mdi mdi-help-circle" data-toggle="tooltip" data-placement="bottom" title="Wybierz na co chcesz nadać bana."></i>
									Rodzaj Bana
								</div>
							</td>
							<td>
								<div align="left">
									<select id="type" name="type" TABINDEX=2 class="form-control">
										<option value="0">STEAM ID</option>
										<option value="1">IP</option>
									</select>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="rowdesc">
									<i class="text-primary mdi mdi-help-circle" data-toggle="tooltip" data-placement="bottom" title="Podaj STEAM ID gracza"></i>
									STEAM ID lub ID społeczności
								</div>
							</td>
							<td>
								<div align="left">
									<input type="text" TABINDEX=3 class="form-control"  id="steam" name="steam"/>
								</div>
								<div id="steam.msg" class="badentry"></div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="rowdesc">
									<i class="text-primary mdi mdi-help-circle" data-toggle="tooltip" data-placement="bottom" title="Podaj IP gracza jeśli je posiadasz"></i>
									Adres IP
								</div>
							</td>
							<td>
								<div align="left">
									<input type="text" TABINDEX=3 class="form-control"  id="ip" name="ip"/>
								</div>
								<div id="ip.msg" class="badentry"></div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="rowdesc">
									<i class="text-primary mdi mdi-help-circle" data-toggle="tooltip" data-placement="bottom" title="Podaj powód bana."></i>
									Powód bana
								</div>
							</td>
							<td>
								<div align="left">
									<select id="listReason" name="listReason" TABINDEX=4 class="form-control"  onChange="changeReason(this[this.selectedIndex].value);">
										<option value="" selected> -- Select Reason -- </option>
										<optgroup label="Hacking">
											<option value="Aimbot">Aimbot</option>
											<option value="Antirecoil">Antirecoil</option>
											<option value="Wallhack">Wallhack</option>
											<option value="Spinhack">Spinhack</option>
											<option value="Multi-Hack">Multi-Hack</option>
											<option value="No Smoke">No smoke</option>
											<option value="No Flash">No Flash</option>
										</optgroup>
										<optgroup label="Behavior">
											<option value="Team Killing">Zabijanie swoich</option>
											<option value="Team Flashing">Fleshowanie swoich</option>
											<option value="Spamming Mic/Chat">Spamowanie na chacie lub mikro</option>
											<option value="Inappropriate Spray">Niedozowolony spray</option>
											<option value="Inappropriate Language">Niedozwolony język</option>
											<option value="Inappropriate Name">Niedozwolona nazwa gracza</option>
											<option value="Ignoring Admins">Obrażanie admina</option>
											<option value="Team Stacking">Utrudnianie gry drużynie</option>
										</optgroup>
										{if $customreason}
										<optgroup label="Custom">
											{foreach from="$customreason" item="creason"}
											<option value="{$creason}">{$creason}</option>
											{/foreach}
										</optgroup>
										{/if}
										<option value="other">Podaj inny powód</option>
									</select>
									<div id="dreason" style="display:none;">
										<textarea class="form-control"  TABINDEX=4 cols="30" rows="5" id="txtReason" name="txtReason"></textarea>
									</div>
								</div>
								<div id="reason.msg" class="badentry"></div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="rowdesc">
									<i class="text-primary mdi mdi-help-circle" data-toggle="tooltip" data-placement="bottom" title="Wybierz długość bana"></i>
									Długość bana
								</div>
							</td>
							<td>
								<div align="left">
									<select id="banlength" TABINDEX=5 class="form-control"  >
										<option value="0">Na zawsze</option>
										<optgroup label="minut">
											<option value="1">1 minuta</option>
											<option value="5">5 minut</option>
											<option value="10">10 minut</option>
											<option value="15">15 minut</option>
											<option value="30">30 minut</option>
											<option value="45">45 minut</option>
										</optgroup>
										<optgroup label="godzin">
											<option value="60">1 godzina</option>
											<option value="120">2 godziny</option>
											<option value="180">3 godziny</option>
											<option value="240">4 godziny</option>
											<option value="480">8 godzin</option>
											<option value="720">12 godzin</option>
										</optgroup>
										<optgroup label="dni">
											<option value="1440">1 dzień</option>
											<option value="2880">2 dni</option>
											<option value="4320">3 dni</option>
											<option value="5760">4 dni</option>
											<option value="7200">5 dni</option>
											<option value="8640">6 dni</option>
										</optgroup>
										<optgroup label="tygodni">
											<option value="10080">1 tydzień</option>
											<option value="20160">2 tygodnie</option>
											<option value="30240">3 tygodnie</option>
										</optgroup>
										<optgroup label="miesięcy">
											<option value="43200">1 miesiąc</option>
											<option value="86400">2 miesiące</option>
											<option value="129600">3 miesiące</option>
											<option value="259200">6 miesięcy</option>
											<option value="518400">12 miesięcy</option>
										</optgroup>
									</select>
								</div>
								<div id="length.msg" ></div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="rowdesc">
									<i class="text-primary mdi mdi-help-circle" data-toggle="tooltip" data-placement="bottom" title="Klkinij 'Wrzuć demo' aby wrzucić demo do bana"></i>
									Wrzuć demo
								</div>
							</td>
							<td>
								<div align="left">
									{sb_button text="Wrzuć demko" onclick="childWindow=open('pages/admin.uploaddemo.php','upload','resizable=no,width=300,height=130');" class="save" id="udemo" submit=false}
								</div>
								<div id="demo.msg" class="text-primary"></div>
							</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td>
								{sb_button text="Dodaj bana" onclick="ProcessBan();" class="ok" id="aban" submit=false}
								&nbsp;
								{sb_button text="Wstecz" onclick="history.go(-1)" class="cancel" id="aback"}
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
{/if}