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
        .auto-style2 {
            height: 51px;
        }
        .auto-style3 {
            margin-left: 40px;
            height: 0px;
        }
        .auto-style4 {
            margin-left: 48px;
        }
        .auto-style5 {
            margin-left: 40px;
            text-align: left;
        }
        .auto-style6 {
            height: 962px;
        }
        .auto-style8 {
            text-align: left;
        }
        .auto-style9 {
            height: 51px;
            text-align: left;
        }
        .auto-style10 {
            margin-left: 4px;
        }
    </style>
</head>
<body style="height: 964px">
    
    <form id="form2" runat="server" style="font-weight: bold; background-color: #969696;" class="auto-style6" >

      

        <h1 class="auto-style8" style="font-size: 65px">WORKZONE</h1>
    

<ul class="auto-style2" style="border-style: solid; border-width: thin">
    <li class="auto-style8"><a class="nav-link" runat="server" href="~/">Home</a></li>
    <li class="auto-style8"><a class="nav-link" runat="server" href="WebForm1.aspx">Add Claims</a></li>
     <li class="auto-style8"><a class="nav-link" runat="server" href="WebForm2.aspx">Manger page</a></li>
    <li class="auto-style8"><a class="nav-link" runat="server" href="WebForm3.aspx">Human Resource</a></li>
</ul>
    
            <p class="auto-style5">
                <asp:Label ID="Label3" runat="server" Text="UPDATE INFORMATION"></asp:Label>
        </p>
            <div class="auto-style5">
            <div class="auto-style9">
                LECTURE ID:<asp:TextBox ID="LectureIDTextBox" runat="server" CssClass="auto-style23" ForeColor="#666666" Width="157px" style="margin-left: 86px" Height="15px"></asp:TextBox>
                <br />
                <asp:Button ID="Button1" runat="server" Text="SEARCH" OnClick="Button1_Click" />
                <br />
            </div>

            <div class="auto-style9">
                LECTURE NAME:<asp:TextBox ID="LectureNameTextBox" runat="server" CssClass="auto-style3" ForeColor="#666666" Width="157px" style="margin-left: 57px" Height="15px"></asp:TextBox>
                <br />
                <br />
            </div>

            <div class="auto-style9">
                MODULE CODE:<asp:TextBox ID="ModuleCodeTextBox" runat="server" CssClass="auto-style23" ForeColor="#666666" Width="157px" style="margin-left: 67px" Height="15px"></asp:TextBox>
                <br />
                <br />
            </div>

            <div class="auto-style9">
                MODULE NAME:<asp:TextBox ID="ModuleNameTextBox" runat="server" CssClass="auto-style23" ForeColor="#666666" Width="157px" style="margin-left: 62px" Height="15px"></asp:TextBox>
                <br />
                <br />
            </div>

            <div class="auto-style9">
                CELLPHONE NUMBER:<asp:TextBox ID="CellTextBox" runat="server" CssClass="auto-style3" ForeColor="#666666" TextMode="Phone" Width="157px" style="margin-left: 15px" Height="15px"></asp:TextBox>
                <br />
                <br />
            </div>

            <div class="auto-style9">
                HOUR:<asp:TextBox ID="HourTextBox" runat="server" CssClass="auto-style3" ForeColor="#666666" TextMode="Number" Width="157px" style="margin-left: 141px" Height="15px"></asp:TextBox>
                <br />
                <br />
            </div>

            <div class="auto-style9">
                EMAIL:<asp:TextBox ID="EmailTextBox" runat="server" CssClass="auto-style23" ForeColor="#666666" TextMode="Email" Width="157px" style="margin-left: 134px" Height="15px"></asp:TextBox>
                <br />
                <br />
            </div>

            <div class="auto-style9">
                SALARY:<asp:TextBox ID="SalaryTextBox" runat="server" CssClass="auto-style23" ForeColor="#666666" TextMode="Number" Width="157px" style="margin-left: 127px" Height="15px"></asp:TextBox>
            </div>
                <div class="auto-style8">
                <asp:Button ID="BtnSave" runat="server" CssClass="auto-style10"
                            Text="SAVE"
                            OnClick="BtnSave_Click"/>
                    <asp:Button ID="BtnINVOICES" runat="server" CssClass="auto-style4" Text="DOWNLOAD INVOICES" OnClick="BtnINVOICES_Click" />
                    <br />
                <br />
                </div>
            </div>
            <asp:GridView ID="GridView1" runat="server" Width="389px" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="auto-style4">
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

        </form>
    
</body>

</html>
