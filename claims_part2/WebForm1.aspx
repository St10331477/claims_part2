<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="claims_part2.WebForm1" Theme="" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Claim</title>
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
            height: 54px;
            width: 1341px;
        }
        .auto-style2 {
            margin-left: 40px;
        }
        .auto-style3 {
            margin-left: 40px;
            height: 0px;
        }
        .auto-style4 {
            width: 157px;
        }
        .auto-style5 {
            width: 108px;
        }
        .auto-style6 {
            
            height: 432px;
        }
    </style>
</head>
    
    <form id="form1" runat="server" style="font-weight: bold; background-color: #C0C0C0;" >


        <h1 class="auto-style21" style="font-size: 65px">WORKZONE</h1>
 
<ul class="auto-style1" style="border-style: solid; border-width: thin">
    <li class="nav-item"><a class="nav-link" runat="server" href="~/">Home</a></li>
    <li class="nav-item"><a class="nav-link" runat="server" href="WebForm1.aspx">Add Claims</a></li>
     <li class="nav-item"><a class="nav-link" runat="server" href="WebForm2.aspx">Manger page</a></li>
    <li class="nav-item"><a class="nav-link" runat="server" href="WebForm3.aspx">Human Resource</a></li>
</ul>
    
            <p>
                &nbsp;</p>
            <div class="auto-style2">
                LECTURE ID:<asp:TextBox ID="LectureIDTextBox" runat="server" CssClass="auto-style23" ForeColor="#666666" Width="157px" style="margin-left: 86px"></asp:TextBox>
            </div>
            <div class="auto-style2">
                LECTURE NAME:<asp:TextBox ID="LectureNameTextBox" runat="server" CssClass="auto-style3" ForeColor="#666666" Width="157px" style="margin-left: 57px"></asp:TextBox>
            </div>
            <div class="auto-style2">
                MODULE CODE:<asp:TextBox ID="ModuleCodeTextBox" runat="server" CssClass="auto-style23" ForeColor="#666666" Width="157px" style="margin-left: 67px"></asp:TextBox>
            </div>
            <div class="auto-style2">
                MODULE NAME:<asp:TextBox ID="ModuleNameTextBox" runat="server" CssClass="auto-style23" ForeColor="#666666" Width="157px" style="margin-left: 62px"></asp:TextBox>
            </div>
            <div class="auto-style2">
                CELLPHONE NUMBER:<asp:TextBox ID="CellTextBox" runat="server" CssClass="auto-style3" ForeColor="#666666" TextMode="Phone" Width="157px" style="margin-left: 15px"></asp:TextBox>
            </div>
            <div class="auto-style2">
                HOUR:<asp:TextBox ID="HourTextBox" runat="server" CssClass="auto-style3" ForeColor="#666666" TextMode="Number" Width="157px" style="margin-left: 141px"></asp:TextBox>
            </div>
            <div class="auto-style2">
                EMAIL:<asp:TextBox ID="EmailTextBox" runat="server" CssClass="auto-style23" ForeColor="#666666" TextMode="Email" Width="157px" style="margin-left: 134px"></asp:TextBox>
            </div>
            <div class="auto-style2">
                SALARY:<asp:TextBox ID="SalaryTextBox" runat="server" CssClass="auto-style23" ForeColor="#666666" TextMode="Number" Width="157px" style="margin-left: 127px"></asp:TextBox><br />
            </div>

            <p>
                <asp:Label ID="Label1" runat="server" Text="SELECT FILE"></asp:Label>
                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="auto-style13"/>
                &nbsp;
                <asp:Label ID="Label2" runat="server" Text="File Name"></asp:Label>
                <asp:TextBox ID="fileNameTextBox" runat="server" CssClass="auto-style17"></asp:TextBox>
            </p>

            <p class="auto-style5">
                <asp:Button ID="BtnSave" runat="server" CssClass="auto-style4"
                            Text="SAVE"
                            OnClick="BtnSave_Click" style="margin-left: 25px"/>
            </p>
            <div class="auto-style6">
                <asp:GridView ID="GridView1" runat="server" Width="389px" CellPadding="4" ForeColor="#333333">
                    <AlternatingRowStyle BackColor="#c4c0bf" />
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="Black" Font-Bold="True" ForeColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
                    <HeaderStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BorderColor="#6699FF" BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
        </div>
  
        </form>

</html>