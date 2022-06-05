<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="mOster_GUI.Cart" %>


<!DOCTYPE html>
<html lang="zxx">
<head>
	<title>mOster | Cart</title>
	<meta charset="UTF-8">
	<meta name="description" content="mOster | Cart">
	<meta name="keywords" content="mOster, eCommerce, creative, aspx">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- Favicon -->
	<link href="img/mOster_logo.png" rel="shortcut icon"/>

	<!-- Google Font -->
	<link href="https://fonts.googleapis.com/css?family=Josefin+Sans:300,300i,400,400i,700,700i" rel="stylesheet">


	<!-- Stylesheets -->
	<link rel="stylesheet" href="css/bootstrap.min.css"/>
	<link rel="stylesheet" href="css/font-awesome.min.css"/>
	<link rel="stylesheet" href="css/flaticon.css"/>
	<link rel="stylesheet" href="css/slicknav.min.css"/>
	<link rel="stylesheet" href="css/jquery-ui.min.css"/>
	<link rel="stylesheet" href="css/owl.carousel.min.css"/>
	<link rel="stylesheet" href="css/animate.css"/>
	<link rel="stylesheet" href="css/style1.css">


	<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->

	<script>
        function remove_id(clicked_id) {
			
            var temp = document.getElementById("HF4");
			temp.value = clicked_id;

        }
    </script>

	<style>	

		.cart-table .quy-col {
		padding-right: 50px;
	}

	.cart-table .rmv-col {
		padding-left: 40px;
	}
		
	</style>

</head>
<body>
	<form runat="server">
		 <asp:HiddenField ID="HF4" Value="" runat="server" />
	
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header section -->
	<header class="header-section">
		<div class="header-top">
			<div class="container">
				<div class="row">
					<div class="col-lg-2 text-center text-lg-left">
						<!-- logo -->
						<a href="mOhome.aspx" class="site-logo">
							<img src="img/mOster_logo_hard.png" alt="">
						</a>
					</div>
					<div class="col-xl-6 col-lg-5">
						<form class="header-search-form">
							<asp:TextBox ID="TextBox2" runat="server" CssClass="searchbox"  name="promo" placeholder="Search on mOster..."></asp:TextBox>

							<asp:Button ID="SearchButton" runat="server" class="search-btn" Text="SEARCH" OnClick="SearchButton_Click" />
						</form>
					</div>
					<div class="col-xl-4 col-lg-5">
						<div class="user-panel">
							<div class="up-item">
								<i class="flaticon-profile"></i>
								<a href="SignIn.aspx">Sign In</a> or <a href="CreateAccount">Create Account</a>
							</div>
							<div class="up-item">
								<div class="shopping-card">
									<i class="flaticon-bag"></i>
									
								</div>
								<a href="Cart.aspx">Shopping Cart</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<nav class="main-navbar">
			<div class="container">
				<!-- menu -->
				<ul class="main-menu">
					<li><a href="mOhome.aspx">Home</a></li>
					<li><asp:LinkButton ID="Menbtn" runat="server" OnClick="Menbtn_Click" >Men</asp:LinkButton></li>

						<li><asp:LinkButton ID="Womenbtn" runat="server" OnClick="Womenbtn_Click" >Women</asp:LinkButton></li>

							<li><asp:LinkButton ID="Kidsbtn" runat="server" OnClick="Kidsbtn_Click" >Kids</asp:LinkButton></li>

						<li><asp:LinkButton ID="YourArtbtn" runat="server" OnClick="YourArtbtn_Click" >Your Art</asp:LinkButton></li>

						<li><asp:LinkButton ID="MoreArtbtn"  runat="server" OnClick="MoreArtbtn_Click" ><span class="new">New</span> More Arts</asp:LinkButton></li>
					<li><a href="uploadart.aspx">Upload Art</a></li>
					
				</ul>
			</div>
		</nav>
	</header>
	<!-- Header section end -->

	
 	<!-- Page info -->
	<div class="page-top-info">
		<div class="container">
			<h4>Your cart</h4>
			<div class="site-pagination">
				<a href="">Home</a> /
				<a href="">Your cart</a>
			</div>
		</div>
	</div>
	<!-- Page info end -->

	
	<!-- cart section start -->
	<section class="cart-section spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="cart-table">
						<h3>Your Cart</h3>
						<div class="cart-table-warp">
							<table>
							<thead>
								<tr>
									<th class="product-th">Product</th>
									
									
								</tr>
							</thead>
							<tbody>
								
								<asp:DataList ID="Shop_Cart" runat="server" RepeatColumns="1" RepeatDirection="horizontal">
                                 <ItemTemplate>

								<tr>
									<td class="product-col">
										<img src=<%#Eval("image_url") %> alt="">
										<div class="pc-title">
											<h4><%#Eval("product_name") %></h4>
											<p><%#Eval("Price") %> Rs.</p>
										</div>
									</td>
									<td class="quy-col">
										<div class="quantity">
					                      
												<h4>Qt:<%#Eval("Quantity") %></h4>
												

												<td class="rmv-col">
												
											<div ID="<%#Eval("product_id") %>" onclick="remove_id(this.id)">
											<asp:LinkButton ID="RemoveButton" class="site-btn" runat="server" onclick="RemoveButton_Click">REMOVE</asp:LinkButton>
											</div>
									</td>

											</div>
										
                    					</div>
									</td>

									<td class="total-col">

										<td class="product-col">
										<img src=<%#Eval("art_image_url") %> alt="">
										<div class="pc-title">
											<h4><%#Eval("art_name") %></h4>
										</div>
									</td>

									</td>
								</tr>
								</ItemTemplate>
                                 </asp:DataList>
								
							</tbody>
						</table>
						</div>
						<asp:DataList ID="Total" runat="server" RepeatColumns="1" RepeatDirection="horizontal">
                                 <ItemTemplate>

						<div class="total-cost">
							<h6>Total <span><%#Eval("total") %> Rs.</span></h6>
						</div>
                        </ItemTemplate>
                                 </asp:DataList>
					</div>
				</div>
				<div class="col-lg-4 card-right">
					<form class="promo-code-form">
						
					    
					</form>
					
					<%--<asp:Button ID="checkoutbtn" runat="server" class="site-btn" Text="Proceed to checkout"  OnClick="checkoutbtn_Click"/>--%>
					<asp:LinkButton ID="Checkoutbtn" runat="server" class="site-btn" OnClick="checkoutbtn_Click" >Proceed to checkout</asp:LinkButton>
					<a href="mOhome.aspx" class="site-btn sb-dark">Continue shopping</a>
				</div>
			</div>
		</div>
	</section>
	<!-- cart section end -->
		

	<!-- Footer section -->
	<section class="footer-section">
		<div class="container">
			<div class="footer-logo text-center">
				<a href="mOhome.aspx"><img src="./img/mOster_logo_light_small.png" alt=""></a>
			</div>
			<div class="row">
				<div class="col-lg-3 col-sm-6">
					<div class="footer-widget about-widget">
						<h2>About</h2>
						<p>Create what you love, and connect with people who love it, too. From Boston to Bangkok, millions of visitors come to Redbubble looking for their weirdly meaningful thing.</p>
						<img src="img/cards.png" alt="">
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="footer-widget about-widget">
						<h2>Questions</h2>
						<ul>
							<li><a href="">About Us</a></li>
							<li><a href="">Track Orders</a></li>
							<li><a href="">Returns</a></li>
							<li><a href="">Jobs</a></li>
							<li><a href="">Shipping</a></li>
							<li><a href="">Blog</a></li>
						</ul>
						<ul>
							<li><a href="">Partners</a></li>
							<li><a href="">Bloggers</a></li>
							<li><a href="">Support</a></li>
							<li><a href="">Terms of Use</a></li>
							<li><a href="">Press</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="footer-widget about-widget">
						<h2>Questions</h2>
						<div class="fw-latest-post-widget">
							<div class="lp-item">
								<div class="lp-thumb set-bg" data-setbg="img/blog-thumbs/3.jpg"></div>
								<div class="lp-content">
									<h6>what shoes to wear</h6>
									<span>Oct 21, 2018</span>
									<a href="#" class="readmore">Read More</a>
								</div>
							</div>
							<div class="lp-item">
								<div class="lp-thumb set-bg" data-setbg="img/blog-thumbs/3.jpg"></div>
								<div class="lp-content">
									<h6>trends this year</h6>
									<span>Oct 21, 2018</span>
									<a href="#" class="readmore">Read More</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="footer-widget contact-widget">
						<h2>Questions</h2>
						<div class="con-info">
							<span>C.</span>
							<p>mOster Ltd </p>
						</div>
						<div class="con-info">
							<span>B.</span>
							<p>Fast-NU,Faisal Town,Lahore</p>
						</div>
						<div class="con-info">
							<span>T.</span>
							<p>+92 123 4567890</p>
						</div>
						<div class="con-info">
							<span>E.</span>
							<p>mOster@mOster.com</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="social-links-warp">
			<div class="container">
				<div class="social-links">
					<a href="" class="instagram"><i class="fa fa-instagram"></i><span>instagram</span></a>
					<a href="" class="google-plus"><i class="fa fa-google-plus"></i><span>g+plus</span></a>
					<a href="" class="pinterest"><i class="fa fa-pinterest"></i><span>pinterest</span></a>
					<a href="" class="facebook"><i class="fa fa-facebook"></i><span>facebook</span></a>
					<a href="" class="twitter"><i class="fa fa-twitter"></i><span>twitter</span></a>
					<a href="" class="youtube"><i class="fa fa-youtube"></i><span>youtube</span></a>
					<a href="" class="tumblr"><i class="fa fa-tumblr-square"></i><span>tumblr</span></a>
				</div>

<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --> 
<p class="text-white text-center mt-5">Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a></p>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->

			</div>
		</div>
	</section>
	<!-- Footer section end -->



	<!--====== Javascripts & Jquery ======-->
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.slicknav.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.nicescroll.min.js"></script>
	<script src="js/jquery.zoom.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<script src="js/main.js"></script>
	</form>
	</body>
</html>