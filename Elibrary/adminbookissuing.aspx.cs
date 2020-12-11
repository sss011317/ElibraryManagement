using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Elibrary
{


     public partial class adminbookissuing : System.Web.UI.Page
    {
        readonly string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            getBookandMemberNames();
            
        }

        protected void IssueButton_Click(object sender, EventArgs e)
        {
            if(checkBookExists() && checkMemberExists())
            {
                if (!checkIssueEntryExist())
                {
                    issueBook();
                    clearForm();
                    Response.Write("<script>alert('Issue Sucess!');</script");
                }
                else
                {
                    Response.Write("<script>alert('This member already had this book!');</script");
                }

            }
            else
            {
                Response.Write("<script>alert('Book or Member wrong');</script");
            }
        }

        protected void ReturnButton_Click(object sender, EventArgs e)
        {
            if (checkBookExists() && checkMemberExists())
            {
                if (!checkIssueEntryExist())
                {
                    Response.Write("<script>alert('This Entry does not Exist!');</script");
                }
                else
                {
                    returnBook();
                    clearForm();
                    Response.Write("<script>alert('Book Returned Successfully!');</script");
                }

            }
            else
            {
                Response.Write("<script>alert('Book or Member wrong');</script");
            }

        }
        void getBookandMemberNames()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand($"SELECT book_name FROM book_master_tb1 WHERE book_id='{BookIDText.Text.Trim()}';", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                if (dt.Rows.Count >= 1)
                {
                    BookNameText.Text = dt.Rows[0]["book_name"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('BookID is not Avaliable');</script");
                    return;
                }

                 cmd = new SqlCommand($"SELECT full_name FROM member_master_tb1 WHERE member_id='{AccountText.Text.Trim()}';", con);

                 da = new SqlDataAdapter(cmd);
                 dt = new DataTable();
                da.Fill(dt);
                con.Close();
                if (dt.Rows.Count >= 1)
                {
                    MemberNameText.Text = dt.Rows[0]["full_name"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Account is not Avaliable');</script");
                    return;
                }
                Response.Write("<script>alert('Search Success');</script");


            }
            catch (Exception ex)
            {
                Response.Write("<script language='javascript'>alert('" + ex.Message + "');</script");
            }
        }
        bool checkBookExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand($"SELECT * FROM book_master_tb1 WHERE book_id='{BookIDText.Text.Trim()}' AND current_stock >0;", con);

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
        bool checkMemberExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand($"SELECT * FROM member_master_tb1 WHERE member_id='{AccountText.Text.Trim()}'", con);

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
        bool checkIssueEntryExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand($"SELECT * FROM book_issue_tb1 WHERE member_id='{AccountText.Text.Trim()}' AND book_id='{BookIDText.Text.Trim()}'", con);

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
        void issueBook()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO book_issue_tb1(member_id,member_name,book_id,book_name,issue_date,due_date) values (@member_id,@member_name,@book_id,@book_name,@issue_date,@due_date);", con);

                cmd.Parameters.AddWithValue("@member_id", AccountText.Text.Trim());
                cmd.Parameters.AddWithValue("@member_name", MemberNameText.Text.Trim());
                cmd.Parameters.AddWithValue("@book_id", BookIDText.Text.Trim());
                cmd.Parameters.AddWithValue("@book_name", BookNameText.Text.Trim());
                cmd.Parameters.AddWithValue("@issue_date", StartDatetext.Text.Trim());
                cmd.Parameters.AddWithValue("@due_date", EndDateText.Text.Trim());
                cmd.ExecuteNonQuery();

                cmd = new SqlCommand($"update book_master_tb1 set current_stock = current_stock-1 WHERE book_id='{BookIDText.Text.Trim()}'", con);
                cmd.ExecuteNonQuery();

                con.Close();



            }
            catch (Exception ex)
            {
                Response.Write("<script language='javascript'>alert('" + ex.Message + "');</script");
            }
        }
        void returnBook()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }


                SqlCommand cmd = new SqlCommand($"DELETE FROM book_issue_tb1 WHERE book_id= '{BookIDText.Text.Trim()}' AND member_id = '{AccountText.Text.Trim()}';", con);
                int result = cmd.ExecuteNonQuery();

                if(result > 0)
                {
                    cmd = new SqlCommand($"update book_master_tb1 set current_stock = current_stock+1 WHERE book_id='{BookIDText.Text.Trim()}'",con);
                    cmd.ExecuteNonQuery();
                    con.Close();

                }
                else
                {
                    Response.Write("<script>alert('Error - Invalid details');</script");
                }

               
            }
            catch (Exception ex)
            {
                Response.Write("<script language='javascript'>alert('" + ex.Message + "');</script");
            }

        }
        void clearForm()
        {
            AccountText.Text = "";
            MemberNameText.Text = "";
            BookIDText.Text = "";
            BookNameText.Text = "";
            StartDatetext.Text = "";
            EndDateText.Text = "";
            GridView1.DataBind();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if(e.Row.RowType == DataControlRowType.DataRow)
                {
                    //Check your condition here
                    DateTime dt = Convert.ToDateTime(e.Row.Cells[5].Text);
                    DateTime today = DateTime.Today;
                    if(today > dt)
                    {
                        e.Row.BackColor = System.Drawing.Color.PaleVioletRed;
                    }
                }
            }
            catch(Exception ex)
            {
                Response.Write("<script language='javascript'>alert('" + ex.Message + "');</script");
            }
        }
    }
}