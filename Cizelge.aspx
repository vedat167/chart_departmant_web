<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cizelge.aspx.cs" Inherits="cizelge.Main" %>

<%@ Register Src="~/MessageUsm.ascx" TagPrefix="uc1" TagName="MessageUsm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>ÇİZELGE</title>

    <script src="jquery-3.3.1.min.js"></script>

    <script src="js/modal.js"></script>
    <script src="bootstrapModal/bootstrap.min.js"></script>
    <link href="bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" />
    <link href="bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>


    <script src="bootstrap-datetimepicker/moment.min.js"></script>
    <script src="bootstrap-datetimepicker/bootstrap-datetimepicker.min.js"></script>
    <link href="bootstrap-datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet" />
    <link href="bootstrap-datetimepicker/bootstrap-datetimepicker-standalone.css" rel="stylesheet" />

    <link href="bootstrap-table-master/bootstrap-table-master/dist/bootstrap-table.min.css" rel="stylesheet" />
    <script src="bootstrap-table-master/bootstrap-table-master/dist/bootstrap-table.min.js"></script>
    <script src="bootstrap-table-master/bootstrap-table-master/src/locale/bootstrap-table-tr-TR.js"></script>
    <link href="bootstrap-table-master/bootstrap-table-master/src/bootstrap-table.css" rel="stylesheet" />
    <script src="bootstrap-table-master/bootstrap-table-master/src/bootstrap-table.js"></script>

<%--    <script src="js/jquery.dataTables.js"></script>
    <script src="js/jquery.dataTables.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs/dt-1.10.18/datatables.min.css"/>
 
<script type="text/javascript" src="https://cdn.datatables.net/v/bs/dt-1.10.18/datatables.min.js"></script>--%>

    <style>
        .drpFont {

            font-size:13px;
        }

        .txtFont {
            font-size:13px;
        }
    </style>
   
    <script type="text/javascript">

                 $(function () {
      $('#table').DataTable({
          scrollY: '75vh',
        //stateSave: true,
     
     
      'order': [0, 'desc'],
      'paging'      : true,
      'lengthChange': true,
      'searching'   : true,
      'ordering'    : true,
      'info'        : true,
      'autoWidth': true,
      'processing': true,
  

                     })
                 });

 
         $(function () {
             $('#datetimepicker1').datetimepicker({
                 format:'DD-MM-YYYY'
             })
        });

         $(function () {
             $('#datetimepicker2').datetimepicker({
                 format:'DD-MM-YYYY'
             })
         });

                   
        function mymodalu() {
            $('#myModalu').modal();
    }
       
    </script>
    
    </head>
<body>
    <form id="form1" runat="server">


    
        <uc1:MessageUsm runat="server" ID="MessageUsm" />
        <%--HiddenFieldValue--%>
        <asp:HiddenField ID="hdnref" runat="server" />
        <asp:HiddenField ID="hdnValue" runat="server" />
          
        <div class="container" style="margin-top:20px">
            <%--Personel Seçimi , Getir Butonu , Çıkış Buton--%>
            <div class="row">
                <div class="col-md-2">
                    <p>Personel Seçimi</p>
                </div>
                <div class="col-md-2">
                    <asp:DropDownList ID="DrpPersonel" CssClass="dropdown-header" runat="server"></asp:DropDownList>       
                </div>
                <div class="col-md-2" style="margin-left: 60px">
                    <asp:Button ID="BtnGetir" CssClass="btn btn-info" runat="server" Text="GETİR" OnClick="BtnGetir_Click1"/>
                </div>
                <div class ="col-md-2 col-sm-push-2">
                    <asp:Button ID="BtnRapor" CssClass="btn btn-info" runat="server" Text="DETAYLI RAPOR AL" OnClick="BtnRapor_Click"/>
                </div>
                <div class="col-md-2 col-sm-push-2">
                    <asp:Button ID="BtnCikis" CssClass="btn btn-danger" runat="server" Text="ÇIKIŞ" OnClick="BtnCikis_Click"/>
                </div>
            </div>
           <%-- Başlangıç Tarihi --%>        
            <div class="row">
                <div class="col-md-2">
                    <p>Başlangıç Tarihi</p>
                </div>
                <div class="col-md-2">
                    <div class='input-group date' id="datetimepicker1" runat="server">
                    <input id="dateTarihBas" runat="server" type="text" class="datepicker date" data-format="dd-MM-yyyy"/>
                        <span class="input-group-addon">
                           <span class="glyphicon glyphicon-calendar"></span>
                        </span>
                    </div>
                </div>   
                <div class="col-md-2" style="margin-left:40px">
                    <p style="color: red">(Raporlamada Başlangıç Tarihi Baz Alınmıştır)</p>
                </div>
            </div>
            <%--Bitiş Tarihi--%>
            <div class="row">
                <div class="col-md-2">
                    <p>Bitiş Tarihi</p>
                </div>
                <div class="col-md-2">
                    <div class='input-group date' id="datetimepicker2" runat="server">
                    <input id="dateTarihBit" runat="server" type="text" class="datepicker date" data-format="dd-MM-yyyy"/>
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-calendar"></span>
                        </span>
                    </div>
                </div>                               
            </div>
            <%--Başlangıç Saati--%>
            <div class="row">
                <div class="col-md-2">
                    <p>Başlangıç Saati</p>
                </div>
                <div class="col-md-2">
                    <asp:DropDownList ID="DrpBas"  runat="server"></asp:DropDownList>
                </div>                               
            </div>
            <%--Bitiş Saati--%>
            <div class="row">
                <div class="col-md-2">
                    <p>Bitiş Saati</p>
                </div>
                <div class="col-md-2">
                    <asp:DropDownList ID="DrpBit"  runat="server"></asp:DropDownList>
                </div>
            </div>
            <%--Yapılan iş--%>
            <div class="row">
                <div class="col-md-2">
                    <p>Yapılan İş</p>
                </div>
                <div class="col-md-2">
                    <div class="table-hover">
                           <asp:TextBox ID="TxtYapilan" Width="250px" CssClass="text-info " runat="server" TextMode="MultiLine"></asp:TextBox>
                    </div>
                </div>
            </div>

            <div class="row" style="margin-top:20px">    
               <%-- Kaydet , Vazgeç , sil butonları--%>
                <div class="col-md-1 text-left col-sm-push-2">
                    <asp:Button  ID="kydbutton" CssClass="btn btn-success" runat="server" Text="KAYDET" OnClick="button_Click"/>                 
                </div>
                <div class="col-md-2 col-sm-push-2">
                    <asp:Button ID="btnVazgec" CssClass="btn btn-info" runat="server" Text="VAZGEÇ" OnClick="btnVazgec_Click"/>
                </div>
                <div class="col-md-2 text-right col-sm-push-1">
                    <input id="btnSil" type="button" onclick="mymodal()" class="btn btn-danger" runat="server" value="SEÇİLEN KAYDI SİL" />
                </div>
                <%--Hafta ileri ve geri butonları--%>
                <div class="col-md-2 col-sm-push-5">                    
                     <asp:Button ID="BtnGeri" CssClass="btn btn-info" runat="server" Text="<<" OnClick="BtnGeri_Click"/>
                    <asp:Label ID="Label1" CssClass="text-danger" runat="server" Text="Hafta "></asp:Label>
                    <asp:Label ID="LblHafta" CssClass="text-danger" runat="server" Text="Hafta"></asp:Label>
                     <asp:Button ID="BtnIleri" CssClass="btn btn-info" runat="server" Text=">>"  OnClick="BtnIleri_Click"/>   
                    <asp:Label ID="LblSaatFarki" runat="server" Text=""></asp:Label>
                </div>
            </div>
            <hr />
           
            <%--Excel aktar butonu--%>
            <div class="row">   
                <%--DataPlaceHolder--%>
                <asp:PlaceHolder ID="DBDataPlaceHolder" runat="server"></asp:PlaceHolder> 
                <hr />
                          
                <div class ="col-md-2 col-sm-push-10" style="margin-top:5px">                    
                        <asp:Button ID="Button1" CssClass="btn btn-info" runat="server" Text="EXCEL E AKTAR" OnClick="BtnExcel_Click" />
                </div>
            </div>
            <%--Uyarı mesajı için modal--%>
            <div class="row">
                <div class="modal fade" id="myModalu" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Uyarı Mesajı</h4>
                        </div>
                        <div class="modal-body">
                            <asp:Label ID="LblMessage" runat="server" Text="Label"></asp:Label>       
                        </div>
                        <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Kapat</button>

                        </div>
                    </div>
                    </div>
                </div>
            </div> 
        </div>
        
    </form>     
</body>   
</html>
