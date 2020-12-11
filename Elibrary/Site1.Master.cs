using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Elibrary
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                // which means nobody login
                if (string.IsNullOrEmpty((string)Session["role"]))
                {
                    userloginButton.Visible = true;
                    usersignupButton.Visible = true;
                    logoutButton.Visible = false;
                    HelloUserButton.Visible = false;

                    adminloginButton.Visible = true;
                    adminauthormanagementButton.Visible = false;
                    adminpublishermanagementButton.Visible = false;
                    adminbookinventoryButton.Visible = false;
                    adminbookissuingButton.Visible = false;
                    adminmembermanagementButton.Visible = false;
                }
                else if (Session["role"].Equals("user"))
                {
                    userloginButton.Visible = false;
                    usersignupButton.Visible = false;
                    logoutButton.Visible = true;
                    HelloUserButton.Visible = true;
                    HelloUserButton.Text = "Hello "+Session["fullname"].ToString();

                    adminloginButton.Visible = true; 
                    adminauthormanagementButton.Visible = false;
                    adminpublishermanagementButton.Visible = false;
                    adminbookinventoryButton.Visible = false;
                    adminbookissuingButton.Visible = false;
                    adminmembermanagementButton.Visible = false;
                }
                else if (Session["role"].Equals("admin"))
                {
                    userloginButton.Visible = false;
                    usersignupButton.Visible = false;
                    logoutButton.Visible = true;
                    HelloUserButton.Visible = true;
                    HelloUserButton.Text = "Hello Admin";

                    adminloginButton.Visible = false;
                    adminauthormanagementButton.Visible = true;
                    adminpublishermanagementButton.Visible = true;
                    adminbookinventoryButton.Visible = true;
                    adminbookissuingButton.Visible = true;
                    adminmembermanagementButton.Visible = true;
                }
            }
            catch(Exception ex)
            {
                Response.Write("<script language='javascript'>alert('" + ex.Message + "');</script");
            }

        }

        protected void adminlogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminlogin.aspx");
        }

        protected void adminauthormanagement_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminauthormanagement.aspx");
        }

        protected void adminpublishermanagement_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminpublishermanagement.aspx");
        }

        protected void adminbookinventory_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminbookinventory.aspx");
        }

        protected void adminbookissuing_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminbookissuing.aspx");
        }

        protected void adminmembermanagement_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminmembermanagement.aspx");
        }

        protected void viewbooks_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewbooks.aspx");
            
            
            
        }

        protected void userlogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("userlogin.aspx");
        }

        protected void usersignup_Click(object sender, EventArgs e)
        {
            Response.Redirect("usersignup.aspx");
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session["uesrname"] = "";
            Session["fullname"] = "";
            Session["role"] = "";
            Session["status"] = "";
            ScriptManager.RegisterStartupScript(this, this.GetType(),
                "alert",
                "alert('Log Out Success!!');window.location='homepage.aspx';", true);

        }

        protected void HelloUserButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("userprofile.aspx");
        }
    }
}