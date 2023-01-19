<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Rapor.aspx.cs" Inherits="cizelge.Rapor" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <meta charset="utf-8" />
    <title>RAPOR</title>

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

    <link href="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/css/bootstrap-multiselect.css" rel="stylesheet" type="text/css" />
    <script src="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/js/bootstrap-multiselect.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(function () {
            $('[id*=ListPersonel]').multiselect({
                includeSelectAllOption: true
            });
            $("#Button1").click(function () {
                alert($(".multiselect-selected-text").html());
            });
        });

         $(function () {
             $('#datetimeBaslangic').datetimepicker({
                 format:'DD-MM-YYYY'
             })
        });

         $(function () {
             $('#datetimeBitis').datetimepicker({
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
        <div class="container" style="margin-top:20px">

            <div class="row">
                <div class="col-md-2">
                    <p>Personel Seçimi</p>
                </div>
                <div class="col-md-2">
                    <asp:ListBox ID="ListPersonel" runat="server" SelectionMode="Multiple"></asp:ListBox>
                </div>
                <div class="col-md-2 col-sm-push-6">
                    <asp:Button ID="BtnGeri" runat="server" CssClass="btn btn-danger" Text="GERİ" OnClick="BtnGeri_Click"/>
                </div>
            </div>
            <div class="row" style="margin-top:10px">
                <div class="col-md-2">
                    <p>Tarih Aralığı</p>
                </div>
                <div class="col-md-2">
                    <div class='input-group date' id="datetimeBaslangic" runat="server">
                    <input id="dateTarihBaslangic" runat="server" type="text" class="datepicker date" data-format="dd-MM-yyyy"/>
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-calendar"></span>
                        </span>
                    </div>
                </div>  
                <div class="col-md-2" style="margin-left:30px">
                    <div class='input-group date' id="datetimeBitis" runat="server">
                    <input id="dateTarihBitis" runat="server" type="text" class="datepicker date" data-format="dd-MM-yyyy"/>
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-calendar"></span>
                        </span>
                    </div>
                </div>  
                </div> 
                <div class="row" style="margin-top:40px">
                    <div class="col-md-2  text-left col-sm-push-2" style="margin-left:20px">
                        <asp:Button ID="BtnGtr" runat="server" Text="SEÇİLEN KAYITLARI GETİR" CssClass="btn btn-info" OnClick="BtnGtr_Click"/>
                    </div>              
                </div>
          



            <div class="row">   <div style="margin-top:50px">
                    <asp:PlaceHolder ID="DBDataPlaceHolder" runat="server"></asp:PlaceHolder> 
                </div>
                
                <div class ="col-md-2 col-sm-push-10" style="margin-top:10px">
                    <asp:Button ID="BtnExcel" runat="server" CssClass="btn btn-success" Text="RAPOR AL" OnClick="BtnExcel_Click"/>
                </div>
                <hr />
               
            </div>
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
