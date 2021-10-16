﻿using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cnsalitaward
{
    public partial class ApplyAccount: System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
			if(Session["Iscnsa"] != null)
			{

			}
			else
			{
				Session["IsNotStd"] = "Notcnsa";
				Response.Redirect("/Check");
			}

        }
		protected void Apply_Click(object sender, EventArgs e)
		{
			string realNAME = realName.Text;
			int realNUM = Int32.Parse(realNum.Text);
			string userID = userId.Text;
			string userPW = userPw.Text;
			string userPW2 = userPw2.Text;
			string userPN = penName.Text;
			if (string.IsNullOrEmpty(realNAME.Trim())) // 이름이 비어있을 경우
				Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('이름을 입력해주세요.')", true);
			else if (string.IsNullOrEmpty(realNum.Text.Trim())) // 학번이 비어있을 경우
				Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('학번을 입력해주세요.')", true);
			else if (string.IsNullOrEmpty(userID.Trim())) // ID가 비어있을 경우
				Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('아이디를 입력해주세요.')", true);
			else if (string.IsNullOrEmpty(userPW.Trim())) // PW가 비어있을 경우
				Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('비밀번호를 입력해주세요.')", true);
			else if (string.IsNullOrEmpty(userPN.Trim())) // PenName이 비어있을 경우
				Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('필명을 입력해주세요.')", true);
			else
			{
				if (Session["onlyNum"] != null && Session["onlyID"] != null)
				{
					if (userPW == userPW2)
					{
						MySqlConnection con = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Cnsalitaward"].ConnectionString);
						con.Open();

						string sql = "INSERT INTO account(RealName, RealNum, UserID, UserPW, PenName) VALUES(?,?,?,?,?)";
						MySqlCommand cmd = new MySqlCommand(sql, con);

						Random r = new Random();
						r.Next();
						userPN = DateTime.Now.ToString("yy") + userPN + r.Next(1, 99);

						cmd.Parameters.Add("RealName", MySqlDbType.VarChar).Value = realNAME;
						cmd.Parameters.Add("RealNum", MySqlDbType.Int32).Value = realNUM;
						cmd.Parameters.Add("UserID", MySqlDbType.VarChar).Value = userID;
						cmd.Parameters.Add("UserPW", MySqlDbType.VarChar).Value = userPW;
						cmd.Parameters.Add("PenName", MySqlDbType.VarChar).Value = userPN;
						cmd.ExecuteNonQuery();

						Response.Redirect("/Login");
						con.Close();
					}
					else
					{
						pwcheck.Text = "※ 비밀번호가 일치하지 않습니다.";
						pwcheck.Style.Add("color", "red");
					}
				}
				else
				{
					Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('중복확인이 완료되었는지 확인해주세요.')", true);
				}
			}
		}
		protected void CheckNumber_Click(object sender, EventArgs e)
		{
			string IsOnly = Cnsalitaward.Managers.Account.CheckNum(realNum.Text);
			string RealNum = realNum.Text;
			if (string.IsNullOrEmpty(RealNum.Trim()))
				Response.Write("<script>alert('학번을 입력해주세요.');</script>");
			else
			{
				if (IsOnly == "only")
				{
					onlyNumber.Text = "※ 가입 가능한 학번입니다.";
					onlyNumber.Style.Add("color", "green");
					Session["onlyNum"] = "ok";
				}
				else
				{
					onlyNumber.Text = "※ 중복된 학번입니다.";
					onlyNumber.Style.Add("color", "red");
					Session["onlyNum"] = null;
				}
			}
		}
		protected void CheckID_Click(object sender, EventArgs e)
		{
			string IsOnly = Cnsalitaward.Managers.Account.CheckID(userId.Text);
			string UserID = userId.Text;
			if (string.IsNullOrEmpty(UserID.Trim()))
				Response.Write("<script>alert('아이디를 입력해주세요.');</script>");
			else
			{
				if (IsOnly == "only")
				{
					onlyID.Text = "※ 사용가능한 아이디입니다.";
					onlyID.Style.Add("color", "green");
					Session["onlyID"] = "ok";
				}
				else
				{
					onlyID.Text = "※ 중복된 아이디입니다.";
					onlyID.Style.Add("color", "red");
					Session["onlyID"] = null;
				}
			}
		}


	}
}