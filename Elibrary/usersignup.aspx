<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="usersignup.aspx.cs" Inherits="Elibrary.usersignup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container">
        <div class="row">
            <div class="col-md-8 mx-auto">
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
                                    <h4>Member Sign Up</h4>
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
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="full_name" ErrorMessage=" Con't Null" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                                <!--search at BootStrap Website about "form" function-->
                                <div class="form-group">
                                    <asp:TextBox cssclass="form-control" ID="full_name" runat="server" placeholder="Full Name" MaxLength="20" ></asp:TextBox>
                                    
                                    <div class="clsShow"></div>
                                </div>
                            </div>
                            <div class="col-md-6">
                               <label>Date of Birth</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="dob" ErrorMessage=" Con't Null" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                                <!--search at BootStrap Website about "form" function-->
                                <div class="form-group">
                                    <asp:TextBox cssclass="form-control" ID="dob" runat="server" placeholder="Date of Birth" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                               <label>Contact No</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="contact_no" ErrorMessage=" Con't Null" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                                <!--search at BootStrap Website about "form" function-->
                                <div class="form-group">
                                    <asp:TextBox cssclass="form-control" ID="contact_no" runat="server" placeholder="Contact No" TextMode="Number"  MaxLength="10"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                               <label>Email</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="email" ErrorMessage=" Con't Null" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                                <!--search at BootStrap Website about "form" function-->
                                <div class="form-group">
                                    <asp:TextBox cssclass="form-control" ID="email" runat="server" placeholder="Email" TextMode="Email"></asp:TextBox>
                                </div>
                            </div>
                        </div>



                        <div class="row">
                            <div class="col-md-4">
                               <label>City</label>
                                <!--search at BootStrap Website about "form" function-->
                                <div class="form-group">
                                     <!--if you wanna put the value in the drop down list-->
                                    <asp:DropDownList cssclass="form-control" ID="city_DropDownList1" runat="server">
                                       
                                        <asp:ListItem Text="Select" Value="select" />
                                        <asp:ListItem Text="Taipei" Value="Taipei" />
                                        <asp:ListItem Text="Keelung" Value="Keelung" />
                                        <asp:ListItem Text="New Taipei" Value="New Taipei" />

                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-4">
                               <label>Distrect</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="district" ErrorMessage=" Con't Null" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                                <!--search at BootStrap Website about "form" function-->
                                <div class="form-group">
                                    <asp:TextBox cssclass="form-control" ID="district" runat="server" placeholder="Distrect"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                               <label>Pin Code</label>
                                <!--search at BootStrap Website about "form" function-->
                                <div class="form-group">
                                    <asp:TextBox cssclass="form-control" ID="pincode" runat="server" placeholder="Pin Code" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col">
                                <label>Full Address</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="full_address" ErrorMessage=" Con't Null" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:TextBox CssClass="form-control" ID="full_address" runat="server" placeholder="Full Address" TextMode="MultiLine" Rows="2"></asp:TextBox>
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
                                <div class="col-md-6">
                                    <label>Account</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="member_id" ErrorMessage=" Con't Null" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="member_id" runat="server" placeholder="Account" MaxLength="12"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                <label>Password</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="password" ErrorMessage=" Con't Null" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="password" runat="server" placeholder="Password" TextMode="Password" MaxLength="12"></asp:TextBox>
                                    </div>
                                </div>
                            <div class="col">
                                <div class="form-group">
                                    <!--search at BootStrap Website about "button" function-->
                                    <!--btn-block will be same size as your form-->
                                    <asp:Button class="btn btn-success btn-block btn-lg" ID="Button1" runat="server" Text="Sign In" OnClick="Button1_Click" />
                                </div>

                            </div>
                        </div>

                        <!--this is content in cardbody(look the gray line edge)-->
                    </div>
                </div>

                <a href="homepage.aspx"><< Back to Home</a><br /><br />
            </div>
        </div>
    </div>
</asp:Content>
