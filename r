<!DOCTYPE html>

<head>
    
    <title>Registration Form</title>
</head>
<body>
    <h1>Registration Form</h1>
    <form action="#" method="post">
        <!-- Name -->
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>
        <br><br>

        <!-- Username -->
        <label for="username">User Name:</label>
        <input type="text" id="username" name="username" required>
        <br><br>

        <!-- Password -->
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>
        <br><br>

        <!-- Date of Birth -->
        <label for="dob">Date of Birth:</label>
        <input type="date" id="dob" name="dob" required>
        <br><br>

        <!-- Gender -->
        <label for="gender">Gender:</label>
        <input type="radio" id="male" name="gender" value="male" required>
        <label for="male">Male</label>
        <input type="radio" id="female" name="gender" value="female" required>
        <label for="female">Female</label>
        <input type="radio" id="other" name="gender" value="other" required>
        <label for="other">Other</label>
        <br><br>

        <!-- Email -->
        <label for="email">Mail-id:</label>
        <input type="email" id="email" name="email" required>
        <br><br>

        <!-- Contact Number -->
        <label for="contact">Contact Number:</label>
        <input type="tel" id="contact" name="contact" pattern="[0-9]{10}" required>
        <br><br>

        <!-- Address -->
        <label for="address">Address:</label>
        <textarea id="address" name="address" rows="4" cols="30" required></textarea>
        <br><br>

        <!-- Submit Button -->
        <button type="submit">Submit</button>
    </form>
</body>
</html>
