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
    public partial class adminpage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button_Click(object sender, EventArgs e)
        {
            string imag = img.Text;
            string T1 = TextBox1.Text;
            string pname = TextBox2.Text;
            string type = TextBox3.Text;
            string T4 = TextBox4.Text;
            string desc = TextBox5.Text;
            string T6 = TextBox6.Text;
            myDAL obj = new myDAL();
            int flag1 = 0;
            if (imag == "")
            {
                Response.Write("<script>alert('Image not entered.');</script>");
                flag1 = 1;
            }
            if (T1 == "")
            {
                Response.Write("<script>alert('Product Id not entered.');</script>");
                flag1 = 1;
            }
            if (pname == "")
            {
                Response.Write("<script>alert('Product Name not entered');</script>");
                flag1 = 1;
            }
            if (type == "")
            {
                Response.Write("<script>alert('Product type not entered');</script>");
                flag1 = 1;
            }
            if (T4 == "")
            {
                Response.Write("<script>alert('Stock not entered');</script>");
                flag1 = 1;
            }
            if (desc == "")
            {
                Response.Write("<script>alert('Description not entered');</script>");
                flag1 = 1;
            }
            if (T6 == "")
            {
                Response.Write("<script>alert('Price not entered');</script>");
                flag1 = 1;
            }

            if (flag1 == 0)
            {
                int pid = int.Parse(T1);
                int stock = int.Parse(T4);
                int price = int.Parse(T6);
                if (obj.pid_check(pid) == 0)
                {
                    obj.add_product_admin(pid, pname, type, imag, desc, stock, price);

                    Response.Write("<script>alert('Product Added');</script>");

                }
                else
                {
                    Response.Write("<script>alert('PID already used!');</script>");
                }
            }

           
        }

        

    }
}