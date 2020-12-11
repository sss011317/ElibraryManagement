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
    public partial class adminmembermanagement : System.Web.UI.Page
    {
        readonly string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            getMemberByID();
        }

        protected void ActiveButton_Click(object sender, EventArgs e)
        {
            updateMemberStatusByID("active");
        }

        protected void PendingButton_Click(object sender, EventArgs e)
        {
            updateMemberStatusByID("pending");
        }

        protected void DeactiveButton_Click(object sender, EventArgs e)
        {
            updateMemberStatusByID("deactive");
        }

        protected void DeleteUserButton_Click(object sender, EventArgs e)
        {
            deleteMemberByID();
            clearForm();
        }
        void getMemberByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand($"SELECT * FROM member_master_tb1 WHERE member_id='{AccountText.Text.Trim()}';", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        FullnameText.Text = dr.GetValue(0).ToString();
                        BODText.Text = dr.GetValue(1).ToString();
                        ContactNoText.Text = dr.GetValue(2).ToString();
                        EmailText.Text = dr.GetValue(3).ToString();
                        CityText.Text = dr.GetValue(4).ToString();
                        DistrictText.Text = dr.GetValue(5).ToString();
                        PincodeText.Text = dr.GetValue(6).ToString();
                        FulladdressText.Text = dr.GetValue(7).ToString();
                        //getvalue(8) is member
                        //getvalue(9) is password
                        StatusText.Text = dr.GetValue(10).ToString();
                    }
                }
                else
                {
                    Response.Write("<script>alert('Account is not available');</script");
                }
                con.Close();


            }
            catch (Exception ex)
            {
                Response.Write("<script language='javascript'>alert('" + ex.Message + "');</script");
            }
        }
        void updateMemberStatusByID(string status)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand($"UPDATE member_master_tb1 SET account_status='{status}' WHERE member_id ='{AccountText.Text.Trim()}';", con);
                cmd.ExecuteNonQuery();
                con.Close();
                getMemberByID();
                GridView1.DataBind();
                Response.Write("<script>alert('Status updated');</script");

            }
            catch (Exception ex)
            {
                Response.Write("<script language='javascript'>alert('" + ex.Message + "');</script");
            }
        }
        void deleteMemberByID()
        {
            if (checkMemberExists())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("DELETE FROM member_master_tb1 WHERE member_id= @member_id;", con);

                    cmd.Parameters.AddWithValue("@member_id", AccountText.Text.Trim());

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Delete Success');</script");
                }
                catch (Exception ex)
                {
                    Response.Write("<script language='javascript'>alert('" + ex.Message + "');</script");
                }

            }
            else
            {
                Response.Write("<script>alert('Account is not available');</script");
            }

        }
        bool checkMemberExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand($"SELECT * FROM member_master_tb1 WHERE member_id='{AccountText.Text.Trim()}';", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script language='javascript'>alert('" + ex.Message + "');</script");
                return false;
            }
        }     
        void clearForm()
        {
            GridView1.DataBind();
            AccountText.Text = "";
            FullnameText.Text = "";
            BODText.Text = "";
            ContactNoText.Text = "";
            EmailText.Text = "";
            CityText.Text = "";
            DistrictText.Text = "";
            PincodeText.Text = "";
            FulladdressText.Text = "";
            StatusText.Text = "";
        }
    }
}