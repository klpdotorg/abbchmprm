<!-- Beautiful Modal for Columns and Filters Selection -->
<div class="modal fade emrp-modal-beautiful" role="dialog" tabindex="-1" id="modalshowcolumns<?php echo $allReports['report_id']; ?>">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content emrp-modal-content">
			<div class="modal-header emrp-modal-header">
				<h4 class="modal-title">⚙️ Customize Report</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>

			<div class="modal-body emrp-modal-body">

				<?php
				$reports_helper = new chmreports_helper();
				$app_helper = new app_helper();
				$reportid = $allReports['report_id'];
				$args['arrAllColumns'] = $reports_helper->getAllColumnsByReportId($reportid);
				$args['arrAllwhereclause'] = $reports_helper->getAllwhereclauseByReportId($reportid);
				$args['arrMaster'] = $reports_helper->getAllMasterRecords();
				$arrMaster = array();

				foreach ($args['arrMaster'] as $arrMas) {
					$arrMaster[$arrMas['wc_column_name']] = $arrMas;
				}

				$p = 0;
				$arrMasterSelect = array();
				foreach ($args['arrAllwhereclause'] as $checkMaster) {
					$colName = $checkMaster['report_whereclause_column_name'] ?? '';

					if (isset($arrMaster[$colName])) {
						$masterWCrec = $arrMaster[$colName];
						$query = "select " . $masterWCrec['support_column_name'] . " from " . $masterWCrec['table_name'];

						if ($checkMaster['column_data_prefix'] != "") {
							$query .= " where  status_code like '" . $checkMaster['column_data_prefix'] . "%' ";
						}

						$execResult = $app_helper->executeConstructedQuery($query);
						$optioncnt = 0;

						foreach ($execResult as $execRes) {
							$arrMasterSelect[$p][$optioncnt] =
								$execRes[$masterWCrec['support_column_name']] ?? '';
							$optioncnt++;
						}
					}
					$p++;
				}
				?>

				<form action="<?php echo $_SESSION['EMRP_BASE_URL'] . $cfg_chmreportscontroller . '?taskname=show_report_view_datatable_custom&report_id=' . htmlspecialchars($allReports['report_id']); ?>" method="post" name="columnsselectform" id="columnsselectform">

					<!-- Columns Selection Section -->
					<div class="emrp-modal-section">
						<div class="emrp-modal-section-title">
							<h5>📊 Select Columns to Display</h5>
							<p>Choose which columns you want to see in your report</p>
						</div>

						<div id="viewAllColumns" class="emrp-columns-grid">
							<?php
							$columnscount = 0;
							$entriesperrow = 3;
							foreach ($args['arrAllColumns'] as $allColumns) {
							?>
								<div class="emrp-column-item">
									<label class="emrp-checkbox-wrapper">
										<input type="checkbox" name="col_<?php echo htmlspecialchars($allColumns['report_column_name']); ?>" id="col_<?php echo htmlspecialchars($allColumns['report_column_name']); ?>" value="<?php echo htmlspecialchars($allColumns['report_column_name']); ?>" checked='checked'>
										<span class="emrp-checkbox-custom"></span>
										<span class="emrp-label-text"><?php echo htmlspecialchars($allColumns['report_column_label']); ?></span>
									</label>
								</div>
							<?php
							}
							?>
						</div>
					</div>

					<!-- Filters Section -->
					<?php if (!empty($args['arrAllwhereclause'])) { ?>
						<div class="emrp-modal-section emrp-modal-section-filters">
							<div class="emrp-modal-section-title">
								<h5>🔍 Apply Filters (Optional)</h5>
								<p>Filter your data by specific criteria</p>
							</div>

							<div id="viewFilterColumns" class="emrp-filters-container">
								<table class="emrp-filters-table">
									<tbody>
										<?php
										$reccnt = 0;
										foreach ($args['arrAllwhereclause'] as $allWhereclause) {
										?>
											<tr class="emrp-filter-row">
												<td class="emrp-filter-label">
													<label for="<?php echo htmlspecialchars($allWhereclause['report_whereclause_column_name']); ?>">
														<?php echo htmlspecialchars($allWhereclause['report_whereclause_column_label']); ?>
													</label>
												</td>

												<td class="emrp-filter-input">
													<?php
													// if (sizeof($arrMasterSelect[$reccnt]) != 0) { 
													if (!empty($arrMasterSelect[$reccnt]) && is_array($arrMasterSelect[$reccnt])) {
													?>
														<select name="<?php echo htmlspecialchars($allWhereclause['report_whereclause_column_name']); ?>" id="<?php echo htmlspecialchars($allWhereclause['report_whereclause_column_name']); ?>" class="emrp-form-control">
															<option value="select">All</option>
															<?php
															foreach ($arrMasterSelect[$reccnt] as $optionvalues) {
															?>
																<option value="<?php echo htmlspecialchars($optionvalues); ?>"><?php echo htmlspecialchars($optionvalues); ?></option>
															<?php
															}
															?>
														</select>
													<?php
													} else if ($allWhereclause['wc_datatype'] == 'varchar') {
													?>
														<input type="text" name="<?php echo htmlspecialchars($allWhereclause['report_whereclause_column_name']); ?>" id="<?php echo htmlspecialchars($allWhereclause['report_whereclause_column_name']); ?>" class="emrp-form-control" placeholder="Enter value...">
													<?php
													} else if ($allWhereclause['wc_datatype'] == 'datetime') {
													?>
														<div class="emrp-date-range">
															<input type="date" name="fromdate_<?php echo htmlspecialchars($allWhereclause['report_whereclause_column_name']); ?>" id="fromdate_<?php echo htmlspecialchars($allWhereclause['report_whereclause_column_name']); ?>" class="emrp-form-control" placeholder="From date">
															<span class="emrp-date-separator">to</span>
															<input type="date" name="todate_<?php echo htmlspecialchars($allWhereclause['report_whereclause_column_name']); ?>" id="todate_<?php echo htmlspecialchars($allWhereclause['report_whereclause_column_name']); ?>" class="emrp-form-control" placeholder="To date">
														</div>
													<?php
													} else if ($allWhereclause['wc_datatype'] == 'integer') {
													?>
														<div class="emrp-date-range">
															<input type="number" name="fromvalue_<?php echo htmlspecialchars($allWhereclause['report_whereclause_column_name']); ?>" id="fromvalue_<?php echo htmlspecialchars($allWhereclause['report_whereclause_column_name']); ?>" class="emrp-form-control" placeholder="From...">
															<span class="emrp-date-separator">to</span>
															<input type="number" name="tovalue_<?php echo htmlspecialchars($allWhereclause['report_whereclause_column_name']); ?>" id="tovalue_<?php echo htmlspecialchars($allWhereclause['report_whereclause_column_name']); ?>" class="emrp-form-control" placeholder="To...">
														</div>
													<?php
													} else {
													?>
														<input type="text" name="<?php echo htmlspecialchars($allWhereclause['report_whereclause_column_name']); ?>" id="<?php echo htmlspecialchars($allWhereclause['report_whereclause_column_name']); ?>" class="emrp-form-control" placeholder="Enter value...">
													<?php
													}
													?>
												</td>
											</tr>
										<?php
											$reccnt++;
										}
										?>
									</tbody>
								</table>
							</div>
						</div>
					<?php } ?>

			</div> <!-- Modal body ends -->

			<div class="modal-footer emrp-modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
				<button type="submit" class="btn btn-primary emrp-btn-submit">
					<span>✓ View Report</span>
				</button>
			</div>

			</form>

		</div>
	</div>
</div>

<style>
	.emrp-modal-beautiful {
		--modal-primary: #0d4b7e;
		--modal-secondary: #499bea;
		--modal-light-bg: #f8fafc;
		--modal-card-bg: #ffffff;
		--modal-border: #e5e7eb;
		--modal-text: #1f2937;
		--modal-text-secondary: #6b7280;
	}

	.emrp-modal-content {
		border: 1px solid var(--modal-border);
		border-radius: 10px;
		box-shadow: 0 10px 40px rgba(0, 0, 0, 0.15);
	}

	.emrp-modal-header {
		background: linear-gradient(135deg, var(--modal-primary) 0%, var(--modal-secondary) 100%);
		color: white;
		border-bottom: 1px solid var(--modal-border);
		padding: 20px;
		border-radius: 10px 10px 0 0;
	}

	.emrp-modal-header h4 {
		margin: 0;
		font-size: 18px;
		font-weight: 600;
	}

	.emrp-modal-header .close {
		color: white;
		opacity: 0.7;
		transition: opacity 0.2s;
	}

	.emrp-modal-header .close:hover {
		opacity: 1;
	}

	.emrp-modal-body {
		padding: 30px;
		background-color: var(--modal-light-bg);
		max-height: 70vh;
		overflow-y: auto;
	}

	.emrp-modal-section {
		background: var(--modal-card-bg);
		border-radius: 8px;
		padding: 24px;
		margin-bottom: 20px;
		border: 1px solid var(--modal-border);
	}

	.emrp-modal-section-filters {
		margin-top: 20px;
	}

	.emrp-modal-section-title h5 {
		margin: 0 0 5px 0;
		font-size: 16px;
		font-weight: 600;
		color: var(--modal-text);
	}

	.emrp-modal-section-title p {
		margin: 0;
		font-size: 13px;
		color: var(--modal-text-secondary);
	}

	.emrp-columns-grid {
		display: grid;
		grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
		gap: 15px;
		margin-top: 15px;
	}

	.emrp-column-item {
		padding: 0;
	}

	.emrp-checkbox-wrapper {
		display: flex;
		align-items: center;
		gap: 10px;
		cursor: pointer;
		user-select: none;
	}

	.emrp-checkbox-wrapper input[type="checkbox"] {
		display: none;
	}

	.emrp-checkbox-custom {
		width: 20px;
		height: 20px;
		border: 2px solid var(--modal-border);
		border-radius: 4px;
		display: inline-flex;
		align-items: center;
		justify-content: center;
		background: var(--modal-card-bg);
		transition: all 0.2s;
		flex-shrink: 0;
	}

	.emrp-checkbox-wrapper input[type="checkbox"]:checked + .emrp-checkbox-custom {
		background: linear-gradient(135deg, var(--modal-primary) 0%, var(--modal-secondary) 100%);
		border-color: var(--modal-secondary);
		color: white;
	}

	.emrp-checkbox-wrapper input[type="checkbox"]:checked + .emrp-checkbox-custom::after {
		content: '✓';
		font-size: 12px;
		font-weight: bold;
	}

	.emrp-label-text {
		font-size: 14px;
		color: var(--modal-text);
		font-weight: 500;
	}

	.emrp-filters-table {
		width: 100%;
		border-collapse: collapse;
	}

	.emrp-filter-row {
		display: grid;
		grid-template-columns: 1fr 2fr;
		gap: 15px;
		align-items: center;
		padding: 12px 0;
		border-bottom: 1px solid var(--modal-border);
	}

	.emrp-filter-row:last-child {
		border-bottom: none;
	}

	.emrp-filter-label label {
		font-size: 14px;
		font-weight: 500;
		color: var(--modal-text);
		display: flex;
		align-items: center;
		height: 100%;
	}

	.emrp-filter-input {
		padding: 8px 0;
	}

	.emrp-form-control {
		width: 100%;
		padding: 10px 12px;
		border: 1px solid var(--modal-border);
		border-radius: 6px;
		font-size: 14px;
		color: var(--modal-text);
		background: var(--modal-card-bg);
		transition: all 0.2s;
		box-sizing: border-box;
	}

	.emrp-form-control:focus {
		outline: none;
		border-color: var(--modal-primary);
		box-shadow: 0 0 0 3px rgba(13, 75, 126, 0.1);
	}

	.emrp-date-range {
		display: flex;
		align-items: center;
		gap: 10px;
	}

	.emrp-date-range input {
		flex: 1;
	}

	.emrp-date-separator {
		font-size: 13px;
		color: var(--modal-text-secondary);
		white-space: nowrap;
	}

	.emrp-modal-footer {
		background: white;
		border-top: 1px solid var(--modal-border);
		padding: 16px 20px;
		display: flex;
		justify-content: flex-end;
		gap: 10px;
		border-radius: 0 0 10px 10px;
	}

	.emrp-modal-footer .btn {
		padding: 10px 20px;
		border-radius: 6px;
		font-size: 14px;
		font-weight: 500;
		transition: all 0.2s;
		border: none;
		cursor: pointer;
	}

	.emrp-modal-footer .btn-secondary {
		background: var(--modal-light-bg);
		color: var(--modal-text);
		border: 1px solid var(--modal-border);
	}

	.emrp-modal-footer .btn-secondary:hover {
		background: var(--modal-border);
	}

	.emrp-modal-footer .btn-primary {
		background: linear-gradient(135deg, var(--modal-primary) 0%, var(--modal-secondary) 100%);
		color: white;
	}

	.emrp-modal-footer .btn-primary:hover {
		transform: translateY(-1px);
		box-shadow: 0 4px 12px rgba(13, 75, 126, 0.3);
	}

	.emrp-modal-footer .btn-primary:active {
		transform: translateY(0);
	}

	@media (max-width: 768px) {
		.emrp-modal-body {
			padding: 20px;
			max-height: 80vh;
		}

		.emrp-modal-section {
			padding: 16px;
		}

		.emrp-columns-grid {
			grid-template-columns: 1fr;
		}

		.emrp-filter-row {
			grid-template-columns: 1fr;
		}

		.emrp-date-range {
			flex-direction: column;
		}

		.emrp-date-range input {
			width: 100%;
		}

		.emrp-date-separator {
			transform: rotate(90deg);
			margin: 5px 0;
		}
	}
</style>
