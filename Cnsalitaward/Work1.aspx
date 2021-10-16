<%@ Page Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Work1.aspx.cs" Inherits="Cnsalitaward.Work1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contents" runat="server">

    <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" href="/assets/css/work.css" />
</head>
    <body style="user-select:none;">

              <script>
            function pop(url, width, height) {
                        window.open(url,width,height);  
              
            }
        </script>
             <div class="now" style="margin-left:57.6vw !important; margin-top:4.3vw;"></div>

      <div style="width:100%; height:14VW; margin-top:3VW; background-image:url(/assets/img/banner.jpg); background-size:100VW 14VW;"></div>

    <%
        string kind = "verse";
        int id;
        try {
            id = int.Parse(Request.QueryString["id"]);
        } catch (Exception e) {
            id = 1;
        }
        var work = Cnsalitaward.Managers.WorkManager.GetWork(id, kind);
       
        %>
<!--- 운문 산문 선택 --->

<div onclick="location.href='WorkList'"  class = "verse" style = "cursor:pointer;float:left;">운문</div>
<div onclick="location.href='WorkList2'"  class = "prose" style = "cursor:pointer;float:left;">산문</div>



<!--- 운문 --->
<div class = "text_verse">운문</div>
<div class = "underline"></div>


 
<!--- 본문 --->
<div class = "body">
<div class = "title"><%=work.Title%></div>
     
  <div class = "grayline"></div>
  
  <div class = "writer" style = "float:left"> 작가 </div>
  <div class = "realwriter" style = "float:left"><%=work.Author %></div>
  <div class = "verticalline" style = "float:left"></div>
  
  <div class = "date" style = "float:left"> 작성일 </div>
  <div class = "realdate" style = "float:left"><%=work.Date.Date.ToString("yy.MM.dd") %></div>
  <div class = "verticalline" style = "float:left"></div>
  

  
  <div class = "good" style = "float:left"> 추천 </div>
  <div class = "realgood" style = "float:left"><%=work.Like %></div>
  
        <asp:Button runat="server" Text="수정" ID="Modifybtn" Onclick="Modify_Click" class = "rewrite" style = "margin-left:50vw !important; margin-top:-2.35vw !important;  cursor:pointer; border:1px solid white; font-size:1.3vw; float:left"></asp:Button>
<asp:Button runat="server" Text="삭제" ID="Deletebtn" OnClick="Delete_Click"  onclientclick="return DeleteItem();" class = "delete" style = "border:1px solid white;  cursor:pointer; font-size:1.3vw; float:left"></asp:Button>
    <asp:Button ID="downloadbtn" OnClick="Download_Click" style="float:right; border:1px solid white; font-size:1.3vw; margin-top:-2.8vw !important; margin-right:1.8vw;  cursor:pointer" CssClass="delete" runat="server" Text="다운로드" />
  <div class = "blueline"></div>
  
  <div class = "maintext"><%=work.Content %>
        <div class = "blueline" style = "margin-top:2.81VW;"></div>

     
<asp:Button runat="server" Text="추천" ID="Likebtn" OnClick="Like_Click" class = "like" style = " cursor:pointer; float:left"></asp:Button>
    <asp:Button runat="server" Text="목록" ID="Listbtn" OnClick="List_Click" class = "list" style = " cursor:pointer; float:left"></asp:Button>
   
  </div>
  
          
       <script type="text/javascript">
                    function DeleteItem() {
            if (confirm("삭제 하시겠습니까?")) {
                return true;
            }
            return false;
        }
 </script>
</body>

    </asp:Content>
