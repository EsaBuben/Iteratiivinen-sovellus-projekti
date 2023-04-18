<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplicationforindex.WebForm1" %>
<%@ Import Namespace="System.IO"%>
<%@ Import Namespace="System.Net"%>
<!DOCTYPE html>
<%
    string kaupunki = Request.Form["search1"];
    string toimiala = Request.Form["search2"];
%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="MyStyle.css" rel="stylesheet" type="text/css" />
    </head>

<body>

        <form id="form" runat="server" method="post" action="WebForm1.aspx">

        <input type="text" value ="<%=Convert.ToString(Request.Form["search1"])%>" id="Toimiala" name="search1" placeholder="Municipality"/>
        <input type="text" value ="<%=Convert.ToString(Request.Form["search2"])%>" id="Kunta" name="search2" placeholder="Industry"/>
        <button class="firstButton">Search</button>

    </form>

        <table class="table-container">
        <tr>
            <th style="color:yellow; padding: 5px;">Business ID</th>
            <th style="color:#e04bdd;">Company</th>
        </tr>
 <% 
     if (!IsPostBack)
     {

     }

     else
     {
         try

         {
             // Send a GET request to the specified URL using the search parameters from the form inputs
             WebRequest freeDataRequest = WebRequest.Create(@"https://avoindata.prh.fi/bis/v1?totalResults=false&maxResults=100&resultsFrom=0&registeredOffice=" + kaupunki + "&businessLine=" + toimiala + "&companyRegistrationFrom=2014-02-28&companyRegistrationTo=2023-01-31");
             WebResponse freeDataResponse = freeDataRequest.GetResponse();
             Stream dataStream = freeDataResponse.GetResponseStream();
             StreamReader reader = new StreamReader(dataStream);
             string responseFromServer = reader.ReadToEnd();

             if (toimiala == "" || kaupunki == "")
             {
                 Response.Write("<tr><td>404 not found, check search parameters</td></tr>");
             }
             else
             {
                 int i = 0;
                 int ind = 0;
                 // Remove unnecessary characters from the response string
                 var charsToRemove = new string[] { "[", "]", "{", "}", "\"" };
                 foreach (var c in charsToRemove)

                 {

                     responseFromServer = responseFromServer.Replace(c, string.Empty);

                 }
                  // Extract the business ID and name for each company from the response string and store them in arrays
                 string[] lista = responseFromServer.Split(',');
                 string[] yNimi = new string[100];
                 string[] yTunnus = new string[100];

                 while (lista.Length > i)

                 {

                     if (!lista[i].Contains("businessId"))

                     {

                         i++;

                     }
                     else if (lista[i].Contains("businessId:"))

                     {

                         yTunnus[ind] = lista[i].Remove(0, 11);

                         ind++;

                         i++;

                     }



                 }

                 yTunnus[0] = yTunnus[0].Remove(0, 8);

                 ind = 0;

                 i = 0;

                 while (lista.Length > i)

                 {

                     if (!lista[i].Contains("name"))

                     {

                         i++;

                     }
                     else if (lista[i].Contains("name:"))

                     {

                         yNimi[ind] = lista[i].Remove(0, 5);

                         ind++;

                         i++;

                     }



                 }



                 for (i = 0; yNimi.Length > i; i++)

                 {

                     Response.Write("<tr><td>" + yTunnus[i] + "</td>" + "<td>" + yNimi[i] + "</td></tr>");

                 }

             }
         }
         catch (WebException ex)

         {

             if (ex.Response is HttpWebResponse httpWebResponse)

             {

                 if (httpWebResponse.StatusCode == HttpStatusCode.NotFound)

                 {
                     Response.Write("<tr><td>404 not found, check search parameters</td></tr>");

                 }

             }

         }
     }
%>
</table>
</body>
</html>
