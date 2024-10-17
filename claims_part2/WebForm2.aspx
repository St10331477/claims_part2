<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="claims_part2.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manger Page</title>
    <style type="text/css">

        .auto-style12 {
            margin-left: 650px;
        }
        .auto-style13 {
            margin-left: 95px;
        }
        .auto-style14 {
            margin-left: 51px;
        }
        .auto-style16 {
            height: 939px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" style="background-color: #009999">
        <div class="auto-style16">
    <div class="collapse navbar-collapse d-sm-inline-flex justify-content-between">
        <h1>WORK ZONE</h1>
    <ul class="navbar-nav flex-grow-1">
        <li class="nav-item"><a class="nav-link" runat="server" href="~/">Home</a></li>
        <li class="nav-item"><a class="nav-link" runat="server" href="WebForm1.aspx">Add Claims</a></li>
         <li class="nav-item"><a class="nav-link" runat="server" href="WebForm2.aspx">Manger page</a></li>
    </ul>
</div>

        <asp:GridView ID="LectureViewGrid" runat="server" AutoGenerateColumns="False" DataKeyNames="LECTURE_ID" DataSourceID="SqlDataSource1" AutoGenerateSelectButton="True" BackColor="#CCCCCC" ShowHeaderWhenEmpty="True" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
            <Columns>
                <asp:BoundField DataField="LECTURE_ID" HeaderText="LECTURE_ID" ReadOnly="True" SortExpression="LECTURE_ID" />
                <asp:BoundField DataField="LECTURE_NAME" HeaderText="LECTURE_NAME" SortExpression="LECTURE_NAME" />
                <asp:BoundField DataField="MODULE_ID" HeaderText="MODULE_ID" SortExpression="MODULE_ID" />
                <asp:BoundField DataField="MODULE_NAME" HeaderText="MODULE_NAME" SortExpression="MODULE_NAME" />
                <asp:BoundField DataField="HOURS" HeaderText="HOURS" SortExpression="HOURS" />
                <asp:BoundField DataField="SALARY_RATE" HeaderText="SALARY_RATE" SortExpression="SALARY_RATE" />
                <asp:BoundField DataField="TOTAL_AMOUNT" HeaderText="TOTAL_AMOUNT" SortExpression="TOTAL_AMOUNT" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
            <RowStyle BackColor="White" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [TBLLECTURECLAIM]"></asp:SqlDataSource>
            <br />
            <asp:Button ID="BtnAcctept" runat="server" BackColor="#00CC00" CssClass="auto-style14" Height="39px" Text="ACCTEPT" Width="300px" />
            <asp:Button ID="BtnReject" runat="server" BackColor="Red" CssClass="auto-style13" Height="39px" Text="REJECT" Width="300px" />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <asp:Button ID="BtnLogout" runat="server" BackColor="#FFCC00" BorderStyle="None" CssClass="auto-style12" Text="LOGOUT" Width="124px" />
        </div>
    </form>
</body>
</html>
