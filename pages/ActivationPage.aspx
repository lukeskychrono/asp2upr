<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ActivationPage.aspx.cs" Inherits="pages_ActivationPage" %>

<%@ Register TagPrefix="my" TagName="MainMenu" Src="~/moduls/MainMenu.ascx" %>
<%@ Register TagPrefix="my" TagName="Footer" Src="~/moduls/Footer.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Menu" Runat="Server">
    <my:MainMenu ID="MainMenu" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <div class="qlt-confirmation l-act l-activation-success" style="display: none">
  	    <div class="panel panel-default">
            <div class="panel-body">
                <center>
                    <img src="https://upload.wikimedia.org/wikipedia/commons/c/cb/B-check.svg" style="width:50px; height: 40px;">
                        <p class="desc"><font color="darkgreen" style="font-weight:bold">Successfully activated!</font><br>You can now login<br> 
                        </p>
                </center>        
            </div>
	    </div>
    </div>
    <div class="alert alert-danger l-act l-activation-failure fade in" style="display: none">
        <a href="#" class="close" data-dismiss="alert">&times;</a>
        <div style="text-align: center;">
            <strong>Error!</strong> <br> Sorry. Activation link has expired. </br>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" Runat="Server">
      <my:Footer ID="Footer" runat="server" />
</asp:Content>