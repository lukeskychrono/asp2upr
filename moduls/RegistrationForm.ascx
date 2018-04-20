<%@ Control Language="C#" AutoEventWireup="true" CodeFile="RegistrationForm.ascx.cs" Inherits="moduls_RegistrationForm" %>

<style type="text/css">
    body {
		font-family: 'Varela Round', sans-serif;
	}
	.modal-confirm {		
		color: #636363;
		width: 325px;
	}
	.modal-confirm .modal-content {
		padding: 20px;
		border-radius: 5px;
		border: none;
	}
	.modal-confirm .modal-header {
		border-bottom: none;   
        position: relative;
	}
	.modal-confirm h4 {
		text-align: center;
		font-size: 26px;
		margin: 30px 0 -15px;
	}
	.modal-confirm .form-control, .modal-confirm .btn {
		min-height: 40px;
		border-radius: 3px; 
	}
	.modal-confirm .close {
        position: absolute;
		top: -5px;
		right: -5px;
	}	
	.modal-confirm .modal-footer {
		border: none;
		text-align: center;
		border-radius: 5px;
		font-size: 13px;
	}	
	.modal-confirm .icon-box {
		color: #fff;		
		position: absolute;
		margin: 0 auto;
		left: 0;
		right: 0;
		top: -70px;
		width: 95px;
		height: 95px;
		border-radius: 50%;
		z-index: 9;
		background: #82ce34;
		padding: 15px;
		text-align: center;
		box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.1);
	}
	.modal-confirm .icon-box i {
		font-size: 58px;
		position: relative;
		top: 3px;
	}
	.modal-confirm.modal-dialog {
		margin-top: 80px;
	}
    .modal-confirm .btn {
        color: #fff;
        border-radius: 4px;
		background: #82ce34;
		text-decoration: none;
		transition: all 0.4s;
        line-height: normal;
        border: none;
    }
	.modal-confirm .btn:hover, .modal-confirm .btn:focus {
		background: #6fb32b;
		outline: none;
	}
	.trigger-btn {
		display: inline-block;
		margin: 100px auto;
	}
</style>

<div id="myModal" class="modal fade">
	<div class="modal-dialog modal-confirm">
		<div class="modal-content">
			<div class="modal-header">
				<div class="icon-box">
					<i class="material-icons">&#10004;</i>
				</div>				
				<h4 class="modal-title">Awesome!</h4>	
			</div>
			<div class="modal-body">
				<p class="text-center">Registration successful. Visit your email to activate your account.</p>
			</div>
			<div class="modal-footer">
				<button class="btn btn-success btn-block l-modal-ok" data-dismiss="modal">OK</button>
			</div>
		</div>
	</div>
</div> 


<div class="panel panel-default ">
    <div class="panel-body bg-warning">
        <h2>Registration</h2>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtUsername" ID="UserNameLabel">User Name:</asp:Label>
            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" />
            <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" Font-Bold="true" ControlToValidate="txtUsername" runat="server" />
        </div>
        <hr />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtPassword" ID="PasswordLabel">Password:</asp:Label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control"/>
            <asp:RequiredFieldValidator ID="RequiredField1" ErrorMessage="Required" ForeColor="Red" Font-Bold="true" ControlToValidate="txtPassword" runat="server" />
        </div>
        <hr />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtConfirmPassword" ID="ConfirmPasswordLabel">Confirm Password:</asp:Label>
            <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="form-control"/>
            <asp:CompareValidator ID="CompareValidatorPassword" ErrorMessage="No Match" ToolTip="Password must be the same" ForeColor="Red" Font-Bold="true" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" runat="server" />
        </div>
        <hr />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtEmail" ID="Label2">Email:</asp:Label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"/>
            <asp:RequiredFieldValidator ErrorMessage="Required" Display="Dynamic" ForeColor="Red" Font-Bold="true" ControlToValidate="txtEmail" runat="server" />
            <asp:RegularExpressionValidator runat="server" Display="Dynamic" ValidationExpression="[A-Za-z0-9._]*@[A-Za-z0-9]*.[A-Za-z]{2,5}" ControlToValidate="txtEmail" ForeColor="Red" ErrorMessage="Invalid email address." />
        </div>
        <hr />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtEmail" ID="Label1">Confirm Email:</asp:Label>
            <asp:TextBox ID="txtConfirmEmail" runat="server" CssClass="form-control"/>
            <asp:CompareValidator ID="CompareValidatorEmail" ErrorMessage="No Match" ToolTip="Email must be the same" ForeColor="Red" Font-Bold="true" ControlToCompare="txtEmail" ControlToValidate="txtConfirmEmail" runat="server" />
        </div>
        <div>
            <asp:Literal runat="server" ID="FailureText" EnableViewState="False"></asp:Literal>
        </div>
        <hr />
        <asp:Button ID="Button_Register_User" Text="Register" runat="server" CssClass="btn btn-primary btn-lg" OnClick="RegisterUser" />
        <a href="#myModal" class="trigger-btn" data-toggle="modal" style="display: none" runat="server"></a>
    </div>
</div>