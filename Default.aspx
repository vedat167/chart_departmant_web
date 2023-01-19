<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="cizelge.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <meta charset="utf-8" />
    <title>GİRİŞ EKRANI</title>

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
    <link href="classLogin.css" rel="stylesheet" />

    <script type="text/javascript">
        function mymodalu() {
            $('#myModalu').modal();
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
 
        <div class="login-form center-block">

        <h2 class="text-center">GİRİŞ</h2>       
        <div class="form-group ">
            <div style="margin-bottom:10px" tabindex="0">
                    <asp:TextBox ID="TxtAd"   Width="100%"  placeholder="Kullanıcı Adı" runat="server"></asp:TextBox>
            </div>

           <div style="margin-bottom:10px">
                 <asp:TextBox ID="TxtSifre" Width="100%" placeholder="Şifre" TextMode="Password" runat="server" TabIndex="0"></asp:TextBox>
            </div>
                 <asp:Button ID="btnGiris" CssClass="btn btn-primary btn-block" runat="server" Text="GİRİŞ" OnClick="btnGiris_Click"/>
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
                                        <asp:Label ID="LblMesaj" runat="server" Text="Label"></asp:Label>
                                        
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Kapat</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                      </div>
    </form>
</body>
</html>
