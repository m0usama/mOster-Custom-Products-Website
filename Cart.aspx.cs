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
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                myDAL obj = new myDAL();
                DataTable DT = new DataTable();
                DataTable DT2 = new DataTable();
                string cid = Session["customer_id"].ToString();
                DT = obj.Cart_Product(cid);
                DT2 = obj.Cart_total(cid);
                if (DT != null)
                {
                    Shop_Cart.DataSource = DT;
                    Shop_Cart.DataBind();
                    Total.DataSource = DT2;
                    Total.DataBind();

                }
            }
        }

        public void For_CID(string str)
        {
            Session["customer_id"] = str;
        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            string str = TextBox2.Text;
            Search Srch = new Search();
            Srch.Searched_products(str);
            Response.Redirect("./Search.aspx");
        }


        protected void RemoveButton_Click(object sender, EventArgs e)
        {
            
            string hf = HF4.Value;
            int pid = int.Parse(hf);
            myDAL obj = new myDAL();
            obj.Remove_item(pid, Session["customer_id"].ToString());
            Response.Redirect("./Cart.aspx");
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

        protected void checkoutbtn_Click(object sender, EventArgs e)
        {
            string cid = Session["customer_id"].ToString();
            myDAL obj = new myDAL();
            obj.Checkout(cid);
            Response.Write("<script>alert('Checkout Successful! Your pakkage is on your way');</script>");

        }
    }
}