using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Elibrary
{
    public partial class adminbookinventory : System.Web.UI.Page
    {
        readonly string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static string global_filepath;
        static int global_actual_stock, global_current_stock, global_issued_books;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillAuthorPublisherValues();
            }
            
            GridView1.DataBind();
        }
        protected void SearchButton_Click(object sender, EventArgs e)
        {
            getBookByID();
        }



        protected void AddButton_Click(object sender, EventArgs e)
        {
            if (checkBookExists())
            {
                Response.Write("<script>alert('This BookID or BookName is Exist');</script");
            }
            else
            {
                addNewBook();
                clearForm();

            }
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            if (checkBookExists())
            {
                updateBookByID();
                Response.Write("<script>alert('Book Update Successfully!');</script");
            }
            else
            {
                Response.Write("<script>alert('This BookID is not Exist');</script");
            }
           
        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            deleteBook();
            Response.Write("<script>alert('Deleted Successfully!');</script");
            clearForm();
        }
        void fillAuthorPublisherValues()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT author_name FROM author_master_tb1;", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                AuthorNameDropDownList.DataSource = dt;
                AuthorNameDropDownList.DataValueField = "author_name";
                AuthorNameDropDownList.DataBind();

                cmd = new SqlCommand("SELECT publisher_name FROM publisher_master_tb1;", con);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
                PublisherDropDownList.DataSource = dt;
                PublisherDropDownList.DataValueField = "publisher_name";
                PublisherDropDownList.DataBind();

                //con.Close();
            }
            catch(Exception ex)
            {
                Response.Write("<script language='javascript'>alert('" + ex.Message + "');</script");
            }
        }
        void addNewBook()
        {
            try
            {
                string genres = "";
                foreach(int i in GenreList.GetSelectedIndices())
                {
                    genres = genres + GenreList.Items[i] + ",";
                }
                genres = genres.Remove(genres.Length - 1); // remove last commas

                string filepath = "~/book_inventory/books1.png";
                if(FileUpload1.FileName != "")
                {
                    string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    FileUpload1.SaveAs(Server.MapPath("book_inventory/" + filename));
                    filepath = "~/book_inventory/" + filename;
                }
                else
                {
                    Response.Write("<script>alert('choose your photo, Thanks!');</script");
                    return;
                }

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO book_master_tb1" +
                    "(book_id,book_name,genre,author_name,publisher_name,publish_date,language,edition,book_cost,no_of_pages,book_description,actual_stock,current_stock,book_img_link)" +
                    "values" +
                    "(@book_id,@book_name,@genre,@author_name,@publisher_name,@publish_date,@language,@edition,@book_cost,@no_of_pages,@book_description,@actual_stock,@current_stock,@book_img_link)", con);

                cmd.Parameters.AddWithValue("@book_id", BookIDText.Text.Trim());
                cmd.Parameters.AddWithValue("@book_name", BookNameText.Text.Trim());
                cmd.Parameters.AddWithValue("@genre",genres);
                cmd.Parameters.AddWithValue("@author_name", AuthorNameDropDownList.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publisher_name", PublisherDropDownList.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publish_date", PublishDateText.Text.Trim());
                cmd.Parameters.AddWithValue("@language", LanguageDropDownList.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@edition", EditionText.Text.Trim());
                cmd.Parameters.AddWithValue("@book_cost", BookCostText.Text.Trim());
                cmd.Parameters.AddWithValue("@no_of_pages", PagesText.Text.Trim());
                cmd.Parameters.AddWithValue("@book_description", BookDescriptionText.Text.Trim());
                cmd.Parameters.AddWithValue("@actual_stock", ActualStockText.Text.Trim());
                cmd.Parameters.AddWithValue("@current_stock", ActualStockText.Text.Trim());
                cmd.Parameters.AddWithValue("@book_img_link",filepath);


                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Add Book Success!');</script");
            }
            catch(Exception ex)
            {
                Response.Write("<script language='javascript'>alert('" + ex.Message + "');</script");
            }
        
        }


        void updateBookByID()
        {
            try
            {
                int actual_stock = Convert.ToInt32(ActualStockText.Text.ToString());
                int current_stock = Convert.ToInt32(CurrentStockText.Text.ToString());

                if(actual_stock != current_stock)
                {
                    if(actual_stock < global_issued_books)
                    {
                        Response.Write("<script>alert('Actual Stock Value con't be less than the Issued Books!');</script");
                        return ;
                    }
                    else
                    {
                        current_stock = actual_stock - global_issued_books;
                        CurrentStockText.Text = "" + current_stock;
                    }
                }

                string genres = "";
                foreach (int i in GenreList.GetSelectedIndices())
                {
                    genres = genres + GenreList.Items[i] + ",";
                }
                genres = genres.Remove(genres.Length - 1); // remove last commas

                string filepath = "~/book_inventory/books1.png";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                if (string.IsNullOrEmpty(filename))
                {
                    filepath = global_filepath;
                }
                else
                {
                    FileUpload1.SaveAs(Server.MapPath("book_inventory/" + filename));
                    filepath = "~/book_inventory/" + filename;
                }


                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE book_master_tb1 set book_name=@book_name, genre=@genre, author_name=@author_name, publisher_name=@publisher_name, publish_date=@publish_date, language=@language, edition=@edition, book_cost=@book_cost, no_of_pages=@no_of_pages, book_description=@book_description, actual_stock=@actual_stock, current_stock=@current_stock, book_img_link=@book_img_link where book_id= @author_id;", con);

                //cmd.Parameters.AddWithValue("@author_name", AuthorNameText.Text.Trim());
                cmd.Parameters.AddWithValue("@author_id", BookIDText.Text.Trim());
                cmd.Parameters.AddWithValue("@book_name",BookNameText.Text.Trim());
                cmd.Parameters.AddWithValue("@genre", genres);
                cmd.Parameters.AddWithValue("@author_name", AuthorNameDropDownList.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publisher_name", PublisherDropDownList.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publish_date", PublishDateText.Text.Trim());
                cmd.Parameters.AddWithValue("@language", LanguageDropDownList.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@edition", EditionText.Text.Trim());
                cmd.Parameters.AddWithValue("@book_cost", BookCostText.Text.Trim());
                cmd.Parameters.AddWithValue("@no_of_pages", PagesText.Text.Trim());
                cmd.Parameters.AddWithValue("@book_description", BookDescriptionText.Text.Trim());
                cmd.Parameters.AddWithValue("@actual_stock",actual_stock.ToString());
                cmd.Parameters.AddWithValue("@current_stock",current_stock.ToString());
                cmd.Parameters.AddWithValue("@book_img_link",filepath);

                cmd.ExecuteNonQuery();
                con.Close();
                getBookByID();
                GridView1.DataBind();

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
                SqlCommand cmd = new SqlCommand($"SELECT * FROM book_master_tb1 WHERE book_id='{BookIDText.Text.Trim()}' OR book_name = '{BookNameText.Text.Trim()}';", con);

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


        void getBookByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand($"SELECT * FROM book_master_tb1 WHERE book_id='{BookIDText.Text.Trim()}';", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                if (dt.Rows.Count >= 1)
                {
                    BookNameText.Text = dt.Rows[0]["book_name"].ToString();
                    PublishDateText.Text = dt.Rows[0]["publish_date"].ToString();
                    EditionText.Text = dt.Rows[0]["edition"].ToString();
                    BookCostText.Text = dt.Rows[0]["book_cost"].ToString().Trim();
                    PagesText.Text = dt.Rows[0]["no_of_pages"].ToString().Trim();
                    BookDescriptionText.Text = dt.Rows[0]["book_description"].ToString();
                    ActualStockText.Text = dt.Rows[0]["actual_stock"].ToString().Trim();
                    CurrentStockText.Text = dt.Rows[0]["current_stock"].ToString().Trim();
                    IssueBooksText.Text = "" + (Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString()) - Convert.ToInt32(dt.Rows[0]["current_stock"].ToString()));
                    LanguageDropDownList.SelectedValue = dt.Rows[0]["language"].ToString();
                    PublisherDropDownList.SelectedValue = dt.Rows[0]["publisher_name"].ToString();
                    AuthorNameDropDownList.SelectedValue = dt.Rows[0]["author_name"].ToString();
                    GenreList.ClearSelection();
                    string[] Datagenre = dt.Rows[0]["genre"].ToString().Trim().Split(',');
                    for(int DatagenreLength = 0; DatagenreLength < Datagenre.Length; DatagenreLength++)
                    {
                        for(int genrelistCount=0; genrelistCount < GenreList.Items.Count; genrelistCount++)
                        {
                            if(GenreList.Items[genrelistCount].ToString() == Datagenre[DatagenreLength])
                            {
                                GenreList.Items[genrelistCount].Selected = true;
                            }
                        }
                    }


                    global_actual_stock = Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString());
                    global_current_stock = Convert.ToInt32(dt.Rows[0]["current_stock"].ToString());
                    global_issued_books = global_actual_stock - global_current_stock;
                    global_filepath = dt.Rows[0]["book_img_link"].ToString();

                }
                else
                {
                    Response.Write("<script>alert('BookID is not available');</script");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script language='javascript'>alert('" + ex.Message + "');</script");
            }
        }
        void deleteBook()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand($"DELETE FROM book_master_tb1 WHERE book_id= '{BookIDText.Text.Trim()}';", con);

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
            GridView1.DataBind();
            BookIDText.Text="";
            BookNameText.Text = "";
            PublishDateText.Text="";
            EditionText.Text="";
            BookCostText.Text="";
            PagesText.Text="";
            BookDescriptionText.Text="";
            ActualStockText.Text="";
        }
    }
}