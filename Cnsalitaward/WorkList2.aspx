﻿<%@ Page Language="C#" MasterPageFile="~/User.Master"  AutoEventWireup="true" CodeBehind="WorkList2.aspx.cs" Inherits="Cnsalitaward.WorkList2"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contents" runat="server">
    <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
   <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script src="https://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/assets/css/font.css" />
<link rel="stylesheet" href ="/assets/css/default.css" />
        <link rel="stylesheet" href ="/assets/css/worklist.css" />
</head>
    <body style="user-select:none;" >
             <div class="now"  style="margin-left:57.6vw !important;"></div>

     <div style="width:100%; height:14VW; margin-top:6vw; background-image:url(/assets/img/banner.jpg); background-size:100VW 14VW;"></div>
     <div style="text-align:center">
     <div style="font-size:3vw;margin-top:2vw;" class="Dokdo  ">최고의 독자를 뽑습니다</div>
     <div style="font-size:1vw" class="Noto">- <span class="NotoB">2차 운영기간에 비평활동을 가장 많이 한 학생과, 가장 우수하게 한 학생</span>을 뽑아 시상합니다.</div>
     <div style="font-size:1vw" class="Noto">- 정식 대회 시상은 아니지만, <span class="NOtoB">생기부에 해당 내용이 기록</span>됩니다.</div>
     <div style="font-size:1vw" class="Noto">- <span class="NOtoB">비평의 질을 참고</span>하여 시상 여부를 결정할 예정입니다.</div>
   
  </div>
  
           <div style="margin-left: 14.7VW;margin-top:2.2VW ;width: 100%;">
            <div onclick="location.href='WorkList.aspx'" style="cursor:pointer ; font-size:0.8333333333333334VW;float: left; background-color:white;color:#5A5A5A; border:solid 0.05VW;width: 35.3125VW; height: 1.9270833333333335VW; text-align:center;padding-top:0.5208333333333333VW ">운문</div>
             <div  style="float:left; background-color:#5A5A5A ;color:white ;font-size:0.8333333333333334VW;border:solid 0.05VW;width: 35.3125VW; height: 1.875VW; text-align:center;padding-top:0.5208333333333333VW">산문</div>
              </div>


     
     
       <div  class="Dokdo" style="font-size:3.5VW; padding-top: 4.2VW; margin-left:48VW">산문</div>
        <div style="margin-left: 48.9VW;border:solid black 0.05VW;background-color:black ;width:2.18VW; height:0.156VW"></div>
      
        <table style="margin-left: 14.68VW; width: 70.67VW; border: solid #5A5A5A 0.05VW;border-spacing:0px 0px;border-style:none;padding:0px">
            <div style="float: left; margin-bottom:0.8VW">
              
            <div style="float: left;border:none #002897 0.05VW;margin-left: 62VW;margin-right: 0.8VW; width:7.44vw; height:0.2VW; background-color:#002897; margin-top:1.66VW;"></div>
                <asp:TextBox ID="Search" runat="server" style="float:left; border:solid 0.05VW;width:14.89VW;height:1.875VW" placeholder="검색어를 입력하세요." ></asp:TextBox>
                <asp:Imagebutton ID="Searchbtn" ImageUrl="/assets/img/search.jpg" runat="server" OnClick="Searching" style="cursor:pointer;width:0.625VW; height:0.625VW; position:absolute;z-index:3;margin-left:-1.0416666666666665VW; margin-top:0.625VW"></asp:Imagebutton>
                <asp:DropDownList ID="TitleorContent" AutoPostBack="false" style="float:left; font-size:0.9375VW;color:#5A5A5A ;margin-left:62.86VW;width:6.77VW;height:1.875VW;margin-top:-2.08VW; border:none" runat="server">
                    <asp:ListItem Selected="True" Value="Title">제목</asp:ListItem>
                    <asp:ListItem Value="Contents">내용</asp:ListItem>
                </asp:DropDownList>
            </div>
                 <div style="border:solid #002897 0.07VW;background-color:#002897 ;width:70.67VW;margin-top:2.6VW;margin-left:14.68VW;"></div>
       
          
        <tr>
   
            <td class="Noto" style=" font-size:0.8VW ;text-align: center;width:4.4VW; height: 2.5VW;border: solid 0.05VW;">No.</td>
            <td class="Noto" style="font-size:0.8VW;text-align: center;width:37.75VW;border: solid 0.05VW;">제목</td>
            <td class="Noto" style="font-size:0.8VW;text-align: center;width:12vw;border: solid 0.05VW;">작가</td>
          
            <td class="Noto" style="font-size:0.8VW;text-align: center;border: solid 0.05VW;">추천</td>
            <td class="Noto" style="font-size:0.8VW;text-align: center;border: solid 0.05VW;">작성일</td>
            </tr>
        </table>
                 <div style="border:solid white 0.05VW;margin-top:-2.5VW; margin-left:14.68VW; width:0.05VW; height:2.6VW;"></div>
           <div style="border:solid white 0.05VW; margin-top:-2.6VW;margin-left:85.3VW; width:0.05VW; height:2.6VW;"></div>
        
           <%
               string kind = "prose";
               int hcount=0;
               int rc;
               try
               {
                   int rPage;
                   try
                   {
                       rPage = int.Parse(Request.QueryString["page"]);
                   }
                   catch (Exception e)
                   {
                       rPage = 1;
                   }
                   int count = 0;
                   int hc = 0;

                   List<Cnsalitaward.Models.Work> workList = null;
                   List<Cnsalitaward.Models.Work> hotList = null;
                   if (Request.QueryString["titleSearch"] != null)
                   {
                       int pageCounts = Cnsalitaward.Managers.WorkManager.GetPagesCountBySearching(rPage,Request.QueryString["titleSearch"], false, kind);
                       if (rPage > pageCounts)
                           rPage = 1;
                       int nc = 1;
                       workList = Cnsalitaward.Managers.WorkManager.GetWorksBySearching(rPage, Request.QueryString["titleSearch"], false,kind);
                       foreach (var work in workList)
                       {

                           // Write on Page
                           Response.Write("<div style=\"float:left; width:72.6VW ;height:2.8VW; margin-left:14.75VW;\">");
                           Response.Write("<div class=\"Noto\" style=\"text-align: center; float:left; width:4.453VW;font-color:#5A5A5A;padding:0.88VW ;height:2.8VW\";>" + nc + "</div>");
                           Response.Write("<div onclick=\"location.href='Work2?Id=" + work.Id + "&Kind=prose'\"  class=\"Noto\" style=\"cursor:pointer;text-align: center; float:left;width:37.75VW; font-color:#5A5A5A ;padding:0.88VW ;height:2.8VW\";>" + work.Title + "</div>");

                           Response.Write("<div class=\"Noto\" style=\"text-align: center; float:left;width:11.9VW; font-color:#5A5A5A ;padding:0.88VW ;height:2.8VW\";>" + work.Author + "</div>");
                           Response.Write("<div class=\"Noto\" style=\"text-align: center; float:left; width:6.3VW; font-color:#5A5A5A ;padding:0.88VW ;height:2.8VW\";>" + work.Like + "</div>");
                           Response.Write("<div class=\"Noto\" style=\"text-align: center; float:left; width:12vw; font-color:#5A5A5A ;padding:0.88VW ;height:2.8VW\";>" + work.Date.Date.ToString("yy.MM.dd") + "</div>");
                           Response.Write("<div style=\"border:solid #5A5A5A 0.05VW; width:70.6VW;margin-top:2.8VW\";></div>");
                           Response.Write("</div>");
                           ++ nc;


                       }
                   }
                   else if (Request.QueryString["contentsSearch"] != null)
                   {
                       int pageCounts = Cnsalitaward.Managers.WorkManager.GetPagesCountBySearching(rPage,Request.QueryString["contentsSearch"], true,kind);
                       if (rPage > pageCounts)
                           rPage = 1;
                       int nc = 1;
                       workList = Cnsalitaward.Managers.WorkManager.GetWorksBySearching(rPage, Request.QueryString["contentsSearch"], true,kind);
                       foreach (var work in workList)
                       {

                           // Write on Page
                           Response.Write("<div style=\"float:left; width:72.6VW ;height:2.8VW; margin-left:14.75VW;\">");
                           Response.Write("<div class=\"Noto\" style=\"text-align: center; float:left; width:4.453VW;font-color:#5A5A5A;padding:0.88VW ;height:2.8VW\";>" + nc + "</div>");
                           Response.Write("<div onclick=\"location.href='Work2?Id=" + work.Id + "&Kind=prose'\"  class=\"Noto\" style=\"cursor:pointer;text-align: center; float:left;width:37.75VW; font-color:#5A5A5A ;padding:0.88VW ;height:2.8VW\";>" + work.Title + "</div>");
                           Response.Write("<div class=\"Noto\" style=\"text-align: center; float:left;width:11.9VW; font-color:#5A5A5A ;padding:0.88VW ;height:2.8VW\";>" + work.Author + "</div>");
                           Response.Write("<div class=\"Noto\" style=\"text-align: center; float:left; width:6.3VW; font-color:#5A5A5A ;padding:0.88VW ;height:2.8VW\";>" + work.Like + "</div>");
                           Response.Write("<div class=\"Noto\" style=\"text-align: center; float:left; width:10vw; font-color:#5A5A5A ;padding:0.88VW ;height:2.8VW\";>" + work.Date.Date.ToString("yy.MM.dd") + "</div>");
                           Response.Write("<div style=\"border:solid #5A5A5A 0.05VW; width:70.6VW;margin-top:2.8VW\";></div>");
                           Response.Write("</div>");
                           ++ nc;


                       }
                   }
                   else
                   {
                       hcount = Cnsalitaward.Managers.WorkManager.GetHotPagesCount(kind);
                       int pageCounts = Cnsalitaward.Managers.WorkManager.GetPagesCount(kind,hcount);
                       if (rPage > pageCounts)
                           rPage = 1;
                       if (rPage == 1)
                       {
                           hotList = Cnsalitaward.Managers.WorkManager.GetHotWorksPage(kind);
                           foreach (var hot in hotList)
                           {
                               // Write on Page
                               Response.Write("<div style=\"float:left; width:70.6VW ;height:2.8VW; margin-left:14.75VW;background-color:EBEBEB\">");
                               Response.Write("<div class=\"Noto\" style=\"text-align: center; ;background: #FFD8D8 0% 0% no-repeat padding-box;border-radius: 0.10416666666666667VW ;float:left; padding:0.88VW ;width: 2.9166666666666665VW;height:1.3541666666666667VW;margin-top:0.5VW; margin-left:0.6770833333333334VW;margin-right:0.5729166666666666VW\";></div>");
                               Response.Write("<div class=\"Noto\" style=\"font-size:0.8333333333333334VW; margin-left:0.9375VW;position: absolute;margin-top: 0.8VW;color:#AF5151\">화제작</div>");
                                Response.Write("<div onclick=\"location.href='Work2?Id=" + hot.Id + "&Kind=prose'\"  class=\"Noto\" style=\"cursor:pointer;text-align: center; float:left;width:37.75VW; font-color:#5A5A5A ;padding:0.88VW ;height:2.8VW\";>" + hot.Title + "</div>");
                               Response.Write("<div class=\"Noto\" style=\"text-align: center;float:left;width:11.9VW; font-color:#5A5A5A ;padding:0.88VW ;height:2.8VW\";>" + hot.Author + "</div>");

                               Response.Write("<div class=\"Noto\" style=\"text-align: center; float:left; width:7VW; font-color:#5A5A5A ;padding:0.88VW ;height:2.8VW\";>" + hot.Like + "</div>");
                               Response.Write("<div class=\"Noto\" style=\"text-align: center;float:left; width:9.2VW; font-color:#5A5A5A ;padding:0.88VW ;height:2.8VW\";>" + hot.Date.Date.ToString("yy.MM.dd") + "</div>");
                               Response.Write("<div style=\"border:solid #5A5A5A 0.05VW; width:70.6VW;margin-top:2.8VW; position:absolute;\";></div>");
                               Response.Write("</div>");
                               ++hc;



                           }
                           Session["hc"] = hc;
                           workList = Cnsalitaward.Managers.WorkManager.GetWorksByPage(rPage, hc, kind);
                           int count2 = Cnsalitaward.Managers.WorkManager.GetWorksCount(kind);
                           count = 0;
                           int cf = 0;
                           foreach (var work in workList)
                           {

                               // Write on Page
                               Response.Write("<div style=\"float:left; width:72.6VW ;height:2.8VW; margin-left:14.75VW;\">");
                               Response.Write("<div class=\"Noto\" style=\"text-align: center; float:left; width:4.453VW;font-color:#5A5A5A;padding:0.88VW ;height:2.8VW\";>" + (count2 - count) + "</div>");
                               Response.Write("<div onclick=\"location.href='Work2?Id=" + work.Id + "&Kind=prose'\"  class=\"Noto\" style=\"cursor:pointer;text-align: center; float:left;width:37.75VW; font-color:#5A5A5A ;padding:0.88VW ;height:2.8VW\";>" + work.Title + "</div>");
                               Response.Write("<div class=\"Noto\" style=\"text-align: center; float:left;width:11.9VW; font-color:#5A5A5A ;padding:0.88VW ;height:2.8VW\";>" + work.Author + "</div>");

                               Response.Write("<div class=\"Noto\" style=\"text-align: center; float:left; width:6.3VW; font-color:#5A5A5A ;padding:0.88VW ;height:2.8VW\";>" + work.Like + "</div>");
                               Response.Write("<div class=\"Noto\" style=\"text-align: center; float:left; width:10vw; font-color:#5A5A5A ;padding:0.88VW ;height:2.8VW\";>" + work.Date.Date.ToString("yy.MM.dd") + "</div>");
                               Response.Write("<div style=\"border:solid #5A5A5A 0.05VW; width:70.6VW;margin-top:2.8VW\";></div>");
                               Response.Write("</div>");
                               ++ count;
                               ++cf;

                           }



                       }
                       else
                       {
                           int ac = int.Parse(Session["hc"].ToString());
                           int count2 = Cnsalitaward.Managers.WorkManager.GetWorksCount(kind);
                           workList = Cnsalitaward.Managers.WorkManager.GetWorksByPage2(rPage,ac, kind);
                           int sum = count2 - ((rPage-1)*10 - ac );
                           int c = 1;
                           foreach (var work in workList)
                           {

                               // Write on Page
                               Response.Write("<div style=\"float:left; width:72.6VW ;height:2.8VW; margin-left:14.75VW;\">");
                               Response.Write("<div class=\"Noto\" style=\"text-align: center; float:left; width:4.453VW;font-color:#5A5A5A;padding:0.88VW ;height:2.8VW\";>" + sum + "</div>");
                               Response.Write("<div onclick=\"location.href='Work2?Id=" + work.Id + "&Kind=prose'\"  class=\"Noto\" style=\"cursor:pointer;text-align: center; float:left;width:37.75VW; font-color:#5A5A5A ;padding:0.88VW ;height:2.8VW\";>" + work.Title + "</div>");
                               Response.Write("<div class=\"Noto\" style=\"text-align:center;float:left;width:11.9VW; font-color:#5A5A5A ;padding:0.88VW ;height:2.8VW\";>" + work.Author + "</div>");

                               Response.Write("<div class=\"Noto\" style=\"text-align: center; float:left; width:6.3VW; font-color:#5A5A5A ;padding:0.88VW ;height:2.8VW\";>" + work.Like + "</div>");
                               Response.Write("<div class=\"Noto\" style=\"text-align: center; float:left; width:10vw; font-color:#5A5A5A ;padding:0.88VW ;height:2.8VW\";>" + work.Date.ToString("yy.MM.dd") + "</div>");
                               Response.Write("<div style=\"border:solid #5A5A5A 0.05VW; width:70.6VW;margin-top:2.8VW\";></div>");
                               Response.Write("</div>");
                               sum = sum - c;


                           }
                       }

                   }
               }catch(Exception ex)
               {

               }


               %> 
           <div style="text-align: center; margin-top: 32.8VW;">
               <span>
                   <strong><b>
                       <asp:LinkButton runat="server" OnClick="LeftButton_Click" Text="<" ForeColor="#400101" />
                   </b></strong>
               </span>

               <%
                   string queryText = "";
                   int page = 1;
                   int pageCount = 10;
                   try
                   {
                       hcount = int.Parse(Session["hc"].ToString());
                   }
                   catch(Exception e)
                   {
                       hcount = 0;
                   }
                   if (Request.QueryString["titleSearch"] != null)
                   {
                       pageCount = Cnsalitaward.Managers.WorkManager.GetPagesCountBySearching(page,Request.QueryString["titleSearch"], false,kind);
                       try
                       {
                           page = int.Parse(Request.QueryString["page"]);
                       }
                       catch (Exception e)
                       {
                           page = 1;
                       }

                       queryText = "&titleSearch=" + Request.QueryString["titleSearch"];
                   }
                   else if (Request.QueryString["contentsSearch"] != null)
                   {
                       pageCount = Cnsalitaward.Managers.WorkManager.GetPagesCountBySearching(page,Request.QueryString["contentsSearch"], true,kind);
                       try
                       {
                           page = int.Parse(Request.QueryString["page"]);
                       }
                       catch (Exception e)
                       {
                           page = 1;
                       }

                       queryText = "&contentsSearch=" + Request.QueryString["contentsSearch"];
                   }
                   else
                   {
                       pageCount = Cnsalitaward.Managers.WorkManager.GetPagesCount(kind,hcount);
                       try
                       {
                           page = int.Parse(Request.QueryString["page"]);
                       }
                       catch (Exception e)
                       {
                           page = 1;
                       }
                   }

                   // 정상적인 페이지 요청일 경우
                   if (page <= pageCount)
                   {
                       // 요청한 페이지가 마지막 장일경우
                       if (pageCount / 10 == page / 10)
                       {
                           if (page % 10 != 0)
                           {
                               for (int i = 1; i <= pageCount % 10; i++)
                               {
                                   string pageStyle = "";
                                   string textStyle = " style=\"color: #343434;\"";
                                   if (i + ((page / 10) * 10) == page)
                                   {
                                       pageStyle = " class=\"this-page\"";
                                       textStyle = " style=\"color: white;\"";
                                   }

                                   Response.Write("<span" + pageStyle + " style=\"padding: 0.15VW 0.46VW; margin: 0.15VW;\">");
                                   Response.Write("<a" + textStyle + " href=\"/WorkList2.aspx?page=" + (i + ((page / 10) * 10))+ queryText + "\">" + (i + ((page / 10) * 10)) + "</a>");
                                   Response.Write("</span>");
                               }
                           }
                           else
                           {
                               // 마지막 페이지의 일의 자릿 수가 0일 경우
                               for (int i = 1; i <= 10; i++)
                               {
                                   string pageStyle = "";
                                   string textStyle = " style=\"color: #343434;\"";
                                   if (i + page - 10 == page)
                                   {
                                       pageStyle = " class=\"this-page\"";
                                       textStyle = " style=\"color: white;\"";
                                   }

                                   Response.Write("<span" + pageStyle + " style=\"padding: 0.15VW 0.46VW; margin: 0.15VW;\">");
                                   Response.Write("<a" + textStyle + " href=\"/WorkList2.aspx?page=" + (i + page - 10) +queryText +"\">" + (i + page - 10) + "</a>");
                                   Response.Write("</span>");
                               }
                           }
                       }
                       else
                       {
                           for (int i = 1; i <= 10; i++)
                           {
                               string pageStyle = "";
                               string textStyle = " style=\"color: #343434;\"";
                               if (i + ((page / 10) * 10) == page)
                               {
                                   pageStyle = " class=\"this-page\"";
                                   textStyle = " style=\"color: white;\"";
                               }

                               Response.Write("<span" + pageStyle + " style=\"padding: 0.15VW 0.46VW; margin: 0.15VW;\">");
                               Response.Write("<a" + textStyle + " href=\"/WorkList2.aspx?page=" + (i + ((page / 10) * 10)) + queryText+ "\">" + (i + ((page / 10) * 10)) + "</a>");
                               Response.Write("</span>");
                           }
                       }
                   }
                   else
                   {
                       // 첫 목록
                       for (int i = 1; i <= 10; i++)
                       {
                           string pageStyle = "";
                           string textStyle = " style=\"color: #343434;\"";
                           if (i == 1)
                           {
                               pageStyle = " class=\"this-page\"";
                               textStyle = " style=\"color: white;\"";
                           }

                           Response.Write("<span" + pageStyle + " style=\"padding: 0.15VW 0.46VW; margin: 0.15VW;\">");
                           Response.Write("<a" + textStyle + " href=\"/WorkList2.aspx?page=" + i +queryText +"\">" + i + "</a>");
                           Response.Write("</span>");
                       }
                   }
                    %>
               <span>
                   <strong><b>
                       <asp:LinkButton runat="server" OnClick="RightButton_Click" Text=">" ForeColor="#400101" />
                   </b></strong>
               </span>
           </div>
 </body>
    </asp:Content>