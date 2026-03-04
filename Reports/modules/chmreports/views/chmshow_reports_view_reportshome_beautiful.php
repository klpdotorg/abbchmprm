<?php

// session_start();
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

class chmshow_reports_view_reportshome_beautiful
{

    function show($args = "", $arrErrorMsg = "")
    {

?>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>EMRP Reports Portal - Available Reports</title>
            <?php include($_SESSION['EMRP_BASE_DIR'] . "/app/views/includes/emrp_header.php"); ?>

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
                    --shadow-sm: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
                    --shadow-md: 0 4px 6px 0 rgba(0, 0, 0, 0.1);
                    --shadow-lg: 0 10px 15px 0 rgba(0, 0, 0, 0.1);
                }

                body {
                    background-color: var(--light-bg);
                    font-family: 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
                }

                .emrp-reports-container {
                    padding: 30px 20px;
                    max-width: 1400px;
                    margin: 0 auto;
                }

                .emrp-reports-header {
                    margin-bottom: 40px;
                }

                .emrp-reports-header h1 {
                    font-size: 32px;
                    font-weight: 700;
                    color: var(--primary-color);
                    margin: 0 0 10px 0;
                }

                .emrp-reports-header p {
                    color: var(--text-secondary);
                    font-size: 16px;
                    margin: 0;
                }

                .emrp-search-box {
                    margin-bottom: 30px;
                }

                .emrp-search-box input {
                    width: 100%;
                    max-width: 400px;
                    padding: 12px 16px;
                    border: 1px solid var(--border-color);
                    border-radius: 8px;
                    font-size: 14px;
                    transition: all 0.2s;
                }

                .emrp-search-box input:focus {
                    outline: none;
                    border-color: var(--primary-color);
                    box-shadow: 0 0 0 3px rgba(13, 75, 126, 0.1);
                }

                .emrp-reports-section {
                    margin-bottom: 50px;
                }

                .emrp-section-title {
                    font-size: 22px;
                    font-weight: 600;
                    color: white;
                    background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
                    padding: 16px 20px;
                    border-radius: 8px;
                    margin-bottom: 20px;
                    display: flex;
                    align-items: center;
                    gap: 10px;
                }

                .emrp-section-icon {
                    font-size: 24px;
                }

                .emrp-reports-grid {
                    display: grid;
                    grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
                    gap: 20px;
                }

                .emrp-report-card {
                    background: var(--card-bg);
                    border-radius: 10px;
                    border: 1px solid var(--border-color);
                    box-shadow: var(--shadow-md);
                    transition: all 0.3s ease;
                    overflow: hidden;
                    display: flex;
                    flex-direction: column;
                }

                .emrp-report-card:hover {
                    transform: translateY(-4px);
                    box-shadow: var(--shadow-lg);
                    border-color: var(--primary-color);
                }

                .emrp-report-card-icon {
                    font-size: 40px;
                    padding: 20px;
                    background: linear-gradient(135deg, rgba(13, 75, 126, 0.1) 0%, rgba(73, 155, 234, 0.1) 100%);
                    text-align: center;
                }

                .emrp-report-card-content {
                    padding: 20px;
                    flex-grow: 1;
                    display: flex;
                    flex-direction: column;
                }

                .emrp-report-card-title {
                    font-size: 16px;
                    font-weight: 600;
                    color: var(--text-primary);
                    margin: 0 0 8px 0;
                    word-wrap: break-word;
                }

                .emrp-report-card-description {
                    font-size: 13px;
                    color: var(--text-secondary);
                    margin: 0 0 15px 0;
                    flex-grow: 1;
                    line-height: 1.5;
                }

                .emrp-report-card-actions {
                    display: flex;
                    gap: 8px;
                    margin-top: auto;
                }

                .emrp-report-card-btn {
                    flex: 1;
                    padding: 8px 12px;
                    border: none;
                    border-radius: 6px;
                    cursor: pointer;
                    font-size: 13px;
                    font-weight: 500;
                    transition: all 0.2s;
                    text-decoration: none;
                    text-align: center;
                    display: inline-block;
                }

                .emrp-report-card-btn.view {
                    background-color: var(--primary-color);
                    color: white;
                }

                .emrp-report-card-btn.view:hover {
                    background-color: var(--accent-color);
                    transform: translateY(-1px);
                }

                .emrp-report-card-btn.edit {
                    background-color: var(--light-bg);
                    color: var(--primary-color);
                    border: 1px solid var(--primary-color);
                }

                .emrp-report-card-btn.edit:hover {
                    background-color: rgba(13, 75, 126, 0.05);
                }

                .emrp-report-card-btn img {
                    width: 16px;
                    height: 16px;
                    margin-right: 5px;
                    vertical-align: middle;
                }

                .emrp-no-reports {
                    text-align: center;
                    padding: 40px;
                    color: var(--text-secondary);
                }

                .emrp-no-reports p {
                    font-size: 16px;
                    margin: 0;
                }

                @media (max-width: 768px) {
                    .emrp-reports-container {
                        padding: 20px 15px;
                    }

                    .emrp-reports-header h1 {
                        font-size: 24px;
                    }

                    .emrp-reports-grid {
                        grid-template-columns: 1fr;
                    }

                    .emrp-section-title {
                        font-size: 18px;
                    }
                }
            </style>
        </head>

        <body>

            <?php include($_SESSION['EMRP_BASE_DIR'] . "/app/views/includes/emrp_headerpanel.php"); ?>

            <div class="emrp-reports-container">
                <div class="emrp-reports-header">
                    <h1>📚 Available Reports</h1>
                    <p>Browse and access comprehensive reports organized by category</p>
                </div>

                <div class="emrp-search-box">
                    <input type="text" id="reportSearch" placeholder="🔍 Search reports..." onclick="filterReports()">
                </div>

                <?php
                if (isset($args['arrAllReports']) && !empty($args['arrAllReports'])) {
                    $previous_groupid = 0;
                    $group_reports = array();

                    // Group reports by group_id
                    foreach ($args['arrAllReports'] as $report) {
                        $group_id = $report['group_id'];
                        if (!isset($group_reports[$group_id])) {
                            $group_reports[$group_id] = array(
                                'group_name' => $report['group_name'],
                                'reports' => array()
                            );
                        }
                        $group_reports[$group_id]['reports'][] = $report;
                    }

                    // Display grouped reports
                    foreach ($group_reports as $group_id => $group_data) {
                ?>
                        <div class="emrp-reports-section">
                            <div class="emrp-section-title">
                                <span class="emrp-section-icon">📊</span>
                                <?php echo htmlspecialchars($group_data['group_name']); ?>
                            </div>

                            <div class="emrp-reports-grid">
                                <?php
                                foreach ($group_data['reports'] as $report) {
                                ?>
                                    <div class="emrp-report-card" data-report-name="<?php echo strtolower(htmlspecialchars($report['report_name'])); ?>">
                                        <div class="emrp-report-card-icon">📈</div>
                                        <div class="emrp-report-card-content">
                                            <h3 class="emrp-report-card-title"><?php echo htmlspecialchars($report['report_name']); ?></h3>
                                            <p class="emrp-report-card-description"><?php echo htmlspecialchars($report['report_description']); ?></p>
                                            <div class="emrp-report-card-actions">
                                                <a href="<?php echo $_SESSION['EMRP_BASE_URL'] . $cfg_chmreportscontroller; ?>?taskname=show_report_view_datatable_default&report_id=<?php echo htmlspecialchars($report['report_id']); ?>" class="emrp-report-card-btn view">View Report</a>
                                                <button class="emrp-report-card-btn edit" data-toggle="modal" data-backdrop="static" href="#modalshowcolumns<?php echo htmlspecialchars($report['report_id']); ?>"><img src="<?php echo $_app_images_dir_url; ?>/ic_edit.png" alt="Edit"> Customize</button>
                                            </div>
                                        </div>
                                    </div>
                                <?php
                                }
                                ?>
                            </div>
                        </div>
                    <?php
                    }
                    ?>

                    <!-- Include all modals -->
                    <?php
                    foreach ($args['arrAllReports'] as $allReports) {
                        include($_SESSION['EMRP_BASE_DIR'] . "/modules/chmreports/views/chmshow_modal_reportcolumns_beautiful.php");
                    }
                    ?>

                <?php
                } else {
                ?>
                    <div class="emrp-no-reports">
                        <p>📭 No reports available at the moment.</p>
                    </div>
                <?php
                }
                ?>
            </div>

            <?php include($_SESSION['EMRP_BASE_DIR'] . "/app/views/includes/emrp_footer.php");  ?>
            <?php include($_SESSION['EMRP_BASE_DIR'] . "/app/views/includes/include_scripts.php"); ?>

            <script src="https://cdnjs.cloudflare.com/ajax/libs/metisMenu/2.7.4/metisMenu.min.js"></script>

            <script>
                function filterReports() {
                    const searchInput = document.getElementById('reportSearch').value.toLowerCase();
                    const reportCards = document.querySelectorAll('.emrp-report-card');

                    reportCards.forEach(card => {
                        const reportName = card.getAttribute('data-report-name');
                        if (reportName.includes(searchInput)) {
                            card.style.display = 'flex';
                        } else {
                            card.style.display = 'none';
                        }
                    });
                }

                // Add search functionality on key input
                document.getElementById('reportSearch').addEventListener('keyup', filterReports);

                // Add animation on page load
                document.addEventListener('DOMContentLoaded', function() {
                    const cards = document.querySelectorAll('.emrp-report-card');
                    cards.forEach((card, index) => {
                        card.style.opacity = '0';
                        card.style.animation = `fadeInUp 0.5s ease ${index * 0.05}s forwards`;
                    });
                });
            </script>

            <style>
                @keyframes fadeInUp {
                    from {
                        opacity: 0;
                        transform: translateY(10px);
                    }

                    to {
                        opacity: 1;
                        transform: translateY(0);
                    }
                }
            </style>

        </body>

        </html>

<?php
    }
}

?>
