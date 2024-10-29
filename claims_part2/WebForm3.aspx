<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="claims_part2.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
}

li {
  float: left;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

/* Change the link color to #111 (black) on hover */
li a:hover {
  background-color: #111;
}
        .auto-style1 {
            width: 1316px;
        }
        .auto-style2 {
            height: 51px;
        }
    </style>
</head>
<body style="height: 964px">
    
    <form id="form2" runat="server" style="font-weight: bold; background-color: #C0C0C0;" class="auto-style25" >

      

        <h1 class="auto-style21" style="font-size: 65px">WORKZONE</h1>
    

<ul class="auto-style2" style="border-style: solid; border-width: thin">
    <li class="nav-item"><a class="nav-link" runat="server" href="~/">Home</a></li>
    <li class="nav-item"><a class="nav-link" runat="server" href="WebForm1.aspx">Add Claims</a></li>
     <li class="nav-item"><a class="nav-link" runat="server" href="WebForm2.aspx">Manger page</a></li>
    <li class="nav-item"><a class="nav-link" runat="server" href="WebForm3.aspx">Human Resource</a></li>
</ul>
    
            <p class="auto-style26">
                <asp:Label ID="Label3" runat="server" Text="UPDATE INFORMATION"></asp:Label>
        </p>
            <div class="auto-style26">
                LECTURE ID:<asp:TextBox ID="LectureIDTextBox" runat="server" CssClass="auto-style23" ForeColor="#666666" Width="157px"></asp:TextBox>
                <br />
                <br />
            </div>
            <div class="auto-style26">
                LECTURE NAME:<asp:TextBox ID="LectureNameTextBox" runat="server" CssClass="auto-style3" ForeColor="#666666" Width="157px"></asp:TextBox>
            </div>
            <div class="auto-style26">
                MODULE CODE:<asp:TextBox ID="ModuleCodeTextBox" runat="server" CssClass="auto-style23" ForeColor="#666666" Width="157px"></asp:TextBox>
            </div>
            <div class="auto-style26">
                MODULE NAME:<asp:TextBox ID="ModuleNameTextBox" runat="server" CssClass="auto-style23" ForeColor="#666666" Width="157px"></asp:TextBox>
            </div>
            <div class="auto-style26">
                CELLPHONE NUMBER:<asp:TextBox ID="CellTextBox" runat="server" CssClass="auto-style3" ForeColor="#666666" TextMode="Phone" Width="157px"></asp:TextBox>
            </div>
            <div class="auto-style26">
                HOUR:<asp:TextBox ID="HourTextBox" runat="server" CssClass="auto-style3" ForeColor="#666666" TextMode="Number" Width="157px"></asp:TextBox>
            </div>
            <div class="auto-style26">
                EMAIL:<asp:TextBox ID="EmailTextBox" runat="server" CssClass="auto-style23" ForeColor="#666666" TextMode="Email" Width="157px"></asp:TextBox>
            </div>
            <div class="auto-style26">
                SALARY:<asp:TextBox ID="SalaryTextBox" runat="server" CssClass="auto-style23" ForeColor="#666666" TextMode="Number" Width="157px"></asp:TextBox><br />
            </div>
        <p>
                <asp:Button ID="BtnUpdate" runat="server" CssClass="auto-style4"
                            Text="UPDATE"
                            OnClick="BtnSave_Click"/>
            </p>
            <asp:GridView ID="GridView1" runat="server" Width="389px" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="#c4c0bf" />
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#c4c0bf" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#c4c0bf" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BorderColor="#6699FF" BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>

            <br /><br />
        <asp:Button ID="BtnDownload" runat="server" CssClass="auto-style24" Text="DOWNLOAD" OnClick="BtnDownload_Click" />
        <br />


        </form>
    
</body>

</html>
