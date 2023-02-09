<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<title>길이 변환</title>
</head>
<body>

	<form method="post" action="/jsp/test/test05.jsp" class="container mt-2">
		<h2>길이 변환</h2>
		<div class="d-flex align-items-end mb-1">
			<input type="text" name="length" class="form-control col-2 mr-1"><span class="font-weight-bold">cm</span>
		</div>
		<div>
			<label>인치<input type="checkbox" name="unit" value="inch"></label>
			<label>야드<input type="checkbox" name="unit" value="yard"></label>
			<label>피트<input type="checkbox" name="unit" value="feet"></label>
			<label>미터<input type="checkbox" name="unit" value="meter"></label>
		</div>
		<button type="submit" class="btn btn-success">변환</button>
	</form>
	
</body>
</html>