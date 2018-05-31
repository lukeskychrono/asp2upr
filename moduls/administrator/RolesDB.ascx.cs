using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class moduls_administrator_RolesDB : System.Web.UI.UserControl
{
    string constr = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void showModal(object sender, EventArgs e)
    {
        var page = HttpContext.Current.CurrentHandler as Page;
        page.ClientScript.RegisterStartupScript(page.GetType(),
                                                            "success();",
                                                            "$('.trigger-new-role-btn').trigger('click'); " +
                                                            "function BtnOnClick() { window.location.reload; }" +
                                                            "$('body').on('click', '#NewRoleButton', BtnOnClick);",
                                                            true);
    }

    protected void InsertNewRole(object sender, EventArgs e)
    {

        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("Insert_Role"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@RoleName", txtRoleName.Text);
                    cmd.Connection = con;
                    con.Open();
                    con.Close();
                }
            }
        }
    }

    protected void EditBtnOnClick(object sender, EventArgs e)
    {

        var page = HttpContext.Current.CurrentHandler as Page;
        page.ClientScript.RegisterStartupScript(page.GetType(),
                                                            "success();",
                                                            "$('.trigger-edit-role-btn').trigger('click'); " +
                                                            "function BtnOnClick() { window.location.reload; }" +
                                                            "$('body').on('click', '#EditRoleButton', BtnOnClick);" +
                                                            "$('body').on('click', '#DeleteRoleButton', BtnOnClick);",
                                                            true);
        string constr = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;

        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("ViewRoleById"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    int RoleId = Convert.ToInt32((sender as LinkButton).CommandArgument);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@RoleId", RoleId);
                    cmd.Connection = con;
                    con.Open();
                    DataTable dtbl = new DataTable();
                    sda.SelectCommand = cmd;
                    sda.Fill(dtbl);
                    con.Close();
                    hiddenRoleId.Value = RoleId.ToString();
                    TxtBox_EditRoleName.Text = dtbl.Rows[0]["RoleName"].ToString();
                }
            }
        }
    }

    protected void DeleteRoleOnClick(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("DeleteRoleById"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@RoleId", Convert.ToInt32(hiddenRoleId.Value));
                    cmd.Connection = con;
                    con.Open();
                    con.Close();
                }
            }
        }
    }

    protected void EditRoleOnClick(object sender, EventArgs e)
    {

        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("UpdateRole"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@RoleId", Convert.ToInt32(hiddenRoleId.Value));
                    cmd.Parameters.AddWithValue("@RoleName", TxtBox_EditRoleName.Text.Trim());
                    cmd.Connection = con;
                    con.Open();
                    con.Close();
                    TxtBox_EditRoleName.Text = String.Empty;
                }
            }
        }

    }
}