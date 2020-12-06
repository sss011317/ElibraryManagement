<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminbookissuing.aspx.cs" Inherits="Elibrary.adminbookissuing" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                                    
                                        <asp:TextBox cssclass="form-control" ID="TextBox1" runat="server" placeholder="Account"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                               <label>Book ID</label>
                                <!--search at BootStrap Website about "form" function-->
                                <div class="form-group">
                                   <div class="input-group">
                                        <asp:TextBox cssclass="form-control" ID="TextBox2" runat="server" placeholder="Book ID"></asp:TextBox>
                                        <asp:Button class="btn btn-primary" ID="Button1" runat="server" Text="GO" />
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
                                    
                                        <asp:TextBox cssclass="form-control" ID="TextBox3" runat="server" placeholder="Member Name" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                               <label>Book Name</label>
                                <!--search at BootStrap Website about "form" function-->
                                <div class="form-group">
                                    <!--"input-group ganna take the asp:option side by side"-->
                                    
                                        <asp:TextBox cssclass="form-control" ID="TextBox4" runat="server" placeholder="Book Name" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                               <label>Start Date</label>
                                <!--search at BootStrap Website about "form" function-->
                                <div class="form-group">
                                    <!--"input-group ganna take the asp:option side by side"-->
                                    
                                        <asp:TextBox cssclass="form-control" ID="TextBox5" runat="server" placeholder="Start Date" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                               <label>End Date</label>
                                <!--search at BootStrap Website about "form" function-->
                                <div class="form-group">
                                    <!--"input-group ganna take the asp:option side by side"-->
                                    
                                        <asp:TextBox cssclass="form-control" ID="TextBox6" runat="server" placeholder="End Date" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>




                        <div class="row">
                                <!--search at BootStrap Website about "form" function-->

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <asp:Button class="btn btn-lg btn-block btn-primary" ID="Button3" runat="server" Text="Issue" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <asp:Button class="btn btn-lg btn-block btn-success" ID="Button4" runat="server" Text="Return" />
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
                            <div class="col">
                                <!--search at BootStrap Website about "table" function-->
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server"></asp:GridView>
                            </div>
                        </div>



                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
