﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Sites/Master.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Insta_Web.Sites.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div class="container-fluid">

        <div class="row">
         <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2" >
             <ItemTemplate >
    <div class="col-md-12 col-xs-12 col-lg-12 col-sm-12 "  style="text-align:left;background-color:#4B4343;border-bottom-right-radius:10px;border-bottom-left-radius:10px;border-top-left-radius:10px;border-top-right-radius:10px;">
      <div class="row">
            <div class="col-md-2" style="text-align:left">
                 <a href="Profile.aspx?Influencer_ID=<%# Eval("Influencer_ID") %>">
        <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("Profile_pic") %>' CssClass="img-thumbnail" Height="100px" Width="100px" BorderWidth="0"/>
        </a>
            </div>
        <div class="col-md-9" style="text-align:left">
                

        <asp:Label ID="Label3" runat="server" CssClass="h1" Font-size="Small"
               Text="Name :"  Font-Bold="True" ForeColor="#FFFFFF"/>

             <asp:Label ID="Label1" runat="server" CssClass="h1" Font-size="Small"
               Text='<%# Eval("Influencer_Name") %>'  Font-Bold="True" ForeColor="#FFFFFF"/>
          <br />
        <asp:Label ID="Label4" runat="server" CssClass="h1" Font-size="Small"
               Text="Profile Link :"  Font-Bold="True" ForeColor="#FFFFFF"/>
        <a href="<%# Eval("Insta_Link") %>" target="_blank">
        <asp:Label ID="Label2" runat="server" CssClass="h1" Font-size="Small"
               Text='<%# Eval("Insta_ID") %>'  Font-Bold="True" ForeColor="#FFFFFF"/>
         </a>
            </div>
          </div>
          </div>           
                 </ItemTemplate>
         </asp:Repeater>
          


 <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Insta_webConnectionString %>" 
        SelectCommand="SELECT [Influencer_ID], [Insta_ID], [Influencer_Name], [Insta_Link],[Profile_pic] from [Influencer_Table] where ([Influencer_ID]= @Influencer_ID)">
 <SelectParameters>
            <asp:QueryStringParameter Name="Influencer_ID" QueryStringField="Influencer_ID" Type="Int32" />
        </SelectParameters>           
 </asp:SqlDataSource>
</div>
</div>


      <div class="container-fluid">
        <div class="row">
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                      <div class="col-md-6 col-xs-10 col-lg-4 col-sm-8 " style="text-align:center; margin-bottom:10px" >
                    <a href="Image_viewer.aspx?Imageid=<%# Eval("Image_ID") %>">
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Image_Path") %>' Height="295px" Width="300px" />
                        </a>
                    <br />
               
                  </div> 
                </ItemTemplate>
            </asp:Repeater>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Insta_webConnectionString %>" 
        SelectCommand="SELECT [Image_ID], [category], [Image_Name], [Image_Path],[Influencer_ID] FROM [Image_Table] WHERE ([Influencer_ID]=@Influencer_ID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="Influencer_ID" QueryStringField="Influencer_ID" Type="Int32" />
        </SelectParameters>
            </asp:SqlDataSource>

</div>
</div>



</asp:Content>
