<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="mOster_GUI.Product" %>

<!DOCTYPE html>
<html lang="zxx">
<head>
	<title>mOster | Product</title>
	<meta charset="UTF-8">
	<meta name="description" content="mOster | Product">
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
        function getid_myfunc(clicked_id) {

            var temp = document.getElementById("HF2");
            temp.value = clicked_id;
        }
    </script>

	<style>
	
		

	</style>

</head>
<body>
	<form runat="server">
		 <asp:HiddenField ID="HF2" Value="" runat="server" />
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
							<asp:TextBox ID="TextBox1" runat="server" CssClass="searchbox"  name="promo" placeholder="Search on mOster..."></asp:TextBox>
							
						
							<asp:Button ID="SearchButton" runat="server" class="search-btn" Text="SEARCH" OnClick="SearchButton_Click" />

							
				
								
				<asp:TextBox ID="Arttextbox" runat="server" class="searchbox" name="promo" placeholder="Enter Art Name for Your Product Here"></asp:TextBox>
                           
                
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


	


	<!-- product section -->
	<section class="product-section">
		<div class="container">
			
			<div class="row">
				
				
                <asp:DataList ID="Product_Details" runat="server" RepeatColumns="1" RepeatDirection="horizontal" OnSelectedIndexChanged="ProductPage_SelectedIndexChanged">
                <ItemTemplate>

				<div class="col-lg-4">
					<div class="product-pic-zoom">
						<img class="product-big-img" src="<%#Eval("image_url") %>" alt="" height="505"  width="359">
					</div>
					
				</div>



                    <div class="col-lg-15 product-details">
                        <h2 class="p-title"><%#Eval("product_name") %></h2>
                        <h3 class="p-price"><%#Eval("Price") %> Rs.</h3>
                        <h4 class="p-stock">Available: <span>In Stock : <%#Eval("stock") %></span></h4>
						<p>Quantity</p>
						<div class="col-lg-5 ">
                           
                        </div>
                        
							<div class="col-lg-5 ">
								

								
                        
								<div id="<%#Eval("product_id") %>" onclick="getid_myfunc(this.id)">
						<asp:LinkButton ID="LinkButton1"  class="site-btn" runat="server"  onclick="ProductPage_SelectedIndexChanged">ADD TO CART</asp:LinkButton>
							</div>
							
							</div>
							
						

                        <div id="accordion" class="accordion-area">
                            <div class="panel">
                                <div class="panel-header" id="headingOne">
                                    <button class="panel-link active" data-toggle="collapse" data-target="#collapse1" aria-expanded="true" aria-controls="collapse1">information</button>
                                </div>
                                <div id="collapse1" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
                                    <div class="panel-body">
                                        <p><%#Eval("description") %></p>
                                        
                                    </div>
                                </div>
                            </div>
                            <div class="panel">
                                <div class="panel-header" id="headingTwo">
                                    <button class="panel-link" data-toggle="collapse" data-target="#collapse2" aria-expanded="false" aria-controls="collapse2">care details </button>
                                </div>
                                <div id="collapse2" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
                                    <div class="panel-body">
                                        <img src="./img/cards.png" alt="">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pharetra tempor so dales. Phasellus sagittis auctor gravida. Integer bibendum sodales arcu id te mpus. Ut consectetur lacus leo, non scelerisque nulla euismod nec.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="panel">
                                <div class="panel-header" id="headingThree">
                                    <button class="panel-link" data-toggle="collapse" data-target="#collapse3" aria-expanded="false" aria-controls="collapse3">shipping & Returns</button>
                                </div>
                                <div id="collapse3" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
                                    <div class="panel-body">
                                        <h4>7 Days Returns</h4>
                                        <p>Cash on Delivery Available<br>
                                            Home Delivery <span>3 - 4 days</span></p>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pharetra tempor so dales. Phasellus sagittis auctor gravida. Integer bibendum sodales arcu id te mpus. Ut consectetur lacus leo, non scelerisque nulla euismod nec.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="social-sharing">
                            <a href=""><i class="fa fa-google-plus"></i></a>
                            <a href=""><i class="fa fa-pinterest"></i></a>
                            <a href=""><i class="fa fa-facebook"></i></a>
                            <a href=""><i class="fa fa-twitter"></i></a>
                            <a href=""><i class="fa fa-youtube"></i></a>
                        </div>
                    </div>
					</ItemTemplate>
                             </asp:DataList>
                     
			</div>
					

		</div>
	</section>
	<!-- product section end -->

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