<!DOCTYPE html>
<html>
<head>
    <title>Fibonacci Series in PHP</title>
</head>
<body>
    <h2>Fibonacci Series:</h2>
    <p>
        <?php
            $n = 10; // Number of terms to display
            $num1 = 0;
            $num2 = 1;

            echo $num1 . ", " . $num2;

            for ($i = 2; $i < $n; $i++) {
                $num3 = $num1 + $num2;
                echo ", " . $num3;
                $num1 = $num2;
                $num2 = $num3;
            }
        ?>
    </p>
</body>
</html>
