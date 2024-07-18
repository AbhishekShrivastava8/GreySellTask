<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.task.LinearEquation" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Graph of 5x + 3y = 30</title>
    <!-- Add React and ReactDOM scripts -->
    <script src="https://unpkg.com/react@17/umd/react.development.js" crossorigin></script>
    <script src="https://unpkg.com/react-dom@17/umd/react-dom.development.js" crossorigin></script>
    <script src="https://unpkg.com/@babel/standalone/babel.min.js"></script>
    <!-- Add Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
            background-color: #f9f9f9;
        }
        h1 {
            color: #333;
        }
        #myChart {
            max-width: 600px;
            max-height: 400px;
        }
    </style>
</head>
<body>
    <h1>Graph of 5x + 3y = 30</h1>
    <div id="root"></div>

    <%
    LinearEquation solver = new LinearEquation();
        String solutionsJson = solver.getSolutionsAsJson();
    %>
    
    <script type="text/babel">
        const solutions = <%= solutionsJson %>;

        const App = () => {
            const data = {
                datasets: [
                    {
                        label: 'Solutions to 5x + 3y = 30',
                        data: solutions,
                        backgroundColor: 'rgba(75, 192, 192, 1)',
                        borderColor: 'rgba(75, 192, 192, 1)',
                        pointBackgroundColor: 'rgba(75, 192, 192, 1)',
                        pointBorderColor: '#fff',
                        pointHoverBackgroundColor: '#fff',
                        pointHoverBorderColor: 'rgba(75, 192, 192, 1)',
                        pointRadius: 5,
                        pointHoverRadius: 7,
                    },
                ],
            };

            const options = {
                scales: {
                    x: {
                        title: {
                            display: true,
                            text: 'x',
                            color: '#333',
                            font: {
                                size: 14,
                            },
                        },
                        ticks: {
                            color: '#333',
                        },
                        grid: {
                            color: '#ccc',
                        },
                    },
                    y: {
                        title: {
                            display: true,
                            text: 'y',
                            color: '#333',
                            font: {
                                size: 14,
                            },
                        },
                        ticks: {
                            color: '#333',
                        },
                        grid: {
                            color: '#ccc',
                        },
                    },
                },
                plugins: {
                    legend: {
                        display: true,
                        labels: {
                            color: '#333',
                        },
                    },
                },
                responsive: true,
                maintainAspectRatio: false,
            };

            React.useEffect(() => {
                const ctx = document.getElementById('myChart').getContext('2d');
                new Chart(ctx, {
                    type: 'scatter',
                    data: data,
                    options: options,
                });
            }, []);

            return (
                <div style={{ width: '600px', height: '400px' }}>
                    <canvas id="myChart"></canvas>
                </div>
            );
        };

        ReactDOM.render(<App />, document.getElementById('root'));
    </script>
</body>
</html>
