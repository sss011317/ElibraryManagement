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
    public partial class adminpublishermanagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AddButton_Click(object sender, EventArgs e)
        {
            try
            {
                if (checkPublisherExists())
                {
                    Response.Write("<script>alert('PublisherID is Exist');</script");
                }
                else
                {
                    addNewPublisher();
                    Response.Write("<script language='javascript'>alert('PublisherID added successly!');</script");

                }

            }
            catch (Exception ex)
            {
                Response.Write("<script language='javascript'>alert('" + ex.Message + "');</script");
            }
            clearForm();
        }


        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            if (checkPublisherExists())
            {
                updateAuthor();
                getPublisherByID();
                GridView1.DataBind();
                Response.Write("<script>alert('Publisher Update Successfully');</script");
            }
            else
            {
                Response.Write("<script>alert('PublisherID added successly!');</script");

            }
            
        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            deleteAuthor();
            clearForm();
            Response.Write("<script>alert('Publisher Delete Successfully');</script");
        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            getPublisherByID();
        }
        bool checkPublisherExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand($"SELECT * FROM publisher_master_tb1 WHERE publisher_id='{PublisherIDText.Text.Trim()}';", con);

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
        void getPublisherByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand($"SELECT * FROM publisher_master_tb1 WHERE publisher_id='{PublisherIDText.Text.Trim()}';", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                if (dt.Rows.Count >= 1)
                {
                    PublisherNameText.Text = dt.Rows[0][1].ToString();
                }
                else
                {
                    Response.Write("<script>alert('AuthorID is not available');</script");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script language='javascript'>alert('" + ex.Message + "');</script");
            }
        }
        void addNewPublisher()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO publisher_master_tb1(publisher_id,publisher_name) values (@publisher_id,@publisher_name);", con);

                cmd.Parameters.AddWithValue("@publisher_id", PublisherIDText.Text.Trim());
                cmd.Parameters.AddWithValue("@publisher_name", PublisherNameText.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();



            }
            catch (Exception ex)
            {
                Response.Write("<script language='javascript'>alert('" + ex.Message + "');</script");
            }

        }
        void updateAuthor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE publisher_master_tb1 SET publisher_name = @publisher_name where publisher_id= @publisher_id;", con);

                cmd.Parameters.AddWithValue("@publisher_name", PublisherNameText.Text.Trim());
                cmd.Parameters.AddWithValue("@publisher_id", PublisherIDText.Text.Trim());
                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script language='javascript'>alert('" + ex.Message + "');</script");
            }


        }
        void deleteAuthor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand($"DELETE FROM publisher_master_tb1 WHERE publisher_id= '{PublisherIDText.Text.Trim()}';", con);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script language='javascript'>alert('" + ex.Message + "');</script");
            }

        }
        void clearForm()
        {
            PublisherIDText.Text = "";
            PublisherNameText.Text = "";
            GridView1.DataBind();
        }

    }
}