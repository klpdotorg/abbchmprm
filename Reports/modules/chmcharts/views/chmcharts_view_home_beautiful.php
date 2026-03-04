<?php

// session_start();
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

class chmcharts_view_home_beautiful
{

    function show($args = "", $arrErrorMsg = "")
    {

        $charts = $args['charts'];
        $chartsdata = $args['chartsdata'];

        $chartsdata_chart1_json = json_encode($chartsdata[0]);
        $chartsdata_chart2_json = json_encode($chartsdata[1]);
        $chartsdata_chart3_json = json_encode($chartsdata[2]);
        $chartsdata_chart4_json = json_encode($chartsdata[3]);

?>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>EMRP Reports Portal - Charts</title>
            <?php include($_SESSION['EMRP_BASE_DIR'] . "/app/views/includes/emrp_header.php");
            include($_SESSION['EMRP_BASE_DIR'] . "/app/views/includes/include_mdchart_cssfiles.php");
            ?>
            <style>
                :root {
                    --primary-color: #0d4b7e;
                    --secondary-color: #499bea;
                    --accent-color: #2d74b4;
                    --success-color: #10b981;
                    --danger-color: #ef4444;
                    --warning-color: #f59e0b;
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
                    color: var(--text-primary);
                }

                .emrp-charts-container {
                    padding: 30px 20px;
                    max-width: 1400px;
                    margin: 0 auto;
                }

                .emrp-charts-header {
                    margin-bottom: 40px;
                }

                .emrp-charts-header h1 {
                    font-size: 32px;
                    font-weight: 700;
                    color: var(--primary-color);
                    margin: 0 0 10px 0;
                }

                .emrp-charts-header p {
                    color: var(--text-secondary);
                    font-size: 16px;
                    margin: 0;
                }

                .emrp-charts-grid {
                    display: grid;
                    grid-template-columns: repeat(auto-fit, minmax(500px, 1fr));
                    gap: 25px;
                }

                .emrp-chart-card {
                    background: var(--card-bg);
                    border-radius: 12px;
                    box-shadow: var(--shadow-md);
                    overflow: hidden;
                    transition: all 0.3s ease;
                    border: 1px solid var(--border-color);
                }

                .emrp-chart-card:hover {
                    box-shadow: var(--shadow-lg);
                    transform: translateY(-2px);
                }

                .emrp-chart-card-header {
                    background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
                    padding: 20px;
                    display: flex;
                    align-items: center;
                    justify-content: space-between;
                }

                .emrp-chart-card-header h2 {
                    color: white;
                    margin: 0;
                    font-size: 18px;
                    font-weight: 600;
                    flex: 1;
                }

                .emrp-chart-toggle-btn {
                    background: rgba(255, 255, 255, 0.2);
                    border: none;
                    color: white;
                    padding: 8px 16px;
                    border-radius: 6px;
                    cursor: pointer;
                    font-size: 14px;
                    transition: all 0.2s ease;
                    font-weight: 500;
                }

                .emrp-chart-toggle-btn:hover {
                    background: rgba(255, 255, 255, 0.3);
                    transform: translateY(-1px);
                }

                .emrp-chart-toggle-btn.expanded::after {
                    content: ' ▲';
                }

                .emrp-chart-toggle-btn:not(.expanded)::after {
                    content: ' ▼';
                }

                .emrp-chart-card-body {
                    padding: 0;
                    max-height: 0;
                    overflow: hidden;
                    transition: all 0.3s ease;
                }

                .emrp-chart-card-body.expanded {
                    max-height: 500px;
                    padding: 30px;
                }

                .emrp-chart-canvas-container {
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    min-height: 300px;
                }

                .emrp-chart-canvas-container canvas {
                    width: 100% !important;
                    max-width: 100%;
                }

                /* Responsive Design */
                @media (max-width: 768px) {
                    .emrp-charts-grid {
                        grid-template-columns: 1fr;
                    }

                    .emrp-charts-header h1 {
                        font-size: 24px;
                    }

                    .emrp-charts-container {
                        padding: 20px 15px;
                    }

                    .emrp-chart-card-body.expanded {
                        max-height: 600px;
                    }
                }

                @media (max-width: 480px) {
                    .emrp-charts-header h1 {
                        font-size: 20px;
                    }

                    .emrp-chart-card-header {
                        padding: 15px;
                    }

                    .emrp-chart-card-header h2 {
                        font-size: 16px;
                    }
                }
            </style>
        </head>

        <body>

            <?php include($_SESSION['EMRP_BASE_DIR'] . "/app/views/includes/emrp_headerpanel.php"); ?>

            <div class="emrp-charts-container">
                <div class="emrp-charts-header">
                    <h1>📊 Analytics Dashboard</h1>
                    <p>View comprehensive charts and statistics for CHM Program Performance</p>
                </div>

                <div class="emrp-charts-grid">
                    <!-- Chart Card 1 -->
                    <div class="emrp-chart-card">
                        <div class="emrp-chart-card-header">
                            <h2><?php echo htmlspecialchars($charts[0]['chart_name']); ?></h2>
                            <button class="emrp-chart-toggle-btn" onclick="toggleChart(this, 'chart-body-1')">View</button>
                        </div>
                        <div class="emrp-chart-card-body" id="chart-body-1">
                            <div class="emrp-chart-canvas-container">
                                <canvas id="chart1"></canvas>
                            </div>
                        </div>
                    </div>

                    <!-- Chart Card 2 -->
                    <div class="emrp-chart-card">
                        <div class="emrp-chart-card-header">
                            <h2><?php echo htmlspecialchars($charts[1]['chart_name']); ?></h2>
                            <button class="emrp-chart-toggle-btn" onclick="toggleChart(this, 'chart-body-2')">View</button>
                        </div>
                        <div class="emrp-chart-card-body" id="chart-body-2">
                            <div class="emrp-chart-canvas-container">
                                <canvas id="chart2"></canvas>
                            </div>
                        </div>
                    </div>

                    <!-- Chart Card 3 -->
                    <div class="emrp-chart-card">
                        <div class="emrp-chart-card-header">
                            <h2><?php echo htmlspecialchars($charts[2]['chart_name']); ?></h2>
                            <button class="emrp-chart-toggle-btn" onclick="toggleChart(this, 'chart-body-3')">View</button>
                        </div>
                        <div class="emrp-chart-card-body" id="chart-body-3">
                            <div class="emrp-chart-canvas-container">
                                <canvas id="chart3"></canvas>
                            </div>
                        </div>
                    </div>

                    <!-- Chart Card 4 -->
                    <div class="emrp-chart-card">
                        <div class="emrp-chart-card-header">
                            <h2><?php echo htmlspecialchars($charts[3]['chart_name']); ?></h2>
                            <button class="emrp-chart-toggle-btn" onclick="toggleChart(this, 'chart-body-4')">View</button>
                        </div>
                        <div class="emrp-chart-card-body" id="chart-body-4">
                            <div class="emrp-chart-canvas-container">
                                <canvas id="chart4"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <?php include($_SESSION['EMRP_BASE_DIR'] . "/app/views/includes/emrp_footer.php");
            include($_SESSION['EMRP_BASE_DIR'] . "/app/views/includes/include_scripts.php");
            include($_SESSION['EMRP_BASE_DIR'] . "/app/views/includes/include_mdchart_scripts.php");
            ?>

            <script>
                // Toggle Chart Visibility
                function toggleChart(btn, cardBodyId) {
                    const cardBody = document.getElementById(cardBodyId);
                    cardBody.classList.toggle('expanded');
                    btn.classList.toggle('expanded');
                }

                // Initialize all charts on page load
                document.addEventListener('DOMContentLoaded', function() {
                    // Optionally auto-expand first chart for better UX
                    const firstBtn = document.querySelector('.emrp-chart-toggle-btn');
                    const firstBody = document.getElementById('chart-body-1');
                    firstBtn.classList.add('expanded');
                    firstBody.classList.add('expanded');
                });
            </script>

            <!--  Chart#1  Game Utilization Metrics -->
            <script>
                var labelvalues = new Array();
                var chartdata = new Array();
                var chartvalues = JSON.parse('<?= $chartsdata_chart1_json; ?>');
                var backgroundclr = new Array();
                var borderclr = new Array();

                for (var i = 0; i < chartvalues.length; i++) {
                    var val = chartvalues[i]['GameId'];
                    labelvalues.push(val);
                    chartdata.push(chartvalues[i]['PlaySessions']);

                    backgroundclr.push('rgba(10, 100, 200, 0.7)');
                    borderclr.push('rgba(13, 75, 126, 1)');
                }

                var ctx = document.getElementById("chart1").getContext('2d');

                var dbChart1 = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: labelvalues,
                        datasets: [{
                            label: 'Play Sessions',
                            data: chartdata,
                            backgroundColor: backgroundclr,
                            borderColor: borderclr,
                            borderWidth: 2,
                            borderRadius: 6
                        }]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: true,
                        scales: {
                            yAxes: [{
                                ticks: {
                                    beginAtZero: true,
                                    fontColor: '#6b7280'
                                },
                                gridLines: {
                                    color: 'rgba(107, 114, 128, 0.1)'
                                }
                            }],
                            xAxes: [{
                                ticks: {
                                    autoSkip: false,
                                    fontColor: '#6b7280'
                                },
                                gridLines: {
                                    display: false
                                }
                            }]
                        },
                        legend: {
                            labels: {
                                fontColor: '#1f2937',
                                fontSize: 14,
                                padding: 15
                            }
                        }
                    }
                });
            </script>

            <!--  Chart#2  Weekly Registration Stats -->
            <script>
                var labelvalues = new Array();
                var chartdata = new Array();
                var chartvalues = JSON.parse('<?= $chartsdata_chart2_json; ?>');
                var backgroundclr = new Array();
                var borderclr = new Array();

                for (var i = 0; i < chartvalues.length; i++) {
                    var val = 'Wk#' + chartvalues[i]['RegWeek'];
                    labelvalues.push(val);
                    chartdata.push(chartvalues[i]['RegistrationCount']);

                    backgroundclr.push('rgba(73, 155, 234, 0.7)');
                    borderclr.push('rgba(73, 155, 234, 1)');
                }

                var ctx = document.getElementById("chart2").getContext('2d');

                var dbChart2 = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: labelvalues,
                        datasets: [{
                            label: 'Registration Count',
                            data: chartdata,
                            backgroundColor: backgroundclr,
                            borderColor: borderclr,
                            borderWidth: 2,
                            borderRadius: 6
                        }]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: true,
                        scales: {
                            yAxes: [{
                                ticks: {
                                    beginAtZero: true,
                                    fontColor: '#6b7280'
                                },
                                gridLines: {
                                    color: 'rgba(107, 114, 128, 0.1)'
                                }
                            }],
                            xAxes: [{
                                gridLines: {
                                    display: false
                                },
                                ticks: {
                                    fontColor: '#6b7280'
                                }
                            }]
                        },
                        legend: {
                            labels: {
                                fontColor: '#1f2937',
                                fontSize: 14,
                                padding: 15
                            }
                        }
                    }
                });
            </script>

            <!--  Chart#3  Daily Game Play Session Stats-->
            <script>
                var labelvalues = new Array();
                var chartdata = new Array();
                var chartvalues = JSON.parse('<?= $chartsdata_chart3_json; ?>');
                var backgroundclr = new Array();
                var borderclr = new Array();

                for (var i = 0; i < chartvalues.length; i++) {
                    var val = chartvalues[i]['SessionDate'];
                    labelvalues.push(val);
                    chartdata.push(chartvalues[i]['GameplaySessionsCount']);

                    backgroundclr.push('rgba(248, 113, 113, 0.7)');
                    borderclr.push('rgba(239, 68, 68, 1)');
                }

                var ctx = document.getElementById("chart3").getContext('2d');

                var dbChart3 = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: labelvalues,
                        datasets: [{
                            label: 'Gameplay Sessions Count',
                            data: chartdata,
                            backgroundColor: backgroundclr,
                            borderColor: borderclr,
                            borderWidth: 2,
                            borderRadius: 6
                        }]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: true,
                        scales: {
                            yAxes: [{
                                ticks: {
                                    beginAtZero: true,
                                    fontColor: '#6b7280'
                                },
                                gridLines: {
                                    color: 'rgba(107, 114, 128, 0.1)'
                                }
                            }],
                            xAxes: [{
                                ticks: {
                                    autoSkip: false,
                                    fontColor: '#6b7280'
                                },
                                gridLines: {
                                    display: false
                                }
                            }]
                        },
                        legend: {
                            labels: {
                                fontColor: '#1f2937',
                                fontSize: 14,
                                padding: 15
                            }
                        }
                    }
                });
            </script>

            <!--  Chart#4  Total number of registered Children from Govt School Vs Private School -->
            <script>
                var labelvalues = new Array();
                var chartdata = new Array();
                var chartvalues = JSON.parse('<?= $chartsdata_chart4_json; ?>');
                var backgroundclr = new Array();

                var defaultColors = ['#0d4b7e', '#499bea', '#2d74b4', '#10b981', '#f59e0b', '#ef4444'];

                for (var i = 0; i < chartvalues.length; i++) {
                    var val = chartvalues[i]['School Type'];
                    labelvalues.push(val);
                    chartdata.push(chartvalues[i]['Child Count']);

                    backgroundclr.push(defaultColors[i % defaultColors.length]);
                }

                var ctx = document.getElementById("chart4").getContext('2d');

                var dbChart4 = new Chart(ctx, {
                    type: 'pie',
                    data: {
                        labels: labelvalues,
                        datasets: [{
                            data: chartdata,
                            backgroundColor: backgroundclr,
                            borderColor: '#ffffff',
                            borderWidth: 3
                        }]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: true,
                        legend: {
                            position: 'bottom',
                            labels: {
                                fontColor: '#1f2937',
                                fontSize: 14,
                                padding: 15
                            }
                        },
                        title: {
                            display: true,
                            text: "School Type Distribution",
                            fontColor: '#1f2937'
                        }
                    }
                });
            </script>

        </body>

        </html>
<?php
    }
}

?>
