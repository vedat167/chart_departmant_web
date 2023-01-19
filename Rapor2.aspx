<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Rapor2.aspx.cs" Inherits="cizelge.Rapor2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>RAPOR 2</title>

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

    <script type="text/javascript">
        

        $(function () {
            $('#datetimeBaslangic').datetimepicker({
                format: 'DD-MM-YYYY'
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
                    <p>Tarih</p>
                </div>

                <div class="col-md-2">
                    <div class='input-group date' id="datetimeBaslangic" runat="server">
                    <input id="dateTarihBaslangic" runat="server" type="text" class="datepicker date" data-format="dd-MM-yyyy"/>
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-calendar"></span>
                        </span>
                    </div>
                </div>  

                <div class="col-md-2 col-sm-push-4">
                    <asp:Button ID="BtnKayitGetir" runat="server" CssClass="btn btn-info"  Text="KAYIT GETİR" OnClick="BtnKayitGetir_Click"/>
                </div>

                <div style="margin-top:50px">
                    <asp:PlaceHolder ID="DBDataPlaceHolder" runat="server"></asp:PlaceHolder> 
                </div>
            </div>

        </div>
    
    </form>
</body>
</html>
