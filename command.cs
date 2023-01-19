using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace cizelge
{
    public class command
    {

        //public static SqlConnection con = new SqlConnection(@"Data Source=10.0.0.13;Initial Catalog=ArizaTakip;User Id = sa;Password = q1w2e3R+:;");
        public static SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-31J9H4S\KE2012ENT;Integrated Security=true;Initial Catalog=CIZELGE");

        public void connection()
        {        
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
        }

        public DataSet returnDataSet(string sql)
        {
            DataSet ds = new DataSet();
            ds.DataSetName = "LISTE";
            SqlCommand komut = new SqlCommand(sql,con);
            SqlDataAdapter adap = new SqlDataAdapter(sql,con);
            adap.Fill(ds);

            return ds;
        }

        public DataTable returnDataTable(string sql)
        {
            DataTable dt = new DataTable();
            dt.TableName = "LISTE";
            SqlCommand komut = new SqlCommand(sql, con);
            SqlDataAdapter adap = new SqlDataAdapter(sql, con);
            adap.Fill(dt);

            return dt;
        }

        public bool returnKomut(string sql)
        {
            bool result = true;
            SqlCommand komut = new SqlCommand(sql,con);
            connection();
            try
            {
                komut.ExecuteNonQuery();
            }
            catch (Exception)
            {
                result=false;
            }
            
            return result;
        }
    }
}