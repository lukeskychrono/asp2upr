<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Projects.aspx.cs" Inherits="pages_projects_Projects" %>

<%@ Register TagPrefix="my" TagName="MainMenu" Src="~/moduls/MainMenu.ascx" %>
<%@ Register TagPrefix="my" TagName="Footer" Src="~/moduls/Footer.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Menu" Runat="Server">
    <my:MainMenu ID="MainMenu" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
        <!-- Page Content -->
    <div class="container">
        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">One Column Portfolio
                    <small>Subheading</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="index.html">Home</a>
                    </li>
                    <li class="active">One Column Portfolio</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->
    <asp:ListView ID="AllProjects" runat="server" DataSourceID="ProjectsDB" DataKeyNames="ID">
        <ItemTemplate>
                <!-- Project One -->
            <div class="row">
                <div class="col-md-7">
                    <a href="ProjectArticle.aspx" runat="server">
                        <img class="img-responsive img-hover" src='<%# Eval("Images").ToString().Split(new string[] { "\",\"" }, StringSplitOptions.None)[0] %>' alt="" runat="server"/>
                    </a>
                </div>
                <div class="col-md-5">
                    <h3><%#Eval("Title") %></h3>
                    <h4><%#Eval("Subheading") %></h4>
                    <p><%#Eval("Description") %></p>
                    <asp:Button ID="ProjectArticle" CommandArgument='<%# Eval("ID") %>' runat="server" Text="View Project" CssClass="btn btn-primary" OnClick="ProjectArticleOnClick" />
                </div>
            </div>
            <!-- /.row -->

            <hr/>

        </ItemTemplate>  
    </asp:ListView>
        <asp:SqlDataSource runat="server"  ID="ProjectsDB" ConnectionString='<%$ ConnectionStrings:ConnString %>' SelectCommand="SELECT * FROM [Projects] ORDER BY [CreateDate] DESC"></asp:SqlDataSource>
        <!-- Pagination -->
        <div class="container">
        <div class="row">
            <div class="pager">
                <asp:DataPager ID="DP_Projects" runat="server" PagedControlID="AllProjects" PageSize="3">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Link" ShowNextPageButton="false" PreviousPageText="Предишна" ShowFirstPageButton="true" FirstPageText="Първа" ButtonCssClass="previous" />
                        <asp:NumericPagerField ButtonType="Link" ButtonCount="10" NumericButtonCssClass="pagination" />
                        <asp:NextPreviousPagerField ButtonType="Link" ShowPreviousPageButton="false" NextPageText="Следваща" ShowLastPageButton="true" LastPageText="Последна" ButtonCssClass="next" />
                    </Fields>
                </asp:DataPager>
            </div>
        </div>
    </div>
        <!-- /.row -->
        </div>
        <hr/>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" Runat="Server">
      <my:Footer ID="Footer" runat="server" />
</asp:Content>