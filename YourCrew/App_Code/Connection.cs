using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for Connection
/// </summary>
/// 
namespace yourcrews
{
    public class Connection:ErrorHandling
    {
        static SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["Conn"].ToString());

        public static void Open_Connection(SqlConnection con)
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
        }
        public static void Close_Connection(SqlConnection con)
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }
        public static void Dispose_Connection(SqlConnection con)
        {
            if (con.State == ConnectionState.Open)
                con.Dispose();
        }

        //public Array getCategory()
        //{
        //    Open_Connection(con);
        //    SqlCommand cmd = new SqlCommand("GetCategory",con);
        //    cmd.CommandType = CommandType.StoredProcedure;
        //    SqlDataReader reader;
        //    reader= cmd.ExecuteReader();
        //    cmd.ExecuteNonQuery();
        //    SqlDataAdapter ad = new SqlDataAdapter(cmd);
        //    DataTable dt = new DataTable();
        //    ad.Fill(dt);
        //    Array ar;
        //    ListBox lb = new ListBox();
        //    ListItem li = new ListItem();
        //    DataColumn rw = dt.Columns[0];
        //    foreach(DataRow w in dt.Rows)
        //    {
        //         = w[0].ToString();
        //    }
        //    return (Array)dt.Columns[0].ToString();
        //}
    }
}