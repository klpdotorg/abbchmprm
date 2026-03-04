<?php

if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

class chmcharts_view_home1
{
    function show($args = "", $arrErrorMsg = "")
    {
        $charts = isset($args['charts']) ? $args['charts'] : array();
        $chartsdata = isset($args['chartsdata']) ? $args['chartsdata'] : array();

        $chartsdata_chart1_json = json_encode(isset($chartsdata[0]) ? $chartsdata[0] : array());
        $chartsdata_chart2_json = json_encode(isset($chartsdata[1]) ? $chartsdata[1] : array());
        $chartsdata_chart3_json = json_encode(isset($chartsdata[2]) ? $chartsdata[2] : array());
        $chartsdata_chart4_json = json_encode(isset($chartsdata[3]) ? $chartsdata[3] : array());

        $chart1_name = isset($charts[0]['chart_name']) ? htmlspecialchars($charts[0]['chart_name']) : 'Chart 1';
        $chart2_name = isset($charts[1]['chart_name']) ? htmlspecialchars($charts[1]['chart_name']) : 'Chart 2';
        $chart3_name = isset($charts[2]['chart_name']) ? htmlspecialchars($charts[2]['chart_name']) : 'Chart 3';
        $chart4_name = isset($charts[3]['chart_name']) ? htmlspecialchars($charts[3]['chart_name']) : 'Chart 4';
?>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>EMRP Reports Portal - CHM Dashboard</title>
            <?php
            include($_SESSION['EMRP_BASE_DIR'] . "/app/views/includes/emrp_header.php");
            include($_SESSION['EMRP_BASE_DIR'] . "/app/views/includes/include_mdchart_cssfiles.php");
            ?>
            <style>
                :root {
                    --bg-0: #f6f2ea;
                    --bg-1: #ede4d6;
                    --surface: #fffdf8;
                    --surface-2: #fff;
                    --ink: #1e2430;
                    --ink-soft: #566074;
                    --line: #e7d9bf;
                    --primary: #2f7f6f;
                    --primary-strong: #245e53;
                    --accent: #ce613f;
                    --gold: #d09a2f;
                    --shadow: 0 12px 28px rgba(45, 52, 66, 0.12);
                }

                body {
                    margin: 0;
                    background:
                        radial-gradient(circle at 2% 5%, rgba(206, 97, 63, 0.12), transparent 35%),
                        radial-gradient(circle at 95% 12%, rgba(47, 127, 111, 0.14), transparent 30%),
                        linear-gradient(180deg, var(--bg-0) 0%, var(--bg-1) 100%);
                    color: var(--ink);
                    font-family: "Trebuchet MS", "Verdana", sans-serif;
                }

                .charts-shell {
                    max-width: 1340px;
                    margin: 0 auto;
                    padding: 24px 20px 32px;
                }

                .hero {
                    border: 1px solid var(--line);
                    background: linear-gradient(120deg, rgba(255, 255, 255, 0.86), rgba(255, 251, 244, 0.94));
                    border-radius: 18px;
                    padding: 24px 24px 18px;
                    box-shadow: var(--shadow);
                    margin-bottom: 20px;
                }

                .hero h1 {
                    margin: 0;
                    font-family: Georgia, "Times New Roman", serif;
                    font-size: 34px;
                    letter-spacing: 0.3px;
                    color: var(--primary-strong);
                }

                .hero p {
                    margin: 8px 0 0;
                    color: var(--ink-soft);
                    font-size: 15px;
                }

                .chip-row {
                    margin-top: 16px;
                    display: flex;
                    flex-wrap: wrap;
                    gap: 10px;
                }

                .chip {
                    border: 1px solid var(--line);
                    background: #fff;
                    border-radius: 999px;
                    padding: 6px 12px;
                    font-size: 12px;
                    color: #4f5a6c;
                }

                .charts-grid {
                    display: grid;
                    grid-template-columns: repeat(2, minmax(0, 1fr));
                    gap: 16px;
                }

                .chart-card {
                    border: 1px solid var(--line);
                    border-radius: 16px;
                    overflow: hidden;
                    background: var(--surface-2);
                    box-shadow: var(--shadow);
                }

                .chart-head {
                    display: flex;
                    align-items: center;
                    justify-content: space-between;
                    gap: 12px;
                    padding: 14px 16px;
                    border-bottom: 1px solid var(--line);
                    background: linear-gradient(90deg, rgba(47, 127, 111, 0.08), rgba(208, 154, 47, 0.12));
                }

                .chart-head h2 {
                    margin: 0;
                    font-size: 17px;
                    line-height: 1.35;
                    color: var(--ink);
                }

                .toggle-btn {
                    border: 1px solid #2a6f61;
                    background: var(--primary);
                    color: #fff;
                    border-radius: 10px;
                    padding: 6px 12px;
                    font-size: 13px;
                    font-weight: 600;
                    cursor: pointer;
                    transition: all 0.2s ease;
                }

                .toggle-btn:hover {
                    background: var(--primary-strong);
                }

                .chart-body {
                    padding: 14px 16px 16px;
                    display: none;
                    background: var(--surface);
                }

                .chart-body.active {
                    display: block;
                }

                .chart-canvas-wrap {
                    position: relative;
                    width: 100%;
                    min-height: 320px;
                }

                .chart-canvas-wrap canvas {
                    width: 100% !important;
                    height: 320px !important;
                }

                @media (max-width: 960px) {
                    .charts-grid {
                        grid-template-columns: 1fr;
                    }

                    .hero h1 {
                        font-size: 28px;
                    }
                }
            </style>
        </head>

        <body>
            <?php include($_SESSION['EMRP_BASE_DIR'] . "/app/views/includes/emrp_headerpanel.php"); ?>

            <div class="charts-shell">
                <section class="hero">
                    <h1>CHM Analytics Studio</h1>
                    <p>Explore charted insights for gameplay, registration trends, daily sessions, and school distribution.</p>
                    <div class="chip-row">
                        <span class="chip">Interactive Charts</span>
                        <span class="chip">CHM Program Metrics</span>
                        <span class="chip">Daily and Weekly Views</span>
                    </div>
                </section>

                <section class="charts-grid">
                    <article class="chart-card">
                        <header class="chart-head">
                            <h2><?php echo $chart1_name; ?></h2>
                            <button class="toggle-btn" data-target="chart-panel-1">Hide</button>
                        </header>
                        <div class="chart-body active" id="chart-panel-1">
                            <div class="chart-canvas-wrap"><canvas id="chart1"></canvas></div>
                        </div>
                    </article>

                    <article class="chart-card">
                        <header class="chart-head">
                            <h2><?php echo $chart2_name; ?></h2>
                            <button class="toggle-btn" data-target="chart-panel-2">Hide</button>
                        </header>
                        <div class="chart-body active" id="chart-panel-2">
                            <div class="chart-canvas-wrap"><canvas id="chart2"></canvas></div>
                        </div>
                    </article>

                    <article class="chart-card">
                        <header class="chart-head">
                            <h2><?php echo $chart3_name; ?></h2>
                            <button class="toggle-btn" data-target="chart-panel-3">Hide</button>
                        </header>
                        <div class="chart-body active" id="chart-panel-3">
                            <div class="chart-canvas-wrap"><canvas id="chart3"></canvas></div>
                        </div>
                    </article>

                    <article class="chart-card">
                        <header class="chart-head">
                            <h2><?php echo $chart4_name; ?></h2>
                            <button class="toggle-btn" data-target="chart-panel-4">Hide</button>
                        </header>
                        <div class="chart-body active" id="chart-panel-4">
                            <div class="chart-canvas-wrap"><canvas id="chart4"></canvas></div>
                        </div>
                    </article>
                </section>
            </div>

            <?php
            include($_SESSION['EMRP_BASE_DIR'] . "/app/views/includes/emrp_footer.php");
            include($_SESSION['EMRP_BASE_DIR'] . "/app/views/includes/include_scripts.php");
            include($_SESSION['EMRP_BASE_DIR'] . "/app/views/includes/include_mdchart_scripts.php");
            ?>

            <script>
                document.querySelectorAll('.toggle-btn').forEach(function(btn) {
                    btn.addEventListener('click', function() {
                        var panel = document.getElementById(btn.getAttribute('data-target'));
                        panel.classList.toggle('active');
                        btn.textContent = panel.classList.contains('active') ? 'Hide' : 'Show';
                    });
                });

                function makeBarChart(canvasId, chartvalues, labelKey, valueKey, labelPrefix, barColor, borderColor) {
                    var labels = [];
                    var values = [];
                    var backgrounds = [];
                    var borders = [];

                    for (var i = 0; i < chartvalues.length; i++) {
                        var lbl = labelPrefix ? (labelPrefix + chartvalues[i][labelKey]) : chartvalues[i][labelKey];
                        labels.push(lbl);
                        values.push(chartvalues[i][valueKey]);
                        backgrounds.push(barColor);
                        borders.push(borderColor);
                    }

                    var ctx = document.getElementById(canvasId).getContext('2d');
                    return new Chart(ctx, {
                        type: 'bar',
                        data: {
                            labels: labels,
                            datasets: [{
                                data: values,
                                backgroundColor: backgrounds,
                                borderColor: borders,
                                borderWidth: 2,
                                borderRadius: 6
                            }]
                        },
                        options: {
                            responsive: true,
                            maintainAspectRatio: false,
                            legend: {
                                display: false
                            },
                            scales: {
                                yAxes: [{
                                    ticks: {
                                        beginAtZero: true,
                                        fontColor: '#566074'
                                    },
                                    gridLines: {
                                        color: 'rgba(86, 96, 116, 0.12)'
                                    }
                                }],
                                xAxes: [{
                                    ticks: {
                                        autoSkip: false,
                                        fontColor: '#566074'
                                    },
                                    gridLines: {
                                        display: false
                                    }
                                }]
                            }
                        }
                    });
                }

                var chartvalues1 = JSON.parse('<?= $chartsdata_chart1_json; ?>');
                makeBarChart('chart1', chartvalues1, 'GameId', 'PlaySessions', '', 'rgba(47, 127, 111, 0.72)', 'rgba(36, 94, 83, 1)');

                var chartvalues2 = JSON.parse('<?= $chartsdata_chart2_json; ?>');
                makeBarChart('chart2', chartvalues2, 'RegWeek', 'RegistrationCount', 'Wk#', 'rgba(208, 154, 47, 0.75)', 'rgba(173, 123, 27, 1)');

                var chartvalues3 = JSON.parse('<?= $chartsdata_chart3_json; ?>');
                makeBarChart('chart3', chartvalues3, 'SessionDate', 'GameplaySessionsCount', '', 'rgba(206, 97, 63, 0.74)', 'rgba(167, 70, 39, 1)');

                var labelvalues = [];
                var chartdata = [];
                var chartvalues4 = JSON.parse('<?= $chartsdata_chart4_json; ?>');
                var backgroundclr = ['#2f7f6f', '#d09a2f', '#ce613f', '#417ba8', '#8a6bbf', '#5b7f38'];

                for (var i = 0; i < chartvalues4.length; i++) {
                    labelvalues.push(chartvalues4[i]['School Type']);
                    chartdata.push(chartvalues4[i]['Child Count']);
                }

                var ctx4 = document.getElementById("chart4").getContext('2d');
                new Chart(ctx4, {
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
                        maintainAspectRatio: false,
                        legend: {
                            position: 'bottom',
                            labels: {
                                fontColor: '#2d3442',
                                fontSize: 12
                            }
                        },
                        title: {
                            display: true,
                            text: 'School Type Distribution',
                            fontColor: '#2d3442',
                            fontSize: 14
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
