<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplicationforindex.WebForm1" %>
<%@ Import Namespace="System.IO"%>
<%@ Import Namespace="System.Net"%>

<!DOCTYPE html>

<%
    /*string toimiala="";
    string kaupunki="";
    int indeksi = 0;

        switch (Request.Form["search1"])
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
            case "Tampere":
            kaupunki = "Tampere";
            break;


        }
    switch (Request.Form["search2"])
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
        case "Majoitus":
            toimiala = "Majoitus";
            break;

    }*/


    string kaupunki = Request.Form["search1"];
    string toimiala = Request.Form["seach2"];




%>



<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="MyStyle.css" rel="stylesheet" type="text/css" />
    </head>


<body>

 <% 
        WebRequest freeDataRequest = WebRequest.Create(@"https://avoindata.prh.fi/bis/v1?totalResults=false&maxResults=100&resultsFrom=0&registeredOffice=" + kaupunki + "&businessLine="+ toimiala +"&companyRegistrationFrom=2014-02-28&companyRegistrationTo=2023-01-31");
        WebResponse freeDataResponse = freeDataRequest.GetResponse();

        Stream dataStream = freeDataResponse.GetResponseStream();
        StreamReader reader = new StreamReader(dataStream);
        string responseFromServer = reader.ReadToEnd();

        //Response.Write(responseFromServer);


        %>

    <form id="form" runat="server" method="post" action="WebForm1.aspx">

        <input type="text" value ="<%=Convert.ToString(Request.Form["search1"])%>" id="Toimiala" name="search1" placeholder="Municipality"/>
        <input type="text" value ="<%=Convert.ToString(Request.Form["search2"])%>" id="Kunta" name="search2" placeholder="Industry"/>
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
            /*if (kaupunki == "Helsinki" && toimiala == "Kuljetus")
            {
                int laskuri = 0;
                string datamass = "Ford,126769388-6,710 603 0489,mbridgwood0@is.gd\r\nEagle,744026232-8,581 388 8285,ascroggins1@jiathis.com\r\nHonda,031157378-9,205 591 4886,cpitchford2@kickstarter.com\r\nMitsubishi,633167266-4,607 921 5319,nilchuk3@smh.com.au\r\nMitsubishi,328176326-X,545 389 0908,amakinson4@123-reg.co.uk\r\nGMC,888567546-8,888 478 5859,rgrassi5@linkedin.com\r\nBMW,743395671-9,882 146 5317,wrasher6@techcrunch.com\r\nBMW,218200773-3,105 935 2138,pvinall7@twitpic.com\r\nChevrolet,800708377-4,428 383 9926,sgethins8@nih.gov\r\nLotus,566134343-4,139 717 5434,nlundbech9@fastcompany.com\r\nNissan,149824164-6,767 371 4278,aknilla@theguardian.com\r\nSaturn,111114922-4,711 322 9790,rropkesb@live.com\r\nLexus,058937545-8,741 804 1842,avalac@imgur.com\r\nFord,724628125-8,426 224 5849,psherrardd@shutterfly.com\r\nMercedes-Benz,490008081-0,318 557 0417,fgounarde@vkontakte.ru\r\nChevrolet,219248964-1,160 954 5520,cvelezf@netlog.com\r\nLincoln,413805076-0,337 301 4664,hheareg@wp.com\r\nGMC,038229618-4,623 134 3918,ihubbuckh@dmoz.org\r\nToyota,521844926-1,862 140 8683,bcomleyi@dailymotion.com\r\nGMC,267401662-0,704 798 7188,skupecj@homestead.com\r\nDodge,538067966-8,875 157 3343,twyldborek@cnbc.com\r\nAudi,501566703-5,538 755 1898,chanselll@mashable.com\r\nChevrolet,220326854-9,978 339 9834,edenersm@hud.gov\r\nPlymouth,464053150-8,795 655 1385,nruskn@cnn.com\r\nMazda,768728833-5,372 954 7316,fknapmano@paypal.com\r\nNissan,567488412-9,269 968 6438,jmeneyerp@wikimedia.org\r\nHonda,783291208-1,832 986 7232,dboscheq@bandcamp.com\r\nMitsubishi,738704882-7,290 632 6190,okunzelr@lycos.com\r\nLamborghini,141120688-6,912 950 7928,hblockeys@unblog.fr\r\nJeep,135528954-8,802 975 2604,rmulqueent@purevolume.com\r\nAudi,635200635-3,681 418 9742,cpalleu@i2i.jp\r\nFord,207989868-X,267 650 0564,smowettv@businesswire.com\r\nToyota,378387854-3,742 617 5743,idewanw@google.nl\r\nHyundai,236982840-4,832 107 1922,rhaberjamx@clickbank.net\r\nGMC,365471440-4,502 563 8582,wlundony@myspace.com\r\nMercury,274528177-1,979 770 4733,cpetroulisz@tiny.cc\r\nOldsmobile,190254279-7,579 890 3471,klanfranconi10@wsj.com\r\nLexus,266486102-6,603 273 2580,lacaster11@about.me\r\nKia,015394033-6,157 211 5858,norsay12@latimes.com\r\nChevrolet,619833610-7,368 522 1062,jhymor13@cocolog-nifty.com\r\nLexus,953162367-8,483 860 0979,pharsnipe14@mapy.cz\r\nSuzuki,965444621-9,479 421 2607,jtulip15@geocities.com\r\nToyota,185038119-4,986 317 6540,bkeitch16@economist.com\r\nBMW,693949131-7,834 918 2280,ctorrent17@ucoz.ru\r\nMercedes-Benz,048271947-8,144 648 0730,sching18@slate.com\r\nBMW,261449772-X,798 408 5436,mbouchard19@odnoklassniki.ru\r\nToyota,427196894-3,398 721 1253,llillywhite1a@umn.edu\r\nPorsche,724084177-4,769 273 9718,cauchterlony1b@noaa.gov\r\nAston Martin,707967004-7,278 759 4792,bmudd1c@hp.com\r\nFord,162647072-3,991 617 6166,gjordine1d@ucsd.edu";
                var charsToRemove = new string[] { "\r" };
                foreach (var c in charsToRemove)
                {
                    datamass = datamass.Replace(c, string.Empty);
                }
                string[] yHelsinki = datamass.Split(new char[] { ',', '\n' });
                foreach (string yritykset in yHelsinki)
                {
                    while (yHelsinki.Length > indeksi)
                    {
                        if (laskuri == 3)
                        {
                            Response.Write("<td>" + yHelsinki[indeksi] + "</td></tr>");
                            laskuri = 0;
                            indeksi++;

                        }
                        else if (laskuri == 0)
                        {
                            Response.Write("<tr>" + "<td>" + yHelsinki[indeksi] + "</td>");
                            indeksi++;
                            laskuri++;
                        }
                        else if (laskuri < 3)
                        {
                            Response.Write("<td>" + yHelsinki[indeksi] + "</td>");
                            indeksi++;
                            laskuri++;
                        }


                    }
                }
            }
            else if (kaupunki == "Tampere" && toimiala == "Majoitus")
            {

                string[] yTampere = { "139352-4", "Ainon Tupa", "030907340", "info@yritys.fi" , "139352-5", "Ainon Tupaz", "0309073401", "info@yritys.fii"   };
                Response.Write("<tr><td>" + yTampere[0] + "</td><td>" + yTampere[1] + "</td><td>" + yTampere[2] + "</td><td>" + yTampere[3] + "</td></tr>");
                Response.Write("<tr><td>" + yTampere[4] + "</td><td>" + yTampere[5] + "</td><td>" + yTampere[6] + "</td><td>" + yTampere[7] + "</td></tr>");


            }


            else if (kaupunki == "Espoo" && toimiala == "Elintarvike")
            {
                indeksi = 0;
                string[] elintarvikkeet = { "3039230", "21391312", "0138182812", "230820823", "Elintarviker yritys", "Elintarvikez yritys", "Elintarvikes yritys", "Elintarvikek yritys", "40182919", "00440020", "102902110039", "1212991282", "hieno@example.com", "kiva@example.com", "omena@example.com", "miu@example.com" };
                Response.Write("<tr><td>" + elintarvikkeet[0] + "</td><td>" + elintarvikkeet[4] + "</td><td>" + elintarvikkeet[8] + "</td><td>" + elintarvikkeet[12] + "</td></tr>");
                Response.Write("<tr><td>" + elintarvikkeet[1] + "</td><td>" + elintarvikkeet[5] + "</td><td>" + elintarvikkeet[9] + "</td><td>" + elintarvikkeet[13] + "</td></tr>");
                Response.Write("<tr><td>" + elintarvikkeet[2] + "</td><td>" + elintarvikkeet[6] + "</td><td>" + elintarvikkeet[10] + "</td><td>" + elintarvikkeet[14] + "</td></tr>");
                Response.Write("<tr><td>" + elintarvikkeet[3] + "</td><td>" + elintarvikkeet[7] + "</td><td>" + elintarvikkeet[11] + "</td><td>" + elintarvikkeet[15] + "</td></tr>");

            }

            else if(kaupunki == "Lahti" && toimiala== "Ravintola")
            {
                
                string[,] rowData = { { "8-3463423", "Abdulin Pizza Oy", "457366343", "hyväpizza@abdul.fi" }, { "9-2435345", "Jonin pizza oy", "3474457457", "JoninPaska_izza@äläsyö.fi" }, { "8-3463423", "Kamelin Pizza Oy", "457366343", "hyväpizza@kameli.fi" }, { "9-2435345", "Vuohen pizza oy", "3474457457", "VuohenPaska_pizza@äläsyö.fi" },{ "9-2435345", "Vuohen pizza oy", "3474457457", "VuohenPaska_pizza@äläsyö.fi" },{ "9-2435345", "Vuohen pizza oy", "3474457457", "VuohenPaska_pizza@äläsyö.fi" },{ "8-3463423", "Abdulin Pizza Oy", "457366343", "hyväpizza@abdul.fi" },{ "8-3463423", "Abdulin Pizza Oy", "457366343", "hyväpizza@abdul.fi" },{ "8-3463423", "Abdulin Pizza Oy", "457366343", "hyväpizza@abdul.fi" },{ "8-3463423", "Abdulin Pizza Oy", "457366343", "hyväpizza@abdul.fi" },{ "8-3463423", "Abdulin Pizza Oy", "457366343", "hyväpizza@abdul.fi" },{ "8-3463423", "Abdulin Pizza Oy", "457366343", "hyväpizza@abdul.fi" } };

            int rowCount = rowData.GetLength(0); // number of rows
            int columnCount = rowData.GetLength(1); // number of columns

            string htmlTableBody = "<tbody>";
            for (int i = 0; i < rowCount; i++)
            {
                htmlTableBody += "<tr>";
                for (int j = 0; j < columnCount; j++)
                {
                    htmlTableBody += "<td>" + rowData[i, j] + "</td>";
                }
                htmlTableBody += "</tr>";
            }
            htmlTableBody += "</tbody>";

                Response.Write(htmlTableBody);
               
            }*/

            %>
    </table>




</body>

</html>
