using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Web.UI.DataVisualization.Charting;
using System.Drawing;

namespace cizelge
{
    public partial class Rapor : System.Web.UI.Page
    {
        command cmd = new command();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BtnExcel.Visible = false;
                getPersonel_();
                dateTarihBaslangic.Value = DateTime.Now.ToString("dd-MM-yyyy");
                dateTarihBitis.Value = DateTime.Now.ToString("dd-MM-yyyy");

            }
        }
        #region Degiskenler
        DateTime haftaBaslangic = DateTime.Now;
        DateTime haftaBitis = DateTime.Now;
        #endregion
     
        public DateTime tarihBas;
        public DateTime tarihBit;
        private void setKisiGetir_()
        {
            int sayac = 0;

             tarihBas = DateTime.ParseExact(dateTarihBaslangic.Value, "dd-MM-yyyy", null);
             tarihBit = DateTime.ParseExact(dateTarihBitis.Value, "dd-MM-yyyy", null);


            if ((dateTarihBaslangic.Value != "") && (dateTarihBitis.Value != "") && (ListPersonel.SelectedValue != ""))
            {           
                if (tarihBas < tarihBit)
                {
                    if (ListPersonel.Items.Count > 0)
                    {                                                                  
                        for (int j = 0; j < ListPersonel.Items.Count; j++)
                        {
                            if (ListPersonel.Items[j].Selected == true)
                            {
                                //string sorgu = "SELECT ISN.ID AS [Cizelge Numarasi],P.AD AS [Personel Adi],ISN.YAPILAN_IS AS [Yapilan Is], CONVERT(VARCHAR,ISN.BASLANGIC_SAAT,104) AS [Baslangic Tarihi],CONVERT(CHAR(5),ISN.BASLANGIC_SAAT,108) AS [Baslangic Saati],CONVERT(VARCHAR,ISN.BITIS_SAAT,104) AS [Bitis Tarihi],CONVERT(CHAR(5),ISN.BITIS_SAAT,108) AS [Bitis Saati],ISN.KAYIT_TARIHI AS [Kayit Tarihi], ISN.BASLANGIC_SAAT, ISN.BITIS_SAAT FROM ArizaTakip..CZ_IS ISN INNER JOIN ArizaTakip.dbo.CZ_PERSONEL P ON ISN.PERSONEL_ID=P.ID WHERE  (ISN.BASLANGIC_SAAT BETWEEN CONVERT(DATETIME,'" + tarihBas + "',104) AND CONVERT(DATETIME,'" + tarihBit + "',104)) AND P.ID ='" + ListPersonel.Items[j].Value.ToString() + "' ORDER BY ISN.ID DESC";

                                string sorgu = "SELECT ISN.ID AS [Cizelge Numarasi],P.AD AS [Personel Adi],ISN.YAPILAN_IS AS [Yapilan Is], CONVERT(VARCHAR,ISN.BASLANGIC_SAAT,104) AS [Baslangic Tarihi],CONVERT(CHAR(5),ISN.BASLANGIC_SAAT,108) AS [Baslangic Saati],CONVERT(VARCHAR,ISN.BITIS_SAAT,104) AS [Bitis Tarihi],CONVERT(CHAR(5),ISN.BITIS_SAAT,108) AS [Bitis Saati],ISN.KAYIT_TARIHI AS [Kayit Tarihi], ISN.BASLANGIC_SAAT, ISN.BITIS_SAAT FROM CIZELGE..CZ_IS ISN INNER JOIN CIZELGE.dbo.CZ_PERSONEL P ON ISN.PERSONEL_ID=P.ID WHERE  (ISN.BASLANGIC_SAAT BETWEEN CONVERT(DATETIME,'" + tarihBas + "',104) AND CONVERT(DATETIME,'" + tarihBit + "',104)) AND P.ID ='" + ListPersonel.Items[j].Value.ToString() + "' ORDER BY ISN.ID DESC";

                                DataSet ds = cmd.returnDataSet(sorgu);

                                if (ds != null)
                                {
                                    StringBuilder html = new StringBuilder();

                                    html.Append("<table id='table' class='table  table-bordered table-hover' data-toggle='table'>");
                                    html.Append("<tr color: White;'><th>Çizelge Numarası</th><th>Personel Adı</th><th>Yapılan İş</th><th>Başlangıç Tarihi</th><th>Bitiş Tarihi</th><th>Başlangıç Saati</th><th>Bitiş Saati</th><th>Toplam Çalışılan Saat(HH:MM)</th></tr>");

                                    if (!object.Equals(ds.Tables[0], null))
                                    {
                                        if (ds.Tables[0].Rows.Count > 0)
                                        {
                                            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                                            {
                                                DateTime ilk = DateTime.Parse(ds.Tables[0].Rows[i][8].ToString());
                                                DateTime son = DateTime.Parse(ds.Tables[0].Rows[i][9].ToString());

                                                TimeSpan fark = son.Subtract(ilk);

                                                int sonuc = (Int16.Parse(fark.Days.ToString()) * 24) + Int16.Parse(fark.Hours.ToString());

                                                html.Append("<td>" + ds.Tables[0].Rows[i][0] + "</td>");
                                                html.Append("<td>" + ds.Tables[0].Rows[i][1] + "</td>");
                                                html.Append("<td>" + ds.Tables[0].Rows[i][2] + "</td>");
                                                html.Append("<td>" + ds.Tables[0].Rows[i][3] + "</td>");
                                                html.Append("<td>" + ds.Tables[0].Rows[i][5] + "</td>");
                                                html.Append("<td>" + ds.Tables[0].Rows[i][4] + "</td>");
                                                html.Append("<td>" + ds.Tables[0].Rows[i][6] + "</td>");
                                                html.Append("<td>" + sonuc + ":" + fark.Minutes + "</td>");

                                                html.Append("</tr>");
                                            }
                                            sayac++;
                                        }

                                        else
                                        {
                                            html.Append("<tr>");
                                            html.Append("<td align='center' colspan='8'>Kayıt Yok</td>");
                                            html.Append("</tr>");

                                            if (sayac == 0)
                                            {
                                                BtnExcel.Visible = false;
                                            }

                                            else
                                            {
                                                BtnExcel.Visible = true;
                                            }                                           
                                        }
                                        html.Append("</table>");
                                    }
                                    DBDataPlaceHolder.Controls.Add(new Literal { Text = html.ToString() });
                                }
                            }
                        }
                    }                    
                }

                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "mymodalu()", true);
                    this.LblMessage.Text = "Başlangıç Tarihi , Bitiş Tarihinden Küçük veya Eşit Olamaz!!!";
                    LblMessage.ForeColor = System.Drawing.Color.Red;
                }
            }

            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "mymodalu()", true);
                this.LblMessage.Text = "Boş Alan Bırakmayınız...";
                LblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
        private void excelAktar_()
        {
            DateTime tarihBas = DateTime.ParseExact(dateTarihBaslangic.Value, "dd-MM-yyyy", null);
            DateTime tarihBit = DateTime.ParseExact(dateTarihBitis.Value, "dd-MM-yyyy", null);

            string per_id = "";
            if (ListPersonel.Items.Count > 0)
            {
                for (int k = 0; k < ListPersonel.Items.Count; k++)
                {
                    if (ListPersonel.Items[k].Selected == true)
                    {

                        per_id += ""+ ListPersonel.Items[k].Value.ToString()+",";


                    }
                }

                //string sorgu = "SELECT ISN.ID AS [Cizelge Numarasi],P.AD AS [Personel Adi],ISN.YAPILAN_IS AS [Yapilan Is], CONVERT(DATE,ISN.BASLANGIC_SAAT,104) AS [Baslangic Tarihi],CONVERT(DATE,ISN.BITIS_SAAT,104) AS [Bitis Tarihi],CONVERT(CHAR(5),ISN.BASLANGIC_SAAT,108) AS [Baslangic Saati],CONVERT(CHAR(5),ISN.BITIS_SAAT,108) AS [Bitis Saati],RIGHT('0' + CAST((DATEDIFF(SECOND,ISN.BASLANGIC_SAAT,ISN.BITIS_SAAT) / 3600) AS VARCHAR),2) + ':' + RIGHT('0' + CAST(((DATEDIFF(SECOND,ISN.BASLANGIC_SAAT,ISN.BITIS_SAAT) / 60) % 60) AS VARCHAR),2) AS [Toplam Calisilan Saat] FROM ArizaTakip..CZ_IS ISN LEFT OUTER JOIN ArizaTakip.dbo.CZ_PERSONEL P ON ISN.PERSONEL_ID=P.ID WHERE (ISN.BASLANGIC_SAAT BETWEEN CONVERT(DATETIME,'" + tarihBas + "',104) AND CONVERT(DATETIME,'" + tarihBit + "',104)) AND P.ID IN(" + per_id.Remove(per_id.Length-1) + ") ORDER BY P.AD";

                        string sorgu = "SELECT ISN.ID AS [Cizelge Numarasi],P.AD AS [Personel Adi],ISN.YAPILAN_IS AS [Yapilan Is], CONVERT(DATE,ISN.BASLANGIC_SAAT,104) AS [Baslangic Tarihi],CONVERT(DATE,ISN.BITIS_SAAT,104) AS [Bitis Tarihi],CONVERT(CHAR(5),ISN.BASLANGIC_SAAT,108) AS [Baslangic Saati],CONVERT(CHAR(5),ISN.BITIS_SAAT,108) AS [Bitis Saati],RIGHT('0' + CAST((DATEDIFF(SECOND,ISN.BASLANGIC_SAAT,ISN.BITIS_SAAT) / 3600) AS VARCHAR),2) + ':' + RIGHT('0' + CAST(((DATEDIFF(SECOND,ISN.BASLANGIC_SAAT,ISN.BITIS_SAAT) / 60) % 60) AS VARCHAR),2) AS [Toplam Calisilan Saat] FROM CIZELGE..CZ_IS ISN LEFT OUTER JOIN CIZELGE.dbo.CZ_PERSONEL P ON ISN.PERSONEL_ID=P.ID WHERE (ISN.BASLANGIC_SAAT BETWEEN CONVERT(DATETIME,'" + tarihBas + "',104) AND CONVERT(DATETIME,'" + tarihBit + "',104)) AND P.ID IN(" + per_id.Remove(per_id.Length - 1) + ") ORDER BY P.AD";

                        DataTable dt = cmd.returnDataTable(sorgu);

                        if (dt.Rows.Count > 0)
                        {

                            Response.Clear();
                            Response.ClearHeaders();
                            Response.ClearContent();
                            Response.ContentEncoding = System.Text.Encoding.GetEncoding("windows-1254");
                            Response.Charset = "windows-1254";
                            string filename = "Rapor.xls";
                            System.IO.StringWriter tw = new System.IO.StringWriter();
                            System.Web.UI.HtmlTextWriter hw = new System.Web.UI.HtmlTextWriter(tw);
                            DataGrid dgGrid = new DataGrid();
                            dgGrid.DataSource = dt;
                            dgGrid.DataBind();

                            //Get the HTML for the control.
                            dgGrid.RenderControl(hw);
                            //Write the HTML back to the browser.
                            Response.ContentType = " application/vnd.ms-excel";
                            Response.Output.Write(" <meta http-equiv='Content-Type' content='text/html; charset=windows-1254' />");
                            Response.ContentType = "application/vnd.ms-excel";

                            Response.AppendHeader("Content-Disposition", "attachment; filename=" + filename + "");

                            this.EnableViewState = false;
                            Response.Write(tw.ToString());
                            Response.Flush();
                            Response.End();                  
                }
            }
            setKisiGetir_();
        }
            
        private void getPersonel_()
        {
            //string sorgu = "SELECT ID,AD FROM ArizaTakip.dbo.CZ_PERSONEL";
            string sorgu = "select ID,AD from CIZELGE.dbo.CZ_PERSONEL";

            DataTable dt = cmd.returnDataTable(sorgu);

            ListPersonel.DataTextField = "AD";
            ListPersonel.DataValueField = "ID";

            ListPersonel.DataSource = dt;
            ListPersonel.DataBind();
        }

        protected void BtnGtr_Click(object sender, EventArgs e)
        {
            BtnExcel.Visible = true;
            setKisiGetir_();           
        }

        protected void BtnExcel_Click(object sender, EventArgs e)
        {
            excelAktar_();
        }

        protected void BtnGeri_Click(object sender, EventArgs e)
        {
            Response.Redirect("Cizelge.aspx");
   
        }
    }
}