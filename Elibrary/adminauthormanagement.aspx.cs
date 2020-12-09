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
    public partial class adminauthormanagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void AddButton_Click(object sender, EventArgs e)
        {
            

            try
            {
                if (checkAuthorExists())
                {
                    Response.Write("<script>alert('AuthorID is Exist');</script");
                }
                else
                {
                    addNewAuthor();
                    Response.Write("<script language='javascript'>alert('authorID added successly!');</script");
                    
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script");
            }
            clearForm();
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            if (checkAuthorExists())
            {
                updateAuthor();
                Response.Write("<script language='javascript'>alert('authorID modified successly!');</script");
            }
            else
            {
                Response.Write("<script>alert('AuthorID is not available');</script");
            }
            clearForm();
        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            deleteAuthor();
            Response.Write("<script language='javascript'>alert('authorID delete successly!');</script");
            clearForm();
        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            getAuthorByID();
        }

        bool checkAuthorExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand($"SELECT * FROM author_master_tb1 WHERE author_id={AuthorIDText.Text.Trim()};", con);

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
                Response.Write("<script>alert('" + ex.Message + "');</script");
                return false;
            }

        }
        void getAuthorByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand($"SELECT * FROM author_master_tb1 WHERE author_id={AuthorIDText.Text.Trim()};", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                if (dt.Rows.Count >= 1)
                {
                    AuthorNameText.Text = dt.Rows[0][1].ToString();
                }
                else
                {
                    Response.Write("<script>alert('AuthorID is not available');</script");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script");
            }
        }
        void addNewAuthor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO author_master_tb1(author_id,author_name) values (@author_id,@author_name);", con);

                cmd.Parameters.AddWithValue("@author_id",AuthorIDText.Text.Trim());
                cmd.Parameters.AddWithValue("@author_name",AuthorNameText.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script");
            }
        }
        void updateAuthor()
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("UPDATE author_master_tb1 SET author_name = @author_name where author_id= @author_id;", con);

            cmd.Parameters.AddWithValue("@author_name", AuthorNameText.Text.Trim());
            cmd.Parameters.AddWithValue("@author_id", AuthorIDText.Text.Trim());
            cmd.ExecuteNonQuery();
            con.Close();

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
                SqlCommand cmd = new SqlCommand("DELETE FROM author_master_tb1 WHERE author_id= @author_id;", con);

                cmd.Parameters.AddWithValue("@author_id", AuthorIDText.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script");
            }

        }
        void clearForm()
        {
            AuthorIDText.Text= "";
            AuthorNameText.Text= "";
            GridView1.DataBind();  
        }


    }

}