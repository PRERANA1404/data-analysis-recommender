<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="ProductPage.aspx.cs" Inherits="data_Analysis_ad_Recommender_System.ProductPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #bigPhotoContainer img {
            width: 100%; /* Adjust to container width */
            height: 500px; /* Set a consistent height */
            object-fit: contain; /* Ensure the image scales properly */
            border-radius: 10px;
            border: none;
        }

        .reference-photo {
            width: 100px;
            height: 100px;
            cursor: pointer;
            border-radius: 5px;
            border:2px solid #ccc;
        }

            .reference-photo:hover {
                border-color: #007bff;
                box-shadow: 0 4px 8px rgba(0, 123, 255, 0.2);
            }
    </style>
    <script>
        // Ensure big photo is displayed consistently on click
        document.addEventListener("DOMContentLoaded", function () {
            const bigPhoto = document.getElementById("bigPhoto");
            const referencePhotos = document.querySelectorAll(".reference-photo");

            referencePhotos.forEach(photo => {
                photo.addEventListener("click", () => {
                    // Update the big photo's src with the clicked reference photo's src
                    bigPhoto.src = photo.src;

                    // Ensure the object-fit property applies to all images
                    bigPhoto.style.objectFit = "contain";
                });
            });
        });

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid" style="background-color: whitesmoke">
        <br />
        <div class="container-fluid" style="width:100%">
            <div class="row" style="width:100%">
                <div class="col-lg-6" style="width:50%">
                    <asp:DataList ID="DataList1" runat="server">
                        <ItemTemplate>
                                <!-- Big Product Photo -->
                                <div id="bigPhotoContainer" style="text-align: left;margin-left:80px; margin-bottom: 20px;">
                                    <img id="bigPhoto" src='<%# ResolveUrl("~/Images/") + Eval("Photo1") %>' alt="Big Product Photo"
                                        style="width: 100%; height: 500px; object-fit: contain; border-radius: 10px; border: 0.5px outset black;">
                                </div>

                                <!-- Reference Photos -->
                                <div id="referenceImages" style="text-align: left; margin-left: 180px; margin-bottom: 20px;">
                                    <img src='<%# ResolveUrl("~/Images/") + Eval("Photo1") %>' alt="Reference 1"
                                        class="reference-photo">
                                    <img src='<%# ResolveUrl("~/Images/") + Eval("Photo2") %>' alt="Reference 2"
                                        class="reference-photo">
                                    <img src='<%# ResolveUrl("~/Images/") + Eval("Photo3") %>' alt="Reference 3"
                                        class="reference-photo">
                                </div>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
                <div class="col-lg-6" style="width:50%">
                    <br />
                    <div class="container-fluid" style="width:100%">
                        <h3 style="text-align:left; font-family: 'Times New Roman';font-size:50px">Product Detail</h3>
                        <br />
                        <asp:DataList ID="DataList2" runat="server">
                            <ItemTemplate>
                                <div>
                                    <p style="text-align:left; font-family: 'Times New Roman';font-size:30px"><b><%# Eval("Pname") %></b></p>
                                    <br />
                                    <p style="text-align:left; font-family: 'Times New Roman';font-size:30px"><b>Brand :</b><%# Eval("Brand") %></p>
                                    <br />
                                    <p style="text-align:left; font-family: 'Times New Roman';font-size:30px"><b>Category :</b> <%# Eval("Cat") %></p>
                                    <br />
                                    <p style="text-align:left; font-family: 'Times New Roman';font-size:30px"><b>Sub-Category :</b> <%# Eval("Subcat") %></p>
                                    <br />
                                    <p style="text-align:left; font-family: 'Times New Roman';font-size:30px"><b>Price :</b> ₹<%# Eval("Price") %></p>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>