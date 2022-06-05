using mOster_GUI.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace mOster_GUI
{
    public partial class uploadart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button_Click(object sender, EventArgs e)
        {
            string imag = img.Text;
            string aname = TextBox1.Text;
            string cid="";
           
                cid = Session["customer_id"].ToString();
            
           

            myDAL obj = new myDAL();
            int flag1 = 0;
            if (imag == "")
            {
                Response.Write("<script>alert('Image not entered.');</script>");
                flag1 = 1;
            }
            if (aname == "")
            {
                Response.Write("<script>alert('Art Name not entered.');</script>");
                flag1 = 1;
            }
            if (cid == "")
            {
                Response.Write("<script>alert('You are not SignIned.');</script>");
                flag1 = 1;
            }

            if (flag1 == 0)
            {
                if (obj.art_name_check(aname) == 0)
                {
                    obj.add_arts(imag, aname, cid);

                    Response.Write("<script>alert('Art Added');</script>");
                    Response.Redirect("./mOhome.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Art name already used!');</script>");
                }
            }
        }

        public void For_CID(string str)
        {
            Session["customer_id"] = str;
        }
    }
}