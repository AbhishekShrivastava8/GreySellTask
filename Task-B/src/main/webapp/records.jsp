<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.Records"%>
<!DOCTYPE html>
<html>
<head>
<title>Record List</title> 
<style>
.recordShow {
    display: none;
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background: #f1f1f1;
    padding: 20px;
    border: 1px solid #cccccc;
    box-shadow: 0 4px 8px rgba(0,0,0,0.2);
    max-width: 300px;
    text-align: center;
    font-family: Arial, sans-serif;
}

.popup button.close {
    position: absolute;
    top: 10px;
    right: 10px;
    background-color: #e74c3c;
    color: #fff;
    border: none;
    padding: 5px 10px;
    cursor: pointer;
    border-radius: 4px;
}
</style>
<script>
	function viewRecord(email) 
	{
    var popup = document.getElementById('recordShow');
    popup.innerHTML = 'This is a simple popup! Click anywhere outside to close.';
	<%   
		List<Records> records11 = (List<Records>) request.getAttribute("records");
		for (Records record : records11) {
	%>
	var mail = '<%=record.getEmail()%>';
	if(mail==email)
	{
    popup.innerHTML += '<%=record.getName()%>';
    popup.innerHTML += '<%=record.getEmail()%>';
    popup.innerHTML += '<%=record.getAge()%>';
    popup.innerHTML += '<%=record.getPhone()%>';
	}
    <%}%>
    popup.style.display = 'block';

    // Close the popup if clicked outside of it
    window.onclick = function(event) {
        if (event.target == popup) {
            popup.style.display = 'none';
        }
    }
	}
function closePopup() {
    var popup = document.getElementById('recordShow');
    popup.style.display = 'none';
}
</script>
</head>
<body>
	<h1>Record List</h1>
	<table border="1">
		<tr>
			<th>Email</th>
			<th>Actions</th>
		</tr>
		<%   
			List<Records> records = (List<Records>) request.getAttribute("records");
			for (Records record : records) {
        %>
		<tr>
			<td><%= record.getEmail() %></td>
			<td>
				<button onclick="viewRecord('<%= record.getEmail() %>')">View</button>
			</td>
		</tr>
		<% } %>
	</table>
	<br />
	<a href="index.jsp">Add New Record</a>

	<!--     show popup -->
<div id="recordShow" class="popup">
    <!-- Inner content will be dynamically set by JavaScript -->
    <button class="close" onclick="closePopup()">Close</button>
</div>

</body>
</html>