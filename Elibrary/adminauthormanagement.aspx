<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminauthormanagement.aspx.cs" Inherits="Elibrary.adminauthormanagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <script type="text/javascript">
        //wanna know more info search at https://datatables.net/
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
   </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-5">
                <%--search at BootStrap website about "cards" function--%>
                <div class="card">
                    <div class="card-body">
                        <%--this is content in cardbody(look the gray line edge)--%>


                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Author Details</h4>
                                </center>
                            </div>
                        </div>

                         <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="imgs/writer.png" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                        

                        <div class="row">
                            <div class="col-md-4">
                               <label>Author ID</label>
                                <%--search at BootStrap Website about "form" function--%>
                                <div class="form-group">
                                    <%--"input-group ganna take the asp:option side by side"--%>
                                    <div class="input-group">
                                        <asp:TextBox cssclass="form-control" ID="AuthorIDText" runat="server" placeholder="ID"></asp:TextBox>
                                        <asp:Button class="btn btn-primary" ID="SearchButton" runat="server" Text="GO" OnClick="SearchButton_Click" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-8">
                               <label>Author Name</label>
                                <%--search at BootStrap Website about "form" function--%>
                                <div class="form-group">
                                    <asp:TextBox cssclass="form-control" ID="AuthorNameText" runat="server" placeholder="Autor Name"></asp:TextBox>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                                <%--search at BootStrap Website about "form" function--%>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <asp:Button class="btn btn-lg btn-block btn-success" ID="AddButton" runat="server" Text="Add" OnClick="AddButton_Click" />
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <asp:Button class="btn btn-lg btn-block btn-primary" ID="UpdateButton" runat="server" Text="Update" OnClick="UpdateButton_Click" />
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <asp:Button class="btn btn-lg btn-block btn-danger" ID="DeleteButton" runat="server" Text="Delete" OnClick="DeleteButton_Click" />
                                    </div>
                                </div>
                         </div>
                         <div class="row">   
                            <div class="col-8 mx-auto">
                                <center>
                                    <div class="form-group">
                                        <%--search at BootStrap Website about "button" function--%>
                                        <%--btn-block will be same size as your form--%>
                                        
                                    </div>
                                </center>
                            </div>
                        </div>

                        <%--this is content in cardbody(look the gray line edge)--%>
                    </div>
                </div>

                <a href="homepage.aspx"><< Back to Home</a><br /><br />
            </div>

            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Author List</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>






                        <div class="row">
                            <%--if you wanna connect and get the view with database, you can use disgn page that has UI can select on--%>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>"  SelectCommand="SELECT * FROM [author_master_tb1]"></asp:SqlDataSource>
                               <%--TODO: What is OnSelecting="SqlDataSource1_Selecting"?--%>
                            <div class="col">
                                <!--search at BootStrap Website about "table" function-->
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="author_id" DataSourceID="SqlDataSource1">
                                <%--TODO: What is  OnSelectedIndexChanged="GridView_SelectedIndexChanged"--%>
                                    <Columns>
                                        <asp:BoundField DataField="author_id" HeaderText="author_id" ReadOnly="True" SortExpression="author_id" />
                                        <asp:BoundField DataField="author_name" HeaderText="author_name" SortExpression="author_name" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>



                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
