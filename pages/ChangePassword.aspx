<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="pages_ChangePassword" enableEventValidation="false" %>

<%@ Register TagPrefix="my" TagName="MainMenu" Src="~/moduls/MainMenu.ascx" %>
<%@ Register TagPrefix="my" TagName="Footer" Src="~/moduls/Footer.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Menu" Runat="Server">
    <my:MainMenu ID="MainMenu" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <div class="content py-5 l-pwd-form-container bg-secondary col-md-offset-3">
<div class="container">
	<div class="row">
		<div class="col-md-6 offset-md-3 l-pwd-container">
                    <span class="anchor" id="formChangePassword"></span>
                    <hr class="mb-5" />

                    <!-- form card change password -->
                    <div class="card card-outline-secondary">
                        <div class="card-header">
                            <h3 class="mb-0">Промяна на парола</h3>
                        </div>
                        <div class="card-body">
                            <form class="form" role="form" autocomplete="off">
                                <div class="form-group">
                                    <label for="inputPasswordOld">Настояща парола</label>
                                    <asp:TextBox runat="server" TextMode="Password" CssClass="form-control" ID="inputPasswordOld"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label for="inputPasswordNew">Нова парола
                                    </label>
                                    <asp:TextBox runat="server" TextMode="Password" CssClass="form-control" ID="inputPasswordNew"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label for="inputPasswordNewVerify">Потвърждаване</label>
                                    <asp:TextBox runat="server" TextMode="Password" CssClass="form-control" ID="inputPasswordNewVerify"></asp:TextBox>
                                    <span class="form-text small text-muted">
                                        За да потвърдите новата парола, трябва да я въведете отново.
                                    </span>
                                </div>
                                <div class="form-group">
                                    <asp:Button runat="server" CssClass="btn btn-success pull-right" Text="Промяна" ID="NewPasswordBtn" OnClick="NewPasswordBtn_Click" UseSubmitBehavior="false"/>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- /form card change password -->

                </div>
	</div>
</div>
</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" Runat="Server">
    <my:Footer ID="Footer" runat="server" />
</asp:Content>
