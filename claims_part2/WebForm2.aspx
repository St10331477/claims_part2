<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="claims_part2.WebForm2" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manager Page</title>
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
            height: 45px;
            width: 1431px;
        }
        .auto-style2 {
            height: 945px;
        }
        .auto-style3 {
            margin-left: 25px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" style="background-color: #009999">
        <div class="auto-style2">
            <div class="collapse navbar-collapse d-sm-inline-flex justify-content-between">
                <h1 style="font-size: 65px">WORK ZONE</h1>
                <ul class="auto-style1" style="border-style: solid; border-width: thin">
                    <li class="nav-item"><a class="nav-link" runat="server" href="~/">Home</a></li>
                    <li class="nav-item"><a class="nav-link" runat="server" href="WebForm1.aspx">Add Claims</a></li>
                    <li class="nav-item"><a class="nav-link" runat="server" href="WebForm2.aspx">Manager Page</a></li>
                    <li class="nav-item"><a class="nav-link" runat="server" href="WebForm3.aspx">Human Resource</a></li>
                </ul>
            </div>

            <p style="font-weight: bold">
                LECTURE ID:<asp:TextBox ID="LectureIDTextBox" runat="server" CssClass="auto-style23" ForeColor="#666666" Width="157px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label1" runat="server" Text="STATUS:" Font-Bold="True"></asp:Label>
                <asp:TextBox ID="STATUSTextBox" runat="server" CssClass="auto-style17"></asp:TextBox>
            </p>

            <asp:GridView ID="LectureViewGrid" runat="server" AutoGenerateColumns="False" DataKeyNames="LectureID" DataSourceID="SqlDataSource1" ShowHeaderWhenEmpty="True" CellPadding="4" ForeColor="#333333" AutoGenerateEditButton="True" AutoGenerateSelectButton="True" CssClass="auto-style3" Width="1218px">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="LectureID" HeaderText="LectureID" ReadOnly="True" SortExpression="LectureID" />
                    <asp:BoundField DataField="LectureName" HeaderText="LectureName" SortExpression="LectureName" />
                    <asp:BoundField DataField="ModuleCode" HeaderText="ModuleCode" SortExpression="ModuleCode" />
                    <asp:BoundField DataField="ModuleName" HeaderText="ModuleName" SortExpression="ModuleName" />
                    <asp:BoundField DataField="HOURS" HeaderText="HOURS" SortExpression="HOURS" />
                    <asp:BoundField DataField="SalaryRate" HeaderText="SalaryRate" SortExpression="SalaryRate" />
                    <asp:BoundField DataField="TotalAmount" HeaderText="TotalAmount" SortExpression="TotalAmount" />
                    <asp:BoundField DataField="STATUS" HeaderText="STATUS" SortExpression="STATUS"/>
                    <asp:BoundField DataField="FileName" HeaderText="FileName" SortExpression="FileName"/>
                    <asp:BoundField DataField="FileLocation" HeaderText="FileLocation" SortExpression="FileLocation"/>
                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#00b8a9" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#e1eded" Font-Bold="True" ForeColor="BLACK" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#00b8a9" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#F8FAFA" />
                <SortedDescendingCellStyle BackColor="#F8FAFA" />
                <SortedDescendingHeaderStyle BackColor="#F8FAFA" />
            </asp:GridView>

            <asp:SqlDataSource ID='SqlDataSource1' runat='server' ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand='SELECT * FROM [TBLLECTURECLAIM]'></asp:SqlDataSource>

            <br />
            <asp:Button ID='BtnAccept' runat='server' BackColor='#00CC00' CssClass='auto-style14' Height='39px' Text='UPLOAD' Width='721px' OnClick='BtnAccept_Click' Font-Bold="True" Font-Size="Large" Font-Underline="True" style="margin-left: 278px"/>
        </div>
    </form>
</body>
</html>