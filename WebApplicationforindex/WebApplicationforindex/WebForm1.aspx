<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplicationforindex.WebForm1" %>

<!DOCTYPE html>

<% double result;
    string toimiala;
    string kaupunki;


    if(Request.Form.Count == 0)
    {
        result = 0;
    }
    else
        switch (Request.Form["search"])
        {
            case "Helsinki":
                kaupunki = "Helsinki";
                break;
            case "Espoo":
                kaupunki = "Espoo";
                break;
            case "Lahti":
                kaupunki = "Lahti";
                break;


        }
    switch (Request.Form["search1"])
    {
        case "Kuljetus":
            toimiala = "Kuljetus";
            break;
        case "Ravintola":
            toimiala = "Ravintola";
            break;
        case "Elintarvike":
            toimiala = "Elintarvike";
            break;
    }


    %>



<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="MyStyle.css" rel="stylesheet" type="text/css" />
    </head>


<body>



    <form id="form" runat="server" method="post" action="WebForm1.aspx">

        <input type="search" id="Toimiala" name="search" placeholder="Industry..."/>
        <input type="search" id="Kunta" name="search2" placeholder="Municipality..."/>
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
