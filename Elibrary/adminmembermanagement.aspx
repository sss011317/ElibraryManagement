<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminmembermanagement.aspx.cs" Inherits="Elibrary.adminmembermanagement" %>
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
                                    <h4>Member Details</h4>
                                </center>
                            </div>
                        </div>

                         <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="imgs/generaluser.png" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                        

                        <div class="row">
                            <div class="col-md-3">
                               <label>Account</label>
                                <!--search at BootStrap Website about "form" function-->
                                <div class="form-group">
                                    <!--"input-group ganna take the asp:option side by side"-->
                                    <div class="input-group">
                                        <asp:TextBox cssclass="form-control" ID="TextBox1" runat="server" placeholder="Account"></asp:TextBox>
                                        <asp:Button class="btn btn-primary" ID="Button1" runat="server" Text="GO" />
                                     </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                               <label>Full Name</label>
                                <!--search at BootStrap Website about "form" function-->
                                <div class="form-group">
                                        <asp:TextBox cssclass="form-control" ID="TextBox2" runat="server" placeholder="Full Name" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-5">
                               <label>Account Status</label>
                                <!--search at BootStrap Website about "form" function-->
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox cssclass="form-control" ID="TextBox7" runat="server" placeholder="Account Status" ReadOnly="true"></asp:TextBox>
                                        <!--search at Fontawsome Website about the icon make-->
                                        <!--search at BootStrap Website about "spacing" function that will know how the "mr-1" works-->
                                        <asp:LinkButton class="btn btn-success mr-1" ID="Button2" runat="server" Text="S"><i class="fas fa-check-circle"></i></asp:LinkButton>
                                        <asp:LinkButton class="btn btn-warning mr-1" ID="Button5" runat="server" Text="P"><i class="fas fa-pause-circle"></i></asp:LinkButton>
                                        <asp:LinkButton class="btn btn-danger mr-1" ID="Button6" runat="server" Text="D"><i class="fas fa-times-circle"></i></asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-3">
                               <label>Birth of Date</label>
                                <!--search at BootStrap Website about "form" function-->
                                <div class="form-group">
                                    <!--"input-group ganna take the asp:option side by side"-->
                                    
                                        <asp:TextBox cssclass="form-control" ID="TextBox3" runat="server" placeholder="Bitrh of Date" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                             <div class="col-md-4">
                               <label>Contact No</label>
                                <!--search at BootStrap Website about "form" function-->
                                <div class="form-group">
                                    <!--"input-group ganna take the asp:option side by side"-->
                                    
                                        <asp:TextBox cssclass="form-control" ID="TextBox8" runat="server" placeholder="Contact No" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-5">
                               <label>Book Name</label>
                                <!--search at BootStrap Website about "form" function-->
                                <div class="form-group">
                                    <!--"input-group ganna take the asp:option side by side"-->
                                    
                                        <asp:TextBox cssclass="form-control" ID="TextBox4" runat="server" placeholder="Book Name" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                               <label>City</label>
                                <!--search at BootStrap Website about "form" function-->
                                <div class="form-group">
                                    <!--"input-group ganna take the asp:option side by side"-->
                                    
                                        <asp:TextBox cssclass="form-control" ID="TextBox9" runat="server" placeholder="City" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                             <div class="col-md-4">
                               <label>District</label>
                                <!--search at BootStrap Website about "form" function-->
                                <div class="form-group">
                                    <!--"input-group ganna take the asp:option side by side"-->
                                    
                                        <asp:TextBox cssclass="form-control" ID="TextBox10" runat="server" placeholder="District" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                               <label>Pin Code</label>
                                <!--search at BootStrap Website about "form" function-->
                                <div class="form-group">
                                    <!--"input-group ganna take the asp:option side by side"-->
                                    
                                        <asp:TextBox cssclass="form-control" ID="TextBox11" runat="server" placeholder="Pin Code" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12">
                                <label>Full Postal Address</label>
                                <asp:TextBox cssclass="form-control" ID="TextBox12" runat="server" placeholder="Full Postal Address" ReadOnly="true" Rows="2" TextMode="MultiLine"></asp:TextBox>
                            </div>
                        </div>


                        <hr />
                        <div class="row">
                                <!--search at BootStrap Website about "form" function-->
                                <div class="col-8 mx-auto">
                                        <asp:Button class="btn btn-lg btn-block btn-danger" ID="Button4" runat="server" Text="Delete User Permanently" />
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
                                    <h4>Member List</h4>
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
