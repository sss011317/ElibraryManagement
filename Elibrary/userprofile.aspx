﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userprofile.aspx.cs" Inherits="Elibrary.userprofile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
                                    <img width="100px" src="imgs/generaluser.png" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Your Profile</h4>
                                    <span>Account Status  - </span>
                                    <!--Search at BootStrap Website about "pill badge" function-->
                                    <!--the asp:Label is dynamic that will be changed the status by coding-->
                                    <asp:Label class="badge badge-pill badge-info" ID="Label1" runat="server" Text="your status"></asp:Label>
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
                               <label>Full Name</label>
                                <!--search at BootStrap Website about "form" function-->
                                <div class="form-group">
                                    <asp:TextBox cssclass="form-control" ID="TextBox1" runat="server" placeholder="Full Name"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                               <label>Date of Birth</label>
                                <!--search at BootStrap Website about "form" function-->
                                <div class="form-group">
                                    <asp:TextBox cssclass="form-control" ID="TextBox2" runat="server" placeholder="Date of Birth" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                               <label>Contact No</label>
                                <!--search at BootStrap Website about "form" function-->
                                <div class="form-group">
                                    <asp:TextBox cssclass="form-control" ID="TextBox3" runat="server" placeholder="Contact No" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                               <label>Email</label>
                                <!--search at BootStrap Website about "form" function-->
                                <div class="form-group">
                                    <asp:TextBox cssclass="form-control" ID="TextBox5" runat="server" placeholder="Email" TextMode="Email"></asp:TextBox>
                                </div>
                            </div>
                        </div>



                        <div class="row">
                            <div class="col-md-4">
                               <label>City</label>
                                <!--search at BootStrap Website about "form" function-->
                                <div class="form-group">
                                     <!--if you wanna put the value in the drop down list-->
                                    <asp:DropDownList cssclass="form-control" ID="DropDownList1" runat="server">
                                       
                                        <asp:ListItem Text="Select" Value="select" />
                                        <asp:ListItem Text="Taipei" Value="Taipei" />
                                        <asp:ListItem Text="Keelung" Value="Keelung" />
                                        <asp:ListItem Text="New Taipei" Value="New Taipei" />

                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-4">
                               <label>Distrect</label>
                                <!--search at BootStrap Website about "form" function-->
                                <div class="form-group">
                                    <asp:TextBox cssclass="form-control" ID="TextBox7" runat="server" placeholder="Distrect"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                               <label>Pin Code</label>
                                <!--search at BootStrap Website about "form" function-->
                                <div class="form-group">
                                    <asp:TextBox cssclass="form-control" ID="TextBox8" runat="server" placeholder="Pin Code" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col">
                                <label>Full Address</label>
                                <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" placeholder="Full Address" TextMode="MultiLine" Rows="2"></asp:TextBox>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col">
                                <center>
                                <span class="badge badge-pill badge-info">Login Creadentials</span>
                                </center>        
                            </div>
                        </div>





                        <div class="row">
                                <!--search at BootStrap Website about "form" function-->
                                <div class="col-md-4">
                                    <label>Account</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="TextBox6" runat="server" placeholder="Account" ReadOnly="True"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                <label>Password</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="TextBox4" runat="server" placeholder="Password" TextMode="Password" ReadOnly="True"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                <label>New Password</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="TextBox10" runat="server" placeholder="New Password" TextMode="Password"></asp:TextBox>
                                    </div>
                                </div>
                         </div>
                         <div class="row">   
                            <div class="col-8 mx-auto">
                                <center>
                                    <div class="form-group">
                                        <!--search at BootStrap Website about "button" function-->
                                        <!--btn-block will be same size as your form-->
                                        <asp:Button class="btn btn-primary btn-block btn-lg" ID="Button1" runat="server" Text="Update" />
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
                                    <img width="100px" src="imgs/books1.png" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Your Issue Books</h4>
                                    <!--Search at BootStrap Website about "pill badge" function-->
                                    <!--the asp:Label is dynamic that will be changed the status by coding-->
                                    <asp:Label class="badge badge-pill badge-info" ID="Label2" runat="server" Text="your books info"></asp:Label>
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
