<!DOCTYPE html>
<html>
<head>
  <title>Star Rating System</title>
</head>
<body>
  <h2>Rate Your Experience</h2>
  <div>
    <span class="star" data-rating="1">&#9733;</span>
    <span class="star" data-rating="2">&#9733;</span>
    <span class="star" data-rating="3">&#9733;</span>
    <span class="star" data-rating="4">&#9733;</span>
    <span class="star" data-rating="5">&#9733;</span>
  </div>
  <div id="rating-output">Rated: 0/5</div>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
    $(function() {
      $('.star').click(function() {
        var rating = $(this).data('rating');
        $('.star').css('color', 'grey'); // Reset all stars
        $(this).prevAll().addBack().css('color', 'goldenrod'); // Highlight up to clicked star
        $('#rating-output').text('Rated: ' + rating + '/5');
      });
    });
  </script>
</body>
</html>
