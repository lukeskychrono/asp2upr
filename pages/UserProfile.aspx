<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UserProfile.aspx.cs" Inherits="pages_UserProfile" %>

<%@ Register TagPrefix="my" TagName="MainMenu" Src="~/moduls/MainMenu.ascx" %>
<%@ Register TagPrefix="my" TagName="Footer" Src="~/moduls/Footer.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Menu" Runat="Server">
    <my:MainMenu ID="MainMenu" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">

    <asp:ListView ID="ListView1" runat="server" DataSourceID="SDS_UserInfo">
        <ItemTemplate >
            <ul class="list-group">
                <li class="list-group-item">Username: <%# Eval("Username") %></li>
                <li class="list-group-item">Role: <%# Eval("Roles") %></li>
                <li class="list-group-item">Email: <%# Eval("Email") %></li>
                <li class="list-group-item">Created date: <%# Eval("CreateDate") %></li>
                <li class="list-group-item">Last login date: <%# Eval("LastLoginDate") %></li>
            </ul>
        </ItemTemplate>
    </asp:ListView>
      
    <asp:Button runat="server" CssClass="btn btn-primary" Text="Промяна на парола" ID="ChangePasswordBtn" OnClick="ChangePasswordBtn_Click"/>
<asp:SqlDataSource runat="server" ID="SDS_UserInfo" ConnectionString='<%$ ConnectionStrings:ConnString %>' SelectCommand="SELECT [Username], [Email], [CreateDate], [LastLoginDate], (Select Roles.RoleName from Roles where RoleId = Users.RoleId) Roles FROM [Users] WHERE ([UserId] = @UserId)">
    <SelectParameters>
        <asp:SessionParameter SessionField="UserId" Name="UserId" Type="Int32"></asp:SessionParameter>
    </SelectParameters>
</asp:SqlDataSource>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" Runat="Server">
    <my:Footer ID="Footer" runat="server" />
</asp:Content>