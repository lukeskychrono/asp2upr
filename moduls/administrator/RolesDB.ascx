<%@ Control Language="C#" AutoEventWireup="true" CodeFile="RolesDB.ascx.cs" Inherits="moduls_administrator_RolesDB" %>

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

<div id="newRoleModal" class="modal fade">
	<div class="modal-dialog modal-confirm">
		<div class="modal-content">
			<div class="modal-header">		
				<h4 class="modal-title">Add a new role</h4>	
			</div>
			<div class="modal-body">
                 <label class="col-form-label">Role Name:</label>
				 <asp:TextBox ID="txtRoleName" runat="server" CssClass="form-control"/>
			</div>
			<div class="modal-footer">
                <asp:Button ID="NewRoleButton" CssClass ="btn btn-success btn-block" runat="server" data-dismiss="modal" Text="Добави" OnClick="InsertNewRole"/>
			</div>
		</div>
	</div>
</div>
<div id="editRoleModal" class="modal fade">
	<div class="modal-dialog modal-confirm">
		<div class="modal-content">
			<div class="modal-header">
                <asp:HiddenField ID="hiddenRoleId" runat="server" />
				<h4 class="modal-title">Edit role</h4>	
			</div>
			<div class="modal-body">
                 <label class="col-form-label">Role Name:</label>
				 <asp:TextBox ID="TxtBox_EditRoleName" runat="server" CssClass="form-control"/>
			</div>
			<div class="modal-footer">
                <asp:Button ID="EditRoleButton" CssClass ="btn btn-success btn-block" runat="server" data-dismiss="modal" Text="Добави" OnClick="EditRoleOnClick"/>
                 <asp:Button ID="DeleteRoleButton" CssClass ="btn btn-danger btn-block pull-left" runat="server" data-dismiss="modal" Text="Добави" OnClick="DeleteRoleOnClick"/>
			</div>
		</div>
	</div>
</div> 

<div class="col-md-12">

    <asp:GridView CssClass="table table-hover" Width="100%" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="RoleId" DataSourceID="SDS_Roles" AllowPaging="True">

        <Columns>
            <asp:BoundField DataField="RoleId" HeaderText="RoleId" ReadOnly="True" SortExpression="RoleId"></asp:BoundField>
            <asp:BoundField DataField="RoleName" HeaderText="RoleName" SortExpression="RoleName"></asp:BoundField>
             <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="editBtn" runat="server" CommandArgument='<%# Eval("RoleId") %>' OnClick="EditBtnOnClick">Edit</asp:LinkButton>
                    <a href="#editRoleModal" class="trigger-edit-role-btn" data-toggle="modal" style="display: none" runat="server"></a>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:Button ID="Insert" runat="server" Text="Добави" OnClick="showModal"/>
    <a href="#newRoleModal" class="trigger-new-role-btn" data-toggle="modal" style="display: none" runat="server"></a>


    <asp:SqlDataSource runat="server" ID="SDS_Roles" ConnectionString='<%$ ConnectionStrings:ConnString %>' SelectCommand="SELECT * FROM [Roles]"></asp:SqlDataSource>
</div>