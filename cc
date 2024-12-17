<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Change Shape and Color</title>
    <style>
        /* Block style */
        #block {
            width: 100px;
            height: 100px;
            background-color: red;
            margin: 50px auto;
            transition: 0.3s;
        }

        /* Rounded class for circle */
        .circle {
            border-radius: 50%;
        }

        /* Button style */
        button {
            display: block;
            margin: 10px auto;
            padding: 10px;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <!-- Block -->
    <div id="block"></div>

    <!-- Button -->
    <button id="changeBtn">Change</button>

    <!-- JavaScript -->
    <script>
        // Get the block and button
        const block = document.getElementById("block");
        const button = document.getElementById("changeBtn");

        // Add button click event
        button.onclick = function () {
            // Change shape
            block.classList.toggle("circle");

            // Change color randomly
            block.style.backgroundColor = block.style.backgroundColor === "red" ? "blue" : "red";
        };
    </script>
</body>
</html>
