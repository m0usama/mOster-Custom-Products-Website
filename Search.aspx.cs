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
    public partial class Search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string str = Session["SearchString"].ToString();
                myDAL obj = new myDAL();
                DataTable DT = new DataTable();
                DT = obj.Search_func(str);
                if (DT != null)
                {
                    Search_home.DataSource = DT;
                    Search_home.DataBind();

                }
            }

        }

        protected void Product_main_SelectedIndexChanged(object sender, EventArgs e)
        {
            var hf = HF3.Value;
            Product Prod = new Product();
            Prod.page_fill_data(hf);
            Response.Redirect("./Product.aspx");
        }

        public void Searched_products(string str)
        {
            Session["SearchString"] = str;
        }

        public void For_CID(string str)
        {
            Session["customer_id"] = str;
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