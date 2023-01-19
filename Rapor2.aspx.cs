using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cizelge
{
    public partial class Rapor2 : System.Web.UI.Page
    {
        command cmd = new command();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dateTarihBaslangic.Value = DateTime.Now.ToString("dd-MM-yyyy");
            }
            
        }

        public DateTime tarihBas;

        protected void setKisiGetir_()
        {
            tarihBas = DateTime.ParseExact(dateTarihBaslangic.Value, "dd-MM-yyyy", null);

            string sorgu = "SELECT ISN.ID AS [Cizelge Numarasi],P.AD AS [Personel Adi], CONVERT(VARCHAR,ISN.BASLANGIC_SAAT,104) AS [Tarih],ISN.YAPILAN_IS AS [Yapilan Is],CONVERT(CHAR(5),ISN.BASLANGIC_SAAT,108) AS [Baslangic Saati],CONVERT(CHAR(5),ISN.BITIS_SAAT,108) AS [Bitis Saati] , CONVERT(VARCHAR,ISN.BITIS_SAAT,104) AS [Bitis Tarihi] FROM CIZELGE..CZ_IS ISN LEFT OUTER JOIN CIZELGE.dbo.CZ_PERSONEL P ON ISN.PERSONEL_ID=P.ID WHERE ISN.TARIH = CONVERT(DATETIME,'" + tarihBas + "',104) ORDER BY P.AD ";

            DataSet ds = cmd.returnDataSet(sorgu);

            if (ds != null)
            {
                StringBuilder html = new StringBuilder();

                html.Append("<table id='table' class='table  table-bordered table-hover' data-toggle='table'>");
                html.Append("<tr color: White;'><th>Çizelge Numarası</th><th>Personel Adı</th><th>Tarih</th><th>Yapılan İş</th><th>Başlangıç Saati</th><th>Bitiş Saati</th><th>Toplam Çalışma Saati(HH:mm)</th></tr>");

                if (!object.Equals(ds.Tables[0], null))
                {
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                        {
                            DateTime ilk = DateTime.Parse(ds.Tables[0].Rows[i][4].ToString());
                            DateTime son = DateTime.Parse(ds.Tables[0].Rows[i][5].ToString());

                            TimeSpan fark = son.Subtract(ilk);

                            int sonuc = (Int16.Parse(fark.Days.ToString()) * 24) + Int16.Parse(fark.Hours.ToString());

                            html.Append("<td>" + ds.Tables[0].Rows[i][0] + "</td>");
                            html.Append("<td>" + ds.Tables[0].Rows[i][1] + "</td>");
                            html.Append("<td>" + ds.Tables[0].Rows[i][2] + "</td>");
                            html.Append("<td>" + ds.Tables[0].Rows[i][3] + "</td>");
                            html.Append("<td>" + ds.Tables[0].Rows[i][4] + "</td>");
                            html.Append("<td>" + ds.Tables[0].Rows[i][5] + "</td>");
                            //html.Append("<td>" + ds.Tables[0].Rows[i][6] + "</td>");
                            html.Append("<td>" + sonuc + ":" + fark.Minutes + "</td>");

                            html.Append("</tr>");
                        }
                    }

                    else
                    {
                        html.Append("<tr>");
                        html.Append("<td align='center' colspan='8'>Kayıt Yok</td>");
                        html.Append("</tr>");


                    }
                    html.Append("</table>");
                }
                DBDataPlaceHolder.Controls.Add(new Literal { Text = html.ToString() });
            }
        }
                                

        protected void BtnKayitGetir_Click(object sender, EventArgs e)
        {
            setKisiGetir_();
        }
    }
}