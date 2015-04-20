using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using yourcrews;
using System.Configuration;
/// <summary>
/// Summary description for LoadControl
/// </summary>
public class LoadControl
{
    DataTable dt;
    SqlCommand cmd;
    SqlDataAdapter da;
    ErrorHandling erH = new ErrorHandling();
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CrewsdbConnectionString"].ToString());
    public DataTable LoadCetegory()
    {
        Connection.Open_Connection(con);
        cmd = new SqlCommand("GetCategory", con);
        cmd.CommandType = CommandType.StoredProcedure;

        try
        {
            da = new SqlDataAdapter(cmd);
            dt = new DataTable();
            da.Fill(dt);
            con.Close();
           
        }
        catch (Exception ex)
        {
            erH.ShowError(ex);
        }
        Connection.Close_Connection(con);
        return dt;
    }
    public string CategoryName(int categoryid)
    {
        Connection.Open_Connection(con);
        cmd = new SqlCommand("select CategoryName from CategoryMaster where CategoryID='" + categoryid + "'",con);
        string cname = Convert.ToString(cmd.ExecuteScalar());
        Connection.Close_Connection(con);
        return cname;
    }
    public DataTable CountryName()
    {
        Connection.Open_Connection(con);
        cmd = new SqlCommand("spGetCountry", con);
        cmd.CommandType = CommandType.StoredProcedure;

        try
        {
            da = new SqlDataAdapter(cmd);
            dt = new DataTable();
            da.Fill(dt);
        }
        catch (Exception ex)
        {
            erH.ShowError(ex);
        }
        Connection.Close_Connection(con);
        return dt;
    }
    public DataTable BindData(string CategoryId)
    {
        Connection.Open_Connection(con);
        cmd = new SqlCommand("spFindJob", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@CategoryID", SqlDbType.SmallInt).Value =Convert.ToInt16(CategoryId);
        cmd.CommandType = CommandType.StoredProcedure;
        try
        {
            da = new SqlDataAdapter(cmd);
            dt = new DataTable();
            da.Fill(dt);
            con.Close();
        }
        catch (Exception ex)
        {
            erH.ShowError(ex);
        }

        finally
        {
            Connection.Close_Connection(con);
        }
        return dt;
    }
}