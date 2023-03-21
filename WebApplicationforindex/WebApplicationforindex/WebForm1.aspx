<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplicationforindex.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="MyStyle.css" rel="stylesheet" type="text/css" />
    </head>


<body>



    <form id="form">
        <input type="search" id="Toimiala" name="q" placeholder="Industry..."/>
        <input type="search" id="Kunta" name="q" placeholder="Municipality..."/>
        <button class="firstButton">Search</button>
    </form>



    <table class="table-container">
        <tr>
            <th style="color:yellow; padding: 5px;">Business ID</th>
            <th style="color:#e04bdd;">Company</th>
            <th>Number</th>
            <th>Email</th>
        </tr>
        <%

            %>
    </table>




</body>

</html>
