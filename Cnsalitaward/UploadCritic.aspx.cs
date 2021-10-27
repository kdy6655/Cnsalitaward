﻿using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cnsalitaward
{
    public partial class UploadCritic : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //DisplayData1();
            MySqlConnection conn = null;
            conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Cnsalitaward"].ConnectionString);
            conn.Open();
            if(!Page.IsPostBack)
            {
                DisplayData1();
                String getState = "Select Title as TextField, Id as ValueField from verse  union Select Title as TextField, Id as ValueField from prose;";

                DataTable dt = new DataTable();
                MySqlDataAdapter da = new MySqlDataAdapter(getState, conn);

                da.Fill(dt);

                criticwork.DataSource = dt;
                criticwork.DataTextField = "TextField";
                criticwork.DataValueField = "TextField";
                criticwork.DataBind();

                conn.Close();
                //넘겨져 온 번호값에 해당하는 글 출력

            }

            string check = Cnsalitaward.Managers.Account.CheckAdmin(Session["UserID"].ToString());

            if (check == "admin")
            {
                if (Session["UserID"] == null)
                {
                    Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('로그인을 해주세요.'); window.location.href = 'Login.aspx';", true);
                }
                else
                {

                }
                if (!Page.IsPostBack)
                {
                    // 넘겨져 온 번호값에 해당하는 글 출력
                    
                }
                else
                {

                }
            }
			else
			{
                if (!Page.IsPostBack)
                {
                    // 넘겨져 온 번호값에 해당하는 글 출력
                   
                }
                else
                {

                }
             }


        }
        private void DisplayData1()
        {

            try
            {
                string number = Request.QueryString["Id"].ToString();
                string User = Session["UserID"].ToString();
                string Admin = Session["Admin"].ToString();
                int id = Convert.ToInt32(number);
                var work = Managers.CriticManager.GetCritic(id);

                if (Admin == "admin" || User == work.UserID)
                {

                    Titletxt.Text = work.Title;
                    Contenttxt.Text = work.Content.Replace("<br/>", "\r\n");
                    Uploadbtn.Style["visibility"] = "hidden";
                    Savebtn.Style["visibility"] = "visible";


                }

            }
            catch (Exception ex)
            {
                Savebtn.Style["visibility"] = "hidden";
            }
        }
        protected void Save_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["Id"].ToString());

            Managers.CriticManager.ModifyWork(new Models.Critic
            {
                Title = Titletxt.Text,
                Content = Contenttxt.Text,
                Id = id
            });
            Response.Redirect("/CriticList");
        }
        protected void Upload_Click(object sender, EventArgs e)
        {
            Managers.CriticManager.UploadCritic(new Models.Critic
            {
                UserID = Session["UserID"].ToString(),
                Author = Session["PenName"].ToString(),
                Title = Titletxt.Text,
                Content = Contenttxt.Text,
                Like = 0,
                View = 0,
                Work = criticwork.SelectedValue.ToString()
            });
            Response.Redirect("/CriticList");
        }
    }
}