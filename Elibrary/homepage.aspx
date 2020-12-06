<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="Elibrary.homepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section>
        <img src="imgs/home-bg.jpg"  class="img-fluid"/>
    </section>
    <section>
        <div class="container">
            <!--in the bootstrap "one row can be divided into twelve parts-->
            <!--so if we divide 12 by 3 we have 4 equal parts right(notice the class="col-「12」")-->
            <div class="row">
                <div class="col-12">
                    <center>
                    <h2>Our Feature</h2>
                    <p><b>Our 3 Primary Features</b></p>
                    </center>
                </div>
            </div>
            <div class="row">
                <!--md is means medium size devices-->
                <div class="col-md-4">
                    <center>
                        <img width="150px" img src="imgs/digital-inventory.png" />
                        <h4>Digital Book Inventory</h4>
                        <!--if your container setting the center , you can use the "class="text-***" that can modify this text only -->
                        <p class="text-justify">This is Digital Book Inventory Infomation.This is Digital Book Inventory Infomation.This is Digital Book Inventory Infomation.</p>
                    </center>
                </div>
                <!--md is means medium size devices-->
                <div class="col-md-4">
                    <center>
                        <img width="150px" img src="imgs/digital-data.png" />
                        <h4>Search Books</h4>
                        <!--if your container setting the center , you can use the "class="text-***" that can modify this text only -->
                        <p class="text-justify">This is search books Infomation.This is search books Infomation.This is search books Infomation.</p>
                    </center>
                </div>
                <div class="col-md-4">
                    <center>
                        <img width="150px" img src="imgs/defaulters-list.png" />
                        <h4>Defaulter List</h4>
                        <!--if your container setting the center , you can use the "class="text-***" that can modify this text only -->
                        <p class="text-justify">This is Defaulter List Infomation.This is Defaulter List Infomation.This is Defaulter List Infomation.</p>
                    </center>
                </div>

            </div>
        </div>
    </section>
        <section>
        <img src="imgs/in-homepage-banner.jpg"  class="img-fluid"/>
    </section>
    <section>
        <!--notice!!   container(row(cloumn))-->
        <div class="container">
            <!--in the bootstrap "one row can be divided into twelve parts-->
            <!--so if we divide 12 by 3 we have 4 equal parts right(notice the class="col-「12」")-->
            <div class="row">
                <div class="col-12">
                    <center>
                    <h2>Our Process</h2>
                    <p><b>We have a Simple 3 Step Process</b></p>
                    </center>
                </div>
            </div>
            <div class="row">
                <!--md is means medium size devices-->
                <div class="col-md-4">
                    <center>
                        <img width="150px" img src="imgs/sign-up.png" />
                        <h4>Sign up</h4>
                        <!--if your container setting the center , you can use the "class="text-***" that can modify this text only -->
                        <p class="text-justify">This is Sign up Infomation.This is Sign up Infomation.This is Sign up Infomation.</p>
                    </center>
                </div>
                <!--md is means medium size devices-->
                <div class="col-md-4">
                    <center>
                        <img width="150px" img src="imgs/search-online.png" />
                        <h4>Search Books</h4>
                        <!--if your container setting the center , you can use the "class="text-***" that can modify this text only -->
                        <p class="text-justify">This is search books Infomation.This is search books Infomation.This is search books Infomation</p>
                    </center>
                </div>
                <div class="col-md-4">
                    <center>
                        <img width="150px" img src="imgs/library.png" />
                        <h4>Visit Us</h4>
                        <!--if your container setting the center , you can use the "class="text-***" that can modify this text only -->
                        <p class="text-justify">This is Visit Us Infomation.This is Visit Us Infomation.This is Visit Us Infomation.</p>
                    </center>
                </div>

            </div>
        </div>
    </section>

</asp:Content>
