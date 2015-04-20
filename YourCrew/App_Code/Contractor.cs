using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.IO;

/// <summary>
/// Summary description for Contractor
/// </summary>
public class Contractor:CommanClass
{
    SqlCommand cmd;
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["Conn"].ToString());
    public int GetContractorid(string username)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["Conn"]))
        {
            Open_Connection(con);
            cmd = new SqlCommand("spGetContractorid", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@UserName", SqlDbType.VarChar, 50).Value = username;
            cmd.Parameters.Add("@JID", SqlDbType.Int).Value = 0;
            cmd.Parameters.Add("@Contractorid", SqlDbType.Int);
            cmd.Parameters["@Contractorid"].Direction = ParameterDirection.Output;
            cmd.ExecuteNonQuery();
            Close_Connection(con);
            return Convert.ToInt32(cmd.Parameters["@Contractorid"].Value);
        }
    }
    public string GetContractorUserName(int contractorid)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["Conn"]))
        {
            Open_Connection(con);
            cmd = new SqlCommand("spGetContractorUsername", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@UserName", SqlDbType.VarChar, 30);
            cmd.Parameters.Add("@Contractorid", SqlDbType.Int).Value=contractorid;
            cmd.Parameters["@UserName"].Direction = ParameterDirection.Output;
            cmd.ExecuteNonQuery();
            Close_Connection(con);
            string username = Convert.ToString(cmd.Parameters["@UserName"].Value);
            cmd.Dispose();
            return username;
        }
    }
    public int GetContractorid(int jid)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["Conn"]))
        {
            Open_Connection(con);
            cmd = new SqlCommand("spGetContractorid", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@UserName", SqlDbType.VarChar, 50).Value = "";
            cmd.Parameters.Add("@JID", SqlDbType.Int).Value = jid;
            cmd.Parameters.Add("@Contractorid", SqlDbType.Int);
            cmd.Parameters["@Contractorid"].Direction = ParameterDirection.Output;
            cmd.ExecuteNonQuery();
            Close_Connection(con);
            return Convert.ToInt32(cmd.Parameters["@Contractorid"].Value);
        }
    }
    public List<string> GetPics(string contractorid)
    {
        if (!Directory.Exists(HttpContext.Current.Server.MapPath("UploadPics/" + contractorid + "/")))
            Directory.CreateDirectory(HttpContext.Current.Server.MapPath("UploadPics/" + contractorid + "/"));


        List<string> img = new List<string>();
        List<string> img2 = new List<string>();
        img = Directory.GetFiles(HttpContext.Current.Server.MapPath("UploadPics/" + contractorid + "/")).ToList();
        foreach (var list in img)
        {
            img2.Add(Path.GetFileName(list));
        }
        return img2;
    }
    public List<string> GetSlider(string contractorid)
    {
        if (!Directory.Exists(HttpContext.Current.Server.MapPath("~/ProfileContractor/UploadSlider/" + contractorid + "/")))
            Directory.CreateDirectory(HttpContext.Current.Server.MapPath("~/ProfileContractor/UploadSlider/" + contractorid + "/"));


        List<string> img = new List<string>();
        List<string> img2 = new List<string>();
        string s = HttpContext.Current.Server.MapPath("~/ProfileContractor/UploadSlider/" + contractorid + "/");
        img = Directory.GetFiles(HttpContext.Current.Server.MapPath("~/ProfileContractor/UploadSlider/" + contractorid + "/")).ToList();
        foreach (var list in img)
        {
            img2.Add(Path.GetFileName(list));
        }
        return img2;
    }
    public DataTable getHirerProfile(int hirerid)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["Conn"]))
        {
            cmd = new SqlCommand("spHirerProfile", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@HirerID", SqlDbType.Int).Value = hirerid;
            cmd.Parameters.Add("@Msg", SqlDbType.NVarChar, 255);
            cmd.Parameters["@Msg"].Direction = ParameterDirection.Output;
            SqlDataAdapter ad = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            ad.Fill(dt);
            return dt;
        }
    }
    public DataRow JobProfile(int jid)
    {
        try
        {
            cmd = new SqlCommand("spGetJobProfile", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@JID", jid);
            DataTable dt = new DataTable();
            SqlDataAdapter ad = new SqlDataAdapter(cmd);
            ad.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                return dt.Rows[0];
            }
            else return null;
        }
        catch(SqlException ex)
        {
            return null;
        }
    }
    public DataTable GetJobTitle(int profileid,string usertype)
    {
        using(SqlConnection con=new SqlConnection(ConfigurationManager.AppSettings["Conn"].ToString()))
        {
            Open_Connection(con);
            DataTable dt = new DataTable();
            cmd=new SqlCommand("spJobs",con);
            cmd.CommandType=CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserType",usertype);
            cmd.Parameters.AddWithValue("@ProfileID",profileid);
            cmd.Parameters.AddWithValue("@Mode","GetJobTitle");
            cmd.Parameters.Add("@Msg",SqlDbType.NVarChar,500);
            cmd.Parameters["@Msg"].Direction = ParameterDirection.Output;
            cmd.ExecuteNonQuery();
            Close_Connection(con);
            SqlDataAdapter ad=new SqlDataAdapter(cmd);
            ad.Fill(dt);
            return dt;
        }
    }
}