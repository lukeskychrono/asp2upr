<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UsersDB.ascx.cs" Inherits="moduls_administrator_UsersDB" %>

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

<div id="insertModal" class="modal fade">
	<div class="modal-dialog modal-confirm">
		<div class="modal-content">
			<div class="modal-header">		
				<h4 class="modal-title">Add a new user</h4>	
			</div>
			<div class="modal-body">
                 <label class="col-form-label">Username:</label>
				 <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control"/>
                
                 <label class="col-form-label">Password:</label>
				 <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control"/>
                
                 <label class="col-form-label">Email:</label>
				 <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"/>

                <label class="col-form-label">Role Id:</label>
				 <asp:TextBox ID="txtRole" runat="server" CssClass="form-control"/>
			</div>
			<div class="modal-footer">
                <asp:Button ID="userInsertButton" CssClass ="btn btn-success btn-block" runat="server" data-dismiss="modal" Text="Добави" OnClick="insertUser"/>
			</div>
		</div>
	</div>
</div>

<div id="editModal" class="modal fade">
	<div class="modal-dialog modal-confirm">
		<div class="modal-content">
			<div class="modal-header">
                <asp:HiddenField ID="hiddenUserId" runat="server" />
				<h4 class="modal-title">Edit User</h4>	
			</div>
			<div class="modal-body">
                 <label class="col-form-label">Username:</label>
				 <asp:TextBox ID="txtEditUsername" runat="server" CssClass="form-control"/>
                
                 <label class="col-form-label">Password:</label>
				 <asp:TextBox ID="txtEditPassword" runat="server" CssClass="form-control"/>
                
                 <label class="col-form-label">Email:</label>
				 <asp:TextBox ID="txtEditEmail" runat="server" CssClass="form-control"/>

                <label class="col-form-label">Role Id:</label>
				 <asp:TextBox ID="txtEditRole" runat="server" CssClass="form-control"/>
			</div>
			<div class="modal-footer">
                <asp:Button ID="editUserBtn" CssClass ="btn btn-success btn-block" runat="server" data-dismiss="modal" Text="Save" OnClick="editUserOnClick"/>
                <asp:Button ID="deleteUserBtn" CssClass ="btn btn-danger btn-block pull-left" runat="server" data-dismiss="modal" Text="Delete" OnClick="deleteUserOnClick"/>
			</div>
		</div>
	</div>
</div> 

<div class="col-md-12">

    <asp:GridView CssClass="table table-hover" Width="100%" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="UserId" DataSourceID="SDS_Users" AllowPaging="True" AllowSorting="True">
        <Columns>
            <asp:BoundField DataField="UserId" HeaderText="UserId" ReadOnly="True" InsertVisible="False" SortExpression="UserId"></asp:BoundField>
            <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username"></asp:BoundField>
            <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password"></asp:BoundField>
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email"></asp:BoundField>
            <asp:BoundField DataField="CreateDate" HeaderText="CreateDate" SortExpression="CreateDate"></asp:BoundField>
            <asp:BoundField DataField="LastLoginDate" HeaderText="LastLoginDate" SortExpression="LastLoginDate"></asp:BoundField>
            <asp:BoundField DataField="RoleName" HeaderText="RoleName" SortExpression="RoleName"></asp:BoundField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button ID="editBtn" runat="server" CommandArgument='<%# Eval("UserId") %>' OnClick="editBtn_OnClick" UseSubmitBehavior ="false" Text="Edit"></asp:Button>
                    <a href="#editModal" class="trigger-edit-user-btn" data-toggle="modal" style="display: none" runat="server"></a>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:Button ID="InsertNewUser" runat="server" Text="Insert" OnClick ="insertBtnOnClick" />
    <a href="#insertModal" class="trigger-new-user-btn" data-toggle="modal" style="display: none" runat="server"></a>

    <asp:SqlDataSource runat="server" ID="SDS_Users" ConnectionString='<%$ ConnectionStrings:ConnString %>' SelectCommand="SELECT Users.UserId, Users.Username, Users.Password, Users.Email, Users.CreateDate, Users.LastLoginDate, Roles.RoleName FROM Roles INNER JOIN Users ON Roles.RoleId = Users.RoleId"></asp:SqlDataSource>
</div>
