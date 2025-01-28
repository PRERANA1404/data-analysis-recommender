<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="RecommendePage.aspx.cs" Inherits="data_Analysis_ad_Recommender_System.RecommendePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .imageButton {
            background-image: url('Images/search.png');
            background-size: cover;
            border: none;
            width: 40px; /* Adjust as needed */
            height: 10px; /* Adjust as needed */
            cursor: pointer;
        }

        .DataCollectionCard {
            border: 1px solid #ccc;
            padding: 11px;
            margin: 8px;
            width: 235px;
            height: 220px;
            float: left;
            color: black;
            background-color: lavender;
            opacity: 0.9;
            font-size: 17px;
        }
         .DataCollectionCardagain {
            border: 1px solid #ccc;
            padding: 11px;
            margin: 8px;
            width: 237px;
            height: 230px;
            float: left;
            color: black;
            background-color: lavender;
            opacity: 0.9;
            font-size: 17px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 100%; background-color: black; height: 60px">
        <tr>
            <td style="width: 5%"></td>
            <td style="width: 70%">
                <span style="color: white; font-size: 25px">Data analysis and recommender system</span> 
            </td>
            <td style="width: 10%"></td>
            <td style="width: 15%" align="left">
               <a href="loginPage.aspx"><span style="color: white; font-size: 22px">Logout</span></a> 
            </td>
        </tr>
    </table>
    <br />
    <br />
    <div class="container" style="width: 95%; border-radius: 16px; background-color: whitesmoke">
        <h3 style="font-family: 'Times New Roman', Times, serif">Recommendation by Search History</h3>
        <asp:DataList ID="DataList1" runat="server" RepeatColumns="5" CellPadding="5" CellSpacing="20">
            <ItemTemplate>
                <div class="DataCollectionCard" style="position: relative; height: 250px; padding: 10px; text-align: center; border: 1px solid #ccc; border-radius: 10px; background-color: white;">
                    <div>
                       <a href='<%# "ProductPage.aspx?Pid=" + Eval("Pid") %>'>
                         <img src='<%# ResolveUrl("~/Images/") + Eval("Photo") %>' alt='<%# Eval("Pname") %>' style="width: 197px; height: 150px; border-radius: 8px;" />
                       </a>
                    </div>
                    <div>
                        <b><%# Eval("Pname") %></b><br />
                        Buy Now ₹<%# Eval("Price") %><br />
                        Category: <%# Eval("Cat") %><br />
                    </div>
                </div>
            </ItemTemplate>
        </asp:DataList>
        <br />
    </div>
    <br />
    <br />
    <asp:Panel ID="OrderContainer" runat="server" Visible="false">
        <div class="container" style="width: 95%; border-radius: 16px; background-color: whitesmoke">
            <h3 style="font-family: 'Times New Roman', Times, serif">Recommendation for you</h3>
            <asp:DataList ID="DataList2" runat="server" RepeatColumns="5" CellPadding="5" CellSpacing="20">
                <ItemTemplate>
                    <div class="DataCollectionCard" style="position: relative; height: 250px; padding: 10px; text-align: center; border: 1px solid #ccc; border-radius: 10px; background-color: white;">
                        <div>
                       <a href='<%# "ProductPage.aspx?Pid=" + Eval("Pid") %>'>
                         <img src='<%# ResolveUrl("~/Images/") + Eval("Photo") %>' alt='<%# Eval("Pname") %>' style="width: 197px; height: 150px; border-radius: 8px;" />
                       </a>
                    </div>
                        <div>
                            <b><%# Eval("Pname") %></b><br />
                            Buy Now ₹<%# Eval("Price") %><br />
                            Category: <%# Eval("Cat") %><br />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
            <br />
        </div>
        <br />
        <br />
    </asp:Panel>
    
</asp:Content>
