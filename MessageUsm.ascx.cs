using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cizelge
{
    public partial class MessageUsm : System.Web.UI.UserControl
    {
        public event EventHandler User_Btn_Update;

        protected void btnClick_Click(object sender, EventArgs e)
        {
            User_Btn_Update(sender, e);
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}