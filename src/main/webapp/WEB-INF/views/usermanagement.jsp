<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import= "com.abccarsportal.ABCCarsPortal.dao.User" %>
<%@ page import= "com.abccarsportal.ABCCarsPortal.dao.Role" %>
<%@ page import= "java.util.List" %>
<%! 
    private boolean userHasAdminRole(User user) {
        for (Role role : user.getRoles()) {
            if (role.getRoleName().equals("ADMIN")) {
                return true;
            }
        }
        return false;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Management</title>
	<link rel="stylesheet" href="/css/usermanagement.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="icon" type="image/x-icon" href="/images/favicon.png">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Bungee+Spice&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Alatsi&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,100;0,300;0,400;0,700;0,900;1,100;1,300;1,400;1,700;1,900&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
</head>
<body>

<%@ include file="header.jsp"%>
	
<div class="jumbotron" id="head-text">
    <h3 class="text-center" id="text">ABC Cars</h3>
    <h1 class="text-center" id="heading">User Management</h1>
</div>

<div class="container" id="container2">
    <!-- Registered Users -->
    <div id="userList">
        <h2 class="h2">Registered Users</h2>
        <hr class="h-line">
        <table class="table mt-3">
            <thead>
                <tr>
                	<th>User Id</th>
                    <th>Name</th>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Phone Number</th>
                    <th>Registration Date</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <!-- Loop through each user -->
                <% List<User> users = (List<User>) request.getAttribute("users");
                for (User user : users) { %>
                    <% if (!userHasAdminRole(user)) { %>
                        <tr>
                        	<td><%= user.getId() %></td>
                            <td><%= user.getName() %></td>
                            <td><%= user.getUserName() %></td>
                            <td><%= user.getEmail() %></td>
                            <td><%= user.getPhoneNumber() %></td>
                            <td><%= user.getRegistrationDate() %></td>
                            <td>
                                <!-- Update Button -->
                                <button type="button" class="btn btn-primary rounded-circle" data-bs-toggle="modal" data-bs-target="#updateUserModal<%= user.getId() %>">
                                    <i class="fas fa-edit"></i>
                                </button>
                                <!-- Mark as Admin Button -->
                                <form action="/markAsAdmin" method="post" style="display: inline;">
                                    <input type="hidden" name="userId" value="<%= user.getId() %>">
                                    <button type="submit" class="btn btn-success rounded-circle"><i class="fas fa-user-shield"></i></button>
                                </form>
                            </td>
                        </tr>
                    <% } %>
                <% } %>
            </tbody>
        </table>
    </div>
</div>

<!-- Admin Users -->
<div id="container3" class="container">
    <h2 class="h2">Admin Users</h2>
    <hr class="h-line">
    <table class="table mt-3">
        <thead>
            <tr>
            	<th>Admin Id</th>
                <th>Name</th>
                <th>Username</th>
                <th>Email</th>
                <th>Phone Number</th>
                <th>Registration Date</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <!-- Loop through each user -->
            <% for (User user : users) { %>
                <% if (userHasAdminRole(user)) { %>
                    <tr>
                    	<td><%= user.getId() %></td>
                        <td><%= user.getName() %></td>
                        <td><%= user.getUserName() %></td>
                        <td><%= user.getEmail() %></td>
                        <td><%= user.getPhoneNumber() %></td>
                        <td><%= user.getRegistrationDate() %></td>
                        <td>
                            <!-- Update Button -->
                            <button type="button" class="btn btn-primary rounded-circle" data-bs-toggle="modal" data-bs-target="#updateUserModal<%= user.getId() %>">
                                <i class="fas fa-edit"></i>
                            </button>
                            <!-- Other actions -->
                        </td>
                    </tr>
                <% } %>
            <% } %>
        </tbody>
    </table>
</div>

<!-- Update User Modal -->
<% for (User user : users) { %>
    <div class="modal fade" id="updateUserModal<%= user.getId() %>" tabindex="-1" role="dialog" aria-labelledby="updateUserModalLabel<%= user.getId() %>" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="updateUserModalLabel<%= user.getId() %>">Update User</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <!-- Update User Form -->
                    <form action="/updateUser" method="post">
                        <input type="hidden" name="id" value="<%= user.getId() %>">
                        <div class="mb-3">
                            <label for="name" class="form-label">Name</label>
                            <input type="text" class="form-control" id="name" name="name" value="<%= user.getName() %>">
                        </div>
                        <div class="mb-3">
                            <label for="username" class="form-label">Username</label>
                            <input type="text" class="form-control" id="username" name="userName" value="<%= user.getUserName() %>">
                        </div>
                        <div class="mb-3">
                            <label for="phone" class="form-label">Phone Number</label>
                            <input type="text" class="form-control" id="phone" name="phoneNumber" value="<%= user.getPhoneNumber() %>">
                        </div>
                        <button type="submit" class="btn btn-primary">Save Changes</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
<% } %>

<%@ include file="footer.jsp"%>

</body>
</html>