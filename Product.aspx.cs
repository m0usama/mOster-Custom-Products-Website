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
    public partial class Product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                myDAL obj = new myDAL();
                DataTable DT = new DataTable();
                string id = Session["product_id"].ToString();
                int nid = int.Parse(id);
                DT = obj.product_detail_by_pid(nid);
                if (DT != null)
                {
                    Product_Details.DataSource = DT;
                    Product_Details.DataBind();
                    
                }
            }
        }

        public void For_CID(string str)
        {
            Session["customer_id"] = str;
        }


        //function
        public void page_fill_data(string x)
        {
            Session["product_id"] = x;
        }

        protected void ProductPage_SelectedIndexChanged(object sender, EventArgs e)
        {
            string hf = HF2.Value;
            int pid = int.Parse(hf);
            string cid = Session["customer_id"].ToString();
            string aname = Arttextbox.Text;
            myDAL obj = new myDAL();
            if (aname != "")
            {
                if (obj.cart_check(cid, pid, aname) == 0)
                {
                    obj.add_product_to_cart(pid, cid, aname, 1);
                    Response.Write("<script>alert('Product Added');</script>");
                }
                else
                {
                    Response.Write("<script>alert('Product with this ART is already in cart');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Art Name not Entered');</script>");
            }
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