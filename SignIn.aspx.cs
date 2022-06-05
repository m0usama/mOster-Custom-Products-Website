using mOster_GUI.DAL;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace mOster_GUI
{
    public partial class SignIn : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button_Click(object sender, EventArgs e)
        {
            string us = TextBox1.Text;
            string Pass = TextBox2.Text;
            myDAL obj = new myDAL();
            int flag1 = 0;
            if (us == "")
            {
                Response.Write("<script>alert('Username not entered.');</script>");
                flag1 = 1;
            }
            if (Pass == "")
            {
                Response.Write("<script>alert('Password not entered.');</script>");
                flag1 = 1;
            }

            if (flag1 == 0)
            {
                if (obj.loginCheck(us, Pass) == 1)
                {
                    mOhome id1 = new mOhome();
                    id1.For_CID(us);

                    Product id2 = new Product();
                    id2.For_CID(us);

                    Cart id3 = new Cart();
                    id3.For_CID(us);

                    artPage id4 = new artPage();
                    id4.For_CID(us);

                    uploadart id5 = new uploadart();
                    id5.For_CID(us);

                    Response.Redirect("mOhome.aspx");

                }
                else
                    Response.Write("<script>alert('Wrong Credentials');</script>");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string us = TextBox1.Text;
            string Pass = TextBox2.Text;
            myDAL obj = new myDAL();
            int flag1 = 0;
            if (us == "")
            {
                Response.Write("<script>alert('Username not entered.');</script>");
                flag1 = 1;
            }
            if (Pass == "")
            {
                Response.Write("<script>alert('Password not entered.');</script>");
                flag1 = 1;
            }

            if (flag1 == 0)
            {
                if (obj.adminCheck(us, Pass) == 1)
                {

                   
                    Response.Redirect("adminpage.aspx");

                }
                else
                    Response.Write("<script>alert('Wrong Credentials');</script>");
            }
        }
    }
}