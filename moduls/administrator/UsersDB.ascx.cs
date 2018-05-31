using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class moduls_administrator_UsersDB : System.Web.UI.UserControl
{
    string constr = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
    
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void editBtn_OnClick(object sender, EventArgs e)
    {

        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("ViewUserById"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    int UserId = Convert.ToInt32((sender as Button).CommandArgument);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@UserId", UserId);
                    cmd.Connection = con;
                    con.Open();
                    DataTable dtbl = new DataTable();
                    sda.SelectCommand = cmd;
                    sda.Fill(dtbl);
                    con.Close();
                    hiddenUserId.Value = UserId.ToString();
                    txtEditUsername.Text = dtbl.Rows[0]["Username"].ToString();
                    txtEditPassword.Text = dtbl.Rows[0]["Password"].ToString();
                    txtEditEmail.Text = dtbl.Rows[0]["Email"].ToString();
                    txtEditRole.Text = dtbl.Rows[0]["RoleId"].ToString();
                }
            }
        }


        var page = HttpContext.Current.CurrentHandler as Page;
        page.ClientScript.RegisterStartupScript(page.GetType(),
                                                            "success();",
                                                            "$('.trigger-edit-user-btn').trigger('click'); " +
                                                            "function BtnUserOnClick() { window.location.reload; } " +
                                                            "$('body').on('click', '#editUserBtn', BtnUserOnClick); " +
                                                            "$('body').on('click', '#deleteUserBtn', BtnUserOnClick); ",
                                                            true);
    }

    protected void deleteUserOnClick(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("DeleteUserById"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@UserId", Convert.ToInt32(hiddenUserId.Value));
                    cmd.Connection = con;
                    con.Open();
                    con.Close();
                }
            }
        }
    }

    protected void editUserOnClick(object sender, EventArgs e)
    {

        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("UpdateUser"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@UserId", Convert.ToInt32(hiddenUserId.Value));
                    cmd.Parameters.AddWithValue("@Username", txtEditUsername.Text.Trim());
                    cmd.Parameters.AddWithValue("@Password", txtEditPassword.Text.Trim());
                    cmd.Parameters.AddWithValue("@Email", txtEditEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@RoleId", Convert.ToInt32(txtEditRole.Text.Trim()));
                    cmd.Connection = con;
                    con.Open();
                    con.Close();
                    txtEditUsername.Text = String.Empty;
                    txtEditPassword.Text = String.Empty;
                    txtEditEmail.Text = String.Empty;
                    txtEditRole.Text = String.Empty;
                }
            }
        }

    }

    protected void insertBtnOnClick(object sender, EventArgs e)
    {
        var page = HttpContext.Current.CurrentHandler as Page;
        page.ClientScript.RegisterStartupScript(page.GetType(),
                                                            "success();",
                                                            "$('.trigger-new-user-btn').trigger('click'); " +
                                                            "function BtnOnClick() { window.location.reload; }" +
                                                            "$('body').on('click', '#userInsertButton', BtnOnClick);", 
                                                            true);


    }
    protected void insertUser(object sender, EventArgs e)
    {

        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("InsertCustomUser"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Username", txtUsername.Text.Trim());
                    cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@RoleId", Convert.ToInt32(txtRole.Text.Trim()));
                    cmd.Connection = con;
                    con.Open();
                    con.Close();
                    txtUsername.Text = String.Empty;
                    txtPassword.Text = String.Empty;
                    txtEmail.Text = String.Empty;
                    txtRole.Text = String.Empty;
                }
            }
        }                  
    }
}