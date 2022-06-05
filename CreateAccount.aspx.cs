using mOster_GUI.DAL;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace mOster_GUI
{
    public partial class CreateAccount : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void Button_Click(object sender, EventArgs e)
        {
            string cid = TextBox1.Text;
            string fname = TextBox2.Text;
            string lname = TextBox3.Text;
            string Address = TextBox4.Text;
            string Phone = TextBox5.Text;
            string email = TextBox6.Text;
            string Pass = TextBox7.Text;
            myDAL obj = new myDAL();
            int flag1 = 0;
            if(cid == "")
            {
                Response.Write("<script>alert('User name not entered.');</script>");
                flag1 = 1;
            }
            if (fname == "")
            {
                Response.Write("<script>alert('First name not entered.');</script>");
                flag1 =1;
            }
            if (lname == "")
            {
                Response.Write("<script>alert('Last name not entered.');</script>");
                flag1 = 1;
            }
            if (Address == "")
            {
                Response.Write("<script>alert('Address name not entered.');</script>");
                flag1 = 1;
            }
            if (Phone == "")
            {
                Response.Write("<script>alert('Phone Number not entered.');</script>");
                flag1 = 1;
            }
            if (email == "")
            {
                Response.Write("<script>alert('E-mail not entered.');</script>");
                flag1 = 1;
            }
            if (Pass == "")
            {
                Response.Write("<script>alert('Password not entered.');</script>");
                flag1 = 1;
            }
           
            if (flag1 == 0)
            {
                if (obj.checkUsername(cid) == 0 && obj.checkemail(email) == 0)
                {    
                    obj.Insert(cid, fname, lname, email, Address, Phone, Pass);
                    Response.Write("<script>alert('Account Created Successfully.');</script>");
                    //Thread.Sleep(5000);
                    Response.Redirect("SignIn.aspx");
                  
                }
                else if (obj.checkemail(email) == 1)
                    Response.Write("<script>alert('This Email Already exists');</script>");
                else if (obj.checkUsername(cid) == 1)
                    Response.Write("<script>alert('User Name Already exists');</script>");
            }
        }


        
    }
}