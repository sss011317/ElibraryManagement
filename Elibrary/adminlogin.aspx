<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminlogin.aspx.cs" Inherits="Elibrary.adminlogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <!--search at BootStrap website about "cards" function-->
                <div class="card">
                    <div class="card-body">
                        <!--this is content in cardbody(look the gray line edge)-->
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="150px" src="imgs/adminuser.png" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Admin Login</h3>
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
                                <!--search at BootStrap Website about "form" function-->
                                <div class="form-group">
                                    <asp:TextBox cssclass="form-control" ID="AccountTextBox" runat="server" placeholder="Account"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox cssclass="form-control" ID="PasswordTextBox" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <!--search at BootStrap Website about "button" function-->
                                    <!--btn-block will be same size as your form-->
                                    <asp:Button class="btn btn-primary btn-block btn-lg" ID="LogInButton" runat="server" Text="Log In" OnClick="LogInButton_Click" />
                                </div>

                            </div>
                        </div>

                        <!--this is content in cardbody(look the gray line edge)-->
                    </div>
                </div>

                <a href="homepage.aspx"><< Back to Home/a><br /><br />
            </div>
        </div>
    </div>
</asp:Content>
