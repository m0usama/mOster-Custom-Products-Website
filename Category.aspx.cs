using mOster_GUI.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace mOster_GUI
{
    public partial class Category : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                myDAL obj = new myDAL();
                DataTable DT = new DataTable();
                string type = Session["product_type"].ToString();
                DT = obj.product_detail_by_type(type);
                if (DT != null)
                {
                    Product_home.DataSource = DT;
                    Product_home.DataBind();

                }
            }
        }

        public void For_CID(string str)
        {
            Session["customer_id"] = str;
        }

        public void page_fill_data(string x)
        {
            Session["product_type"] = x;
        }

        protected void Product_main_SelectedIndexChanged(object sender, EventArgs e)
        {
            var hf = HF5.Value;
            Product Prod = new Product();
            Prod.page_fill_data(hf);
            Response.Redirect("./Product.aspx");
        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            string str = TextBox1.Text;
            Search Srch = new Search();
            Srch.Searched_products(str);
            Response.Redirect("./Search.aspx");
        }

        protected void Menbtn_Click(object sender, EventArgs e)
        {
            var hf = "Men";
            Category Cat = new Category();
            Cat.page_fill_data(hf);
            Response.Redirect("./Category.aspx");
        }

        protected void Womenbtn_Click(object sender, EventArgs e)
        {
            var hf = "Women";
            Category Cat = new Category();
            Cat.page_fill_data(hf);
            Response.Redirect("./Category.aspx");
        }

        protected void Kidsbtn_Click(object sender, EventArgs e)
        {
            var hf = "Kids";
            Category Cat = new Category();
            Cat.page_fill_data(hf);
            Response.Redirect("./Category.aspx");
        }

        protected void YourArtbtn_Click(object sender, EventArgs e)
        {
            var hf = "Your";
            artPage Cat = new artPage();
            Cat.page_fill_data(hf);
            Response.Redirect("./artPage.aspx");
        }

        protected void MoreArtbtn_Click(object sender, EventArgs e)
        {
            var hf = "All";
            artPage Cat = new artPage();
            Cat.page_fill_data(hf);
            Response.Redirect("./artPage.aspx");
        }
    }
}