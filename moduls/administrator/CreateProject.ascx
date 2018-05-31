<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CreateProject.ascx.cs" Inherits="moduls_administrator_CreateProject" %>

<div class="container">
    <div class="row">
        <div class="col-md-6">
            <h1>Добавяне на проект</h1>

            <asp:Label ID="lblTitle" runat="server" Text="Заглавие"></asp:Label>
            <asp:TextBox ID="TextBox_Title" CssClass="form-control" runat="server"></asp:TextBox>

            <asp:Label ID="lblAuthor" runat="server" Text="Подзаглавие"></asp:Label>
            <asp:TextBox ID="TextBox_Subheading" CssClass="form-control" runat="server"></asp:TextBox>

            <asp:Label ID="lblImage" runat="server" Text="Снимки(първата ще бъде главна за проекта)"></asp:Label>
            <asp:FileUpload ID="FU_Image" AllowMultiple="true" runat="server" />

            <asp:Label ID="lblContent" runat="server" Text="Описание"></asp:Label>
            <asp:TextBox ID="TextBox_Description" CssClass="form-control" TextMode="MultiLine" Rows="7" runat="server"></asp:TextBox>

            <asp:Label ID="Label1" runat="server" Text="Детайли"></asp:Label>
            <asp:TextBox ID="TextBox_Details" CssClass="form-control" TextMode="MultiLine" Rows="7" runat="server"></asp:TextBox>

            <asp:Button ID="CreateButton"  runat="server" Text="Създаване на проект" OnClick="CreateButtonOnClick" />
        </div>
    </div>