<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ProjectArticle.aspx.cs" Inherits="pages_projects_ProjectArticle" %>

<%@ Register TagPrefix="my" TagName="MainMenu" Src="~/moduls/MainMenu.ascx" %>
<%@ Register TagPrefix="my" TagName="Footer" Src="~/moduls/Footer.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Menu" runat="Server">
    <my:MainMenu ID="MainMenu" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <!-- Page Content -->
    <div class="container">
        <asp:ListView ID="ProjectArticle" runat="server" DataSourceID="ProjectArticleDB">
            <ItemTemplate>
        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header"><%#Eval("Title") %>
                   
                    <small><%#Eval("Subheading") %></small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="Default.aspx">Home</a>
                    </li>
                    <li class="active">Portfolio Item</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->
        <!-- Portfolio Item Row -->
        <div class="row">
            <div class="col-md-8">
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                    </ol>
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <img class="img-responsive" src='<%# Eval("Images").ToString().Split(new string[] { "\",\"" }, StringSplitOptions.None)[0] %>' alt="" runat="server"/>
                        </div>
                        <div class="item">
                            <img class="img-responsive" src='<%# Eval("Images").ToString().Split(new string[] { "\",\"" }, StringSplitOptions.None)[1] %>' alt="" runat="server"/>
                        </div>
                        <div class="item">
                            <img class="img-responsive" src='<%# Eval("Images").ToString().Split(new string[] { "\",\"" }, StringSplitOptions.None)[0] %>' alt="" runat="server"/>
                        </div>
                    </div>
                    <!-- Controls -->
                    <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                    </a>
                    <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                    </a>
                </div>
            </div>

            <div class="col-md-4">
                <h3><%#Eval("Description") %></h3>
                <h3><%#Eval("ProjectDetails") %></h3>
            </div>
        </div>
        <!-- /.row -->

            </ItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="ProjectArticleDB" runat="server" ConnectionString='<%$ ConnectionStrings:ConnString %>' DataSourceMode="DataReader"
            SelectCommand="SELECT * FROM [Projects] WHERE ([Id] = @Id)">
            <SelectParameters>
                <asp:SessionParameter Name="Id" SessionField="ProjectID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
         <!-- Related Projects Row -->
        <div class="row">

            <div class="col-lg-12">
                <h3 class="page-header">Related Projects</h3>
            </div>
        <asp:ListView ID="RelatedProjects" runat="server" DataSourceID="RelatedProjectsDB">
            <ItemTemplate>
        
            <div class="col-sm-3 col-xs-6">
                <a href="#" runat="server">
                    <img class="img-responsive img-hover img-related" src='<%# Eval("Images").ToString().Split(new string[] { "\",\"" }, StringSplitOptions.None)[0] %>' alt="" runat="server"/>
                </a>
        <!-- /.row -->
                </ItemTemplate>
        </asp:ListView>
            <asp:SqlDataSource ID="RelatedProjectsDB" runat="server" ConnectionString='<%$ ConnectionStrings:ConnString %>' DataSourceMode="DataReader"
            SelectCommand="SELECT * FROM [Projects] WHERE ([Id] < @Id + 2 ) AND ( [Id] != @Id) AND ([Id] > @Id - 2 )">
            <SelectParameters>
                <asp:SessionParameter Name="Id" SessionField="ProjectID" Type="Int32" />
            </SelectParameters>
             </asp:SqlDataSource>
            </div>
        </div>
    <!-- /.container -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" runat="Server">
    <my:Footer ID="Footer" runat="server" />
</asp:Content>

