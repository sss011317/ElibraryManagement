<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminbookissuing.aspx.cs" Inherits="Elibrary.adminbookissuing" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
             $(document).ready(function () {
                 $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
             });
     </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--what's different than "container" and "container-fluid"-->
    <!--if use container-fluid , that will have a size of the page-->
    <!--if use container , that will have a size of what you build inside-->
      <div class="container-fluid">
        <div class="row">
            <div class="col-md-5">
                <!--search at BootStrap website about "cards" function-->
                <div class="card">
                    <div class="card-body">
                        <!--this is content in cardbody(look the gray line edge)-->


                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Book Issuing</h4>
                                </center>
                            </div>
                        </div>

                         <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="imgs/books.png" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                        

                        <div class="row">
                            <div class="col-md-6">
                               <label>Account</label>
                                <!--search at BootStrap Website about "form" function-->
                                <div class="form-group">
                                    <!--"input-group ganna take the asp:option side by side"-->
                                    
                                        <asp:TextBox cssclass="form-control" ID="AccountText" runat="server" placeholder="Account"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                               <label>Book ID</label>
                                <!--search at BootStrap Website about "form" function-->
                                <div class="form-group">
                                   <div class="input-group">
                                        <asp:TextBox cssclass="form-control" ID="BookIDText" runat="server" placeholder="Book ID"></asp:TextBox>
                                        <asp:Button class="btn btn-primary" ID="SearchButton" runat="server" Text="GO" OnClick="SearchButton_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                               <label>Member Name</label>
                                <!--search at BootStrap Website about "form" function-->
                                <div class="form-group">
                                    <!--"input-group ganna take the asp:option side by side"-->
                                    
                                        <asp:TextBox cssclass="form-control" ID="MemberNameText" runat="server" placeholder="Member Name" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                               <label>Book Name</label>
                                <!--search at BootStrap Website about "form" function-->
                                <div class="form-group">
                                    <!--"input-group ganna take the asp:option side by side"-->
                                    
                                        <asp:TextBox cssclass="form-control" ID="BookNameText" runat="server" placeholder="Book Name" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                               <label>Start Date</label>
                                <!--search at BootStrap Website about "form" function-->
                                <div class="form-group">
                                    <!--"input-group ganna take the asp:option side by side"-->
                                    
                                        <asp:TextBox cssclass="form-control" ID="StartDatetext" runat="server" placeholder="Start Date" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                               <label>End Date</label>
                                <!--search at BootStrap Website about "form" function-->
                                <div class="form-group">
                                    <!--"input-group ganna take the asp:option side by side"-->
                                    
                                        <asp:TextBox cssclass="form-control" ID="EndDateText" runat="server" placeholder="End Date" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>




                        <div class="row">
                                <!--search at BootStrap Website about "form" function-->

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <asp:Button class="btn btn-lg btn-block btn-primary" ID="IssueButton" runat="server" Text="Issue" OnClick="IssueButton_Click" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <asp:Button class="btn btn-lg btn-block btn-success" ID="ReturnButton" runat="server" Text="Return" OnClick="ReturnButton_Click" />
                                    </div>
                                </div>
                         </div>
                         <div class="row">   
                            <div class="col-8 mx-auto">
                                <center>
                                    <div class="form-group">
                                        <!--search at BootStrap Website about "button" function-->
                                        <!--btn-block will be same size as your form-->
                                        
                                    </div>
                                </center>
                            </div>
                        </div>

                        <!--this is content in cardbody(look the gray line edge)-->
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
                                    <h4>Issue Book List</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>






                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [book_issue_tb1]"></asp:SqlDataSource>
                            <div class="col">
                                <!--search at BootStrap Website about "table" function-->
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound" >
                                    <Columns>
                                        <asp:BoundField DataField="member_id" HeaderText="Member ID" SortExpression="member_id" />
                                        <asp:BoundField DataField="member_name" HeaderText="Member Name" SortExpression="member_name" />
                                        <asp:BoundField DataField="book_id" HeaderText="Book ID" SortExpression="book_id" />
                                        <asp:BoundField DataField="book_name" HeaderText="Book Name" SortExpression="book_name" />
                                        <asp:BoundField DataField="issue_date" HeaderText="Issue Date" SortExpression="issue_date" />
                                        <asp:BoundField DataField="due_date" HeaderText="Due Date" SortExpression="due_date" />
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
