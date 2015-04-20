using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using YourCrew;

/// <summary>
/// Summary description for ChatService
/// </summary>
public class ChatService:CommanClass
{
    SqlCommand cmd;

    public DataTable MyMessages(int prifileid,string usertype)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["Conn"].ToString()))
        {
            string qry = "";
                if(usertype=="Contractor")
                {
                    qry="select Communication.CommID, Communication.JobID,Communication.PostDate,ProfileHirer.HirerName,ProfileHirer.PhotoURL,Communication.Message,ContractInfo.JobTitle from  ContractInfo inner join Communication on ContractInfo.JobID=Communication.JobID inner join ProfileHirer  on ProfileHirer.HirerID=Communication.SendTo where CommID in(select max(CommID) as CommID from Communication where sendfrom='"+prifileid+"' group by JobID  having count(JobID)>=1)  order by Communication.PostDate desc";
                }
            else 
                {
                    qry = "select Communication.CommID, Communication.JobID,Communication.PostDate,ProfileHirer.HirerName,ProfileHirer.PhotoURL,Communication.Message,ContractInfo.JobTitle from  ContractInfo inner join Communication on ContractInfo.JobID=Communication.JobID inner join ProfileHirer  on ProfileHirer.HirerID=Communication.SendTo where CommID in(select max(CommID) as CommID from Communication where sendfrom='" + prifileid + "' group by JobID  having count(JobID)>=1)  order by Communication.PostDate desc";
                }
            DataTable dt = new DataTable();
            SqlDataAdapter ad = new SqlDataAdapter(qry, con);
            ad.Fill(dt);
            return dt;
        }
    }
    public string PostMessage(int jobid, int profileid,string message,string filename)
    {

        using (SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["Conn"].ToString()))
        {
            string usertype = UserType();
            cmd = new SqlCommand("spChat", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Mode", "Post");
            cmd.Parameters.AddWithValue("@JobID", jobid);
            cmd.Parameters.AddWithValue("@UserType", usertype);
            cmd.Parameters.AddWithValue("@SendFrom", profileid);
            cmd.Parameters.AddWithValue("@SendTo", profileid);
            cmd.Parameters.AddWithValue("@Message", message);
            cmd.Parameters.AddWithValue("@PhotoURL", filename);
            cmd.Parameters.Add("@Msg", SqlDbType.NVarChar, 500);
            cmd.Parameters["@Msg"].Direction = ParameterDirection.Output;
            Open_Connection(con);
            cmd.ExecuteNonQuery();
            Close_Connection(con);
            string msg = Convert.ToString(cmd.Parameters["@Msg"].Value);
            cmd.Dispose();
            if (msg == "OK")
            {
               return "Message Posted.";
            }
            else return "Please Profide valide information.";
        }
    }
    public DataRow ChatTitle(int profileid,string usertype,int jobid)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["Conn"].ToString()))
        {
            string qry = "";
            if (usertype == "Contractor")
            {
                qry = "select Communication.CommID, Communication.JobID,Communication.PostDate,ProfileHirer.HirerName as Name,ProfileHirer.PhotoURL,Communication.Message,ContractInfo.JobTitle from  ContractInfo inner join Communication on ContractInfo.JobID=Communication.JobID inner join ProfileHirer  on ProfileHirer.HirerID=Communication.SendTo where CommID in(select max(CommID) as CommID from Communication where sendfrom='" + profileid + "' and JobID='"+jobid+"')";
            }
            else
            {
                qry = "select Communication.CommID, Communication.JobID,Communication.PostDate,ProfileHirer.HirerName as Name,ProfileHirer.PhotoURL,Communication.Message,ContractInfo.JobTitle from  ContractInfo inner join Communication on ContractInfo.JobID=Communication.JobID inner join ProfileHirer  on ProfileHirer.HirerID=Communication.SendTo where CommID in(select max(CommID) as CommID from Communication where sendfrom='" + profileid + "' and JobID='" + jobid + "')";
            }
            DataTable dt = new DataTable();
            SqlDataAdapter ad = new SqlDataAdapter(qry, con);
            ad.Fill(dt);
            return dt.Rows[0];
        }
    }
    public DataTable ChatMessages(int profileid,string usertype,int jobid)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["Conn"].ToString()))
        {
            string qry = "";
            if (usertype == "Contractor")
            {
                qry = "select Communication.CommID, Communication.JobID,Communication.PostDate,ProfileHirer.HirerName,ProfileHirer.PhotoURL,Communication.Message,ContractInfo.JobTitle from  ContractInfo inner join Communication on ContractInfo.JobID=Communication.JobID inner join ProfileHirer  on ProfileHirer.HirerID=Communication.SendTo where CommID in(select CommID as CommID from Communication where sendfrom='"+profileid+"')  order by Communication.PostDate desc";
            }
            else
            {
                qry = "select Communication.CommID, Communication.JobID,Communication.PostDate,ProfileHirer.HirerName,ProfileHirer.PhotoURL,Communication.Message,ContractInfo.JobTitle from  ContractInfo inner join Communication on ContractInfo.JobID=Communication.JobID inner join ProfileHirer  on ProfileHirer.HirerID=Communication.SendTo where CommID in(select CommID as CommID from Communication where sendfrom='"+profileid+"')  order by Communication.PostDate desc";
            }
            DataTable dt = new DataTable();
            SqlDataAdapter ad = new SqlDataAdapter(qry, con);
            ad.Fill(dt);
            return dt;
        }
    }
}