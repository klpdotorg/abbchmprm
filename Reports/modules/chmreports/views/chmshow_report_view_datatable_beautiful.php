<?php

//  session_start();
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

class chmshow_report_view_datatable_beautiful
{

    function show($args = "", $arrErrorMsg = "")
    {

        $selectedcolumns_json = json_encode($args['selectedcolumns']);
?>

        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>EMRP Reports Portal - Data Report</title>
            <?php include($_SESSION['EMRP_BASE_DIR'] . "/app/views/includes/emrp_header.php");
            include($_SESSION['EMRP_BASE_DIR'] . "/app/views/includes/include_datatable_cssfiles.php"); ?>

            <style>
                :root {
                    --primary-color: #0d4b7e;
                    --secondary-color: #499bea;
                    --accent-color: #2d74b4;
                    --light-bg: #f8fafc;
                    --card-bg: #ffffff;
                    --text-primary: #1f2937;
                    --text-secondary: #6b7280;
                    --border-color: #e5e7eb;
                    --shadow-md: 0 4px 6px 0 rgba(0, 0, 0, 0.1);
                    --shadow-lg: 0 10px 15px 0 rgba(0, 0, 0, 0.1);
                }

                body {
                    background-color: var(--light-bg);
                    font-family: 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
                }

                .emrp-report-container {
                    padding: 30px 20px;
                    margin: 0;
                }

                .emrp-report-header {
                    background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
                    padding: 25px;
                    border-radius: 12px;
                    color: white;
                    margin-bottom: 30px;
                    box-shadow: var(--shadow-md);
                }

                .emrp-report-header h1 {
                    font-size: 28px;
                    font-weight: 700;
                    margin: 0 0 8px 0;
                }

                .emrp-report-header p {
                    margin: 0;
                    opacity: 0.95;
                    font-size: 14px;
                }

                .emrp-datatable-wrapper {
                    background: var(--card-bg);
                    border-radius: 12px;
                    box-shadow: var(--shadow-md);
                    overflow: hidden;
                    border: 1px solid var(--border-color);
                }

                .emrp-datatable-controls {
                    padding: 20px;
                    border-bottom: 1px solid var(--border-color);
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    flex-wrap: wrap;
                    gap: 15px;
                }

                .dataTables_wrapper .dt-buttons {
                    float: right !important;
                    text-align: center;
                }

                .dataTables_wrapper .dt-buttons button {
                    background-color: var(--primary-color) !important;
                    color: white !important;
                    border: none !important;
                    padding: 8px 16px !important;
                    margin: 0 5px !important;
                    border-radius: 6px !important;
                    cursor: pointer !important;
                    font-size: 14px !important;
                    font-weight: 500 !important;
                    transition: all 0.2s !important;
                }

                .dataTables_wrapper .dt-buttons button:hover {
                    background-color: var(--secondary-color) !important;
                    transform: translateY(-1px) !important;
                }

                .dataTables_wrapper .dataTables_filter {
                    float: left !important;
                    text-align: left !important;
                }

                .dataTables_wrapper .dataTables_filter input {
                    border: 1px solid var(--border-color) !important;
                    border-radius: 6px !important;
                    padding: 8px 12px !important;
                    margin-left: 10px !important;
                    font-size: 14px !important;
                    transition: all 0.2s !important;
                }

                .dataTables_wrapper .dataTables_filter input:focus {
                    outline: none !important;
                    border-color: var(--primary-color) !important;
                    box-shadow: 0 0 0 3px rgba(13, 75, 126, 0.1) !important;
                }

                .emrp-datatable-content {
                    padding: 20px;
                    overflow-x: auto;
                }

                .emrp-datatable-content table {
                    width: 100%;
                    border-collapse: collapse;
                    margin: 0;
                }

                .emrp-datatable-content thead {
                    background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
                    color: white;
                }

                .emrp-datatable-content thead th {
                    padding: 15px;
                    text-align: left;
                    font-weight: 600;
                    font-size: 14px;
                    white-space: nowrap;
                }

                .emrp-datatable-content tbody tr {
                    border-bottom: 1px solid var(--border-color);
                    transition: all 0.2s;
                }

                .emrp-datatable-content tbody tr:hover {
                    background-color: rgba(13, 75, 126, 0.02);
                }

                .emrp-datatable-content tbody td {
                    padding: 12px 15px;
                    font-size: 14px;
                    color: var(--text-primary);
                }

                .dataTables_wrapper .dataTables_info {
                    padding: 15px 20px !important;
                    color: var(--text-secondary) !important;
                    font-size: 14px !important;
                }

                .dataTables_wrapper .dataTables_paginate {
                    padding: 15px 20px !important;
                }

                .dataTables_wrapper .paginate_button {
                    border: 1px solid var(--border-color) !important;
                    border-radius: 6px !important;
                    margin: 0 3px !important;
                    padding: 6px 12px !important;
                    background: var(--card-bg) !important;
                    color: var(--text-primary) !important;
                    cursor: pointer !important;
                    transition: all 0.2s !important;
                    font-size: 13px !important;
                }

                .dataTables_wrapper .paginate_button:hover {
                    background-color: var(--light-bg) !important;
                    border-color: var(--primary-color) !important;
                }

                .dataTables_wrapper .paginate_button.current {
                    background-color: var(--primary-color) !important;
                    color: white !important;
                    border-color: var(--primary-color) !important;
                }

                .dataTables_wrapper .dataTables_length {
                    padding: 15px 20px !important;
                    color: var(--text-secondary) !important;
                }

                .dataTables_wrapper .dataTables_length select {
                    border: 1px solid var(--border-color) !important;
                    border-radius: 6px !important;
                    padding: 6px 8px !important;
                    margin: 0 8px !important;
                    background: var(--card-bg) !important;
                    color: var(--text-primary) !important;
                    cursor: pointer !important;
                }

                @media (max-width: 768px) {
                    .emrp-report-header {
                        padding: 20px;
                    }

                    .emrp-report-header h1 {
                        font-size: 22px;
                    }

                    .emrp-datatable-controls {
                        flex-direction: column;
                        align-items: flex-start;
                    }

                    .dataTables_wrapper .dt-buttons {
                        float: left !important;
                    }

                    .emrp-datatable-content {
                        padding: 15px;
                    }

                    .emrp-datatable-content thead th {
                        padding: 10px;
                        font-size: 12px;
                    }

                    .emrp-datatable-content tbody td {
                        padding: 8px 10px;
                        font-size: 12px;
                    }
                }
            </style>
        </head>

        <body>

            <?php include($_SESSION['EMRP_BASE_DIR'] . "/app/views/includes/emrp_headerpanel.php"); ?>

            <div class="emrp-report-container">
                <div class="emrp-report-header">
                    <h1>📋 <?php echo htmlspecialchars($args['report_name']); ?></h1>
                    <p>Comprehensive data report with advanced filtering and export options</p>
                </div>

                <div class="emrp-datatable-wrapper">
                    <div class="emrp-datatable-content">
                        <!-- Data table starts -->
                        <table id="reportdata" class="table table-striped table-bordered" style="width:100%">
                            <thead>
                                <tr>
                                    <?php foreach ($args['selectedcolumns'] as $selectedcolumn) { ?>
                                        <th name="<?php echo htmlspecialchars($selectedcolumn); ?>"><?php echo htmlspecialchars($selectedcolumn); ?></th>
                                    <?php } ?>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                        <!-- Data table ends -->
                    </div>
                </div>
            </div>

            <?php include($_SESSION['EMRP_BASE_DIR'] . "/app/views/includes/emrp_footer.php");
            include($_SESSION['EMRP_BASE_DIR'] . "/app/views/includes/include_scripts.php");
            include($_SESSION['EMRP_BASE_DIR'] . "/app/views/includes/include_datatable_scripts.php");
            ?>

            <script src="https://cdnjs.cloudflare.com/ajax/libs/metisMenu/2.7.4/metisMenu.min.js"></script>

            <script>
                $(document).ready(function() {

                    var table = $('#reportdata').DataTable({
                        scrollY: 400,
                        "sScrollX": "100%",
                        "sScrollXInner": "110%",
                        "bScrollCollapse": true,
                        "iDisplayLength": 50,
                        language: {
                            search: "_INPUT_",
                            searchPlaceholder: "Search report data...",
                            "lengthMenu": 'Show <select>' +
                                '<option value="10">10</option>' +
                                '<option value="25">25</option>' +
                                '<option value="50">50</option>' +
                                '<option value="100">100</option>' +
                                '<option value="200">200</option>' +
                                '<option value="500">500</option>' +
                                '<option value="-1">All</option>' +
                                '</select> entries'
                        },
                        "dom": '<lf<t>ip>B',
                        buttons: [{
                                extend: 'excel',
                                text: '📊 Excel',
                                className: 'btn-excel'
                            },
                            {
                                extend: 'csv',
                                text: '📄 CSV',
                                className: 'btn-csv'
                            },
                            {
                                extend: 'pdf',
                                text: '📑 PDF',
                                className: 'btn-pdf'
                            },
                            {
                                extend: 'colvis',
                                text: '👁️ Columns',
                                className: 'btn-columns'
                            }
                        ],
                        paging: true,
                        processing: true,
                        serverSide: true,
                        ajax: {
                            url: "<?php echo $_SESSION['EMRP_BASE_URL']; ?>modules/chmreports/chm_ajaxssp_getdatatablerecords.php",
                            type: 'POST'
                        }
                    });

                    table.buttons().container()
                        .insertBefore('#reportdata_filter');
                });
            </script>

            <script>
                table.buttons().container()
                    .appendTo($('.col-sm-6:eq(0)', table.table().container()));
            </script>

        </body>

        </html>

<?php
    }
}

?>
