using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Elibrary
{
    public partial class userprofile : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty((string)Session["username"]))
            {
                Response.Redirect("userlogin.aspx");
            }
            else
            {
                getUserBookData();
               
                if (!Page.IsPostBack)
                {
                    getUserData();
                }
            }
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty((string)Session["username"]))
            {
                Response.Redirect("userlogin.aspx");
            }
            else
            {
                updateUserData();
            }


            
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    //Check your condition here
                    DateTime dt = Convert.ToDateTime(e.Row.Cells[5].Text);
                    DateTime today = DateTime.Today;
                    if (today > dt)
                    {
                        e.Row.BackColor = System.Drawing.Color.PaleVioletRed;
                    }
                }
            }
            catch (Exception ex)
            {
                

            }
        }

        void getUserBookData()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand($"SELECT * FROM book_issue_tb1 WHERE member_id='{Session["username"].ToString()}';", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script language='javascript'>alert('" + ex.Message + "');</script");
            }
        }
        void getUserData()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand($"SELECT * FROM member_master_tb1 WHERE member_id='{Session["username"].ToString()}';", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if(dt.Rows.Count >= 1)
                {
                    FullNameText.Text = dt.Rows[0]["full_name"].ToString();
                    DOBText.Text = dt.Rows[0]["dob"].ToString();
                    ContactNoText.Text = dt.Rows[0]["contact_no"].ToString();
                    EmailText.Text = dt.Rows[0]["email"].ToString();
                    CityDropDownList.SelectedValue = dt.Rows[0]["city"].ToString();
                    DistrictText.Text = dt.Rows[0]["district"].ToString();
                    FullAddressText.Text = dt.Rows[0]["full_address"].ToString();
                    PinCodeText.Text = dt.Rows[0]["pincode"].ToString();
                    AccountText.Text = dt.Rows[0]["member_id"].ToString();
                    PasswordText.Text = dt.Rows[0]["password"].ToString();

                    StatusLabel.Text = dt.Rows[0]["account_status"].ToString().Trim();
                    string status = dt.Rows[0]["account_status"].ToString().Trim(); 
                    if (status == "active")
                    {
                        StatusLabel.Attributes.Add("class","badge badge-pill badge-success");
                    }
                    else if(status == "pending")
                    {
                        StatusLabel.Attributes.Add("class", "badge badge-pill badge-warning");
                    }
                    else if(status == "deactive")
                    {
                        StatusLabel.Attributes.Add("class", "badge badge-pill badge-danger");
                    }
                    else
                    {
                        StatusLabel.Attributes.Add("class", "badge badge-pill badge-info");
                    }
                }
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script language='javascript'>alert('" + ex.Message + "');</script");
            }
        }
        void updateUserData()
        {
            string password = "";
            if(NewPassowrdText.Text.Trim() =="")
            {
                password = PasswordText.Text.Trim();
            }
            else
            {
                password = NewPassowrdText.Text.Trim();
            }
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if(con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand($"update member_master_tb1 set full_name=@full_name, dob=@dob, contact_no=@contact_no, email=@email, city=@city, district=@district, pincode=@pincode, full_address=@full_address, password=@password, account_status=@account_status WHERE member_id='{Session["username"].ToString().Trim() }'", con);

                cmd.Parameters.AddWithValue("@full_name", FullNameText.Text.Trim());
                cmd.Parameters.AddWithValue("@dob", DOBText.Text.Trim());
                cmd.Parameters.AddWithValue("@contact_no", ContactNoText.Text.Trim());
                cmd.Parameters.AddWithValue("@email", EmailText.Text.Trim());
                cmd.Parameters.AddWithValue("@city", CityDropDownList.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@district", DistrictText.Text.Trim());
                cmd.Parameters.AddWithValue("@pincode", PinCodeText.Text.Trim());
                cmd.Parameters.AddWithValue("@full_address", FullAddressText.Text.Trim());
                cmd.Parameters.AddWithValue("@password", password);
                cmd.Parameters.AddWithValue("@account_status", "pending");

                int result = cmd.ExecuteNonQuery();
                con.Close();
                if(result > 0)
                {
                    Response.Write("<script>alert('Your Details Updated Successfully!!');</script");
                    getUserBookData();
                    getUserData();
                }
                else
                {
                    Response.Write("<script>alert('Invail Entry!');</script");
                }


            }
            catch (Exception ex)
            {
                Response.Write("<script language='javascript'>alert('" + ex.Message + "');</script");
            }
        }


    }
}
