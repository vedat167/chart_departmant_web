using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace cizelge
{
    public partial class Login : System.Web.UI.Page
    {
        command cmd = new command();
        protected void Page_Load(object sender, EventArgs e)
        {
            TxtAd.Focus();
        }
        private void giris()
        {
            try
            {
                //string sorgu = "SELECT * FROM ArizaTakip.dbo.CZ_PERSONEL WHERE AD='" + TxtAd.Text + "'  AND SIFRE = '" + TxtSifre.Text + "'";
                string sorgu = "SELECT * FROM CIZELGE.dbo.CZ_PERSONEL WHERE AD='" + TxtAd.Text + "'  AND SIFRE = '" + TxtSifre.Text + "'";
                DataTable dt = cmd.returnDataTable(sorgu);

                    //Alanlar boş değilse
                if ((TxtAd.Text != "") && (TxtSifre.Text != ""))
                {
                    //tablo boş değilse
                    if (dt.Rows.Count > 0)
                    {
                        int yonetici;
                        yonetici = Int16.Parse(dt.Rows[0][3].ToString());

                        Session.Add("ID", dt.Rows[0][0]);
                        Session.Add("YONETICI", yonetici.ToString());

                        Response.Redirect("Cizelge.aspx");
                    }

                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "mymodalu();", true);
                        this.LblMesaj.Text = "Kullanıcı Adı veya Şifre Hatalı!!!";
                        LblMesaj.ForeColor = System.Drawing.Color.Red;
                    }
                }
                //Alan boş ise
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "mymodalu();", true);
                    this.LblMesaj.Text = "Lütfen Boş Alan Bırakmayınız...";
                    LblMesaj.ForeColor = System.Drawing.Color.Red;
                }
            }
            catch (Exception)
            {

            }                    
        }
        protected void btnGiris_Click(object sender, EventArgs e)
        {
            giris();
        }
    }
}