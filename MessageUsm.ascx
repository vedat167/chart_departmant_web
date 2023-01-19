<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MessageUsm.ascx.cs" Inherits="cizelge.MessageUsm" %>

<script>
    function mymodal() {
        $('#myModal').modal();
    }
        $(document).ready(function () {

        var tarih = new Date();
        var gun = tarih.getDay();
        var ay = tarih.getMonth();
        var yil = tarih.getFullYear();
        var gunler = ['Pazar', 'Pazartesi', 'Salı', 'Çarşamba', 'Perşembe', 'Cuma', 'Cumartesi'];
        var aylar = ['Ocak', 'Şubat', 'Mart', 'Nisan', 'Mayıs', 'Haziran', 'Temmuz', 'Ağustos', 'Eylül', 'Ekim', 'Kasım', 'Aralık'];
        $('.tarih_gun').html(tarih.getDate() + ' ' + aylar[ay] + ' ' + yil + ' ' + gunler[gun]);
        $('.user_ad').html('<%= Session["USERAD"] %>'); 
        $('.sayfa_isim').html(window.location.pathname.toString().replace("/", ""));
     
           

          

            
      
    })
 
</script>
  <div class="modal  no-display " id="myModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                        <div class="modal-content"  style="border: 5px solid #004899; border-radius:5px;" id="modal">
                            <div class="modal-header">
                      
                              <div class="box-tools pull-right">
                                    <button runat="server" id="Button1"  data-dismiss="modal" aria-hidden="true">  <i class="glyphicon glyphicon-expand"></i></button>
                                </div>
                                <p class="modal-title">
                                            <i class="glyphicon glyphicon-alert"></i>
                                 <b style="color:#fa960b"> UGLASS </b>| 
                                    <span style="margin-left:10px"> - Silme İşlemi</span>
                                    </p>
                            </div>
                            <div class="modal-body">
                              <%--   <p><i class="fa fa-user" style="margin-right:5px"></i><span class="user_ad"></span></p>--%>
                         
                              
                         <h4 style="color:red"><i class="ion ion-alert-circled" ></i> Kayıt Silinecektir... Devam Etmek istiyor musunuz..?</h4>
                               <hr />
                                <%--<p><i class="fa fa-calendar" style="margin-right:5px"></i><b>Güncelleme Tarihi :</b><span class="tarih_gun"></span></p>
                                <p><i class="fa fa-user-circle-o" style="margin-right:5px"></i><b>Kaydı Değiştiren :</b><span class="user_ad"></span></p>
                                   <p><i class="fa fa-server" style="margin-right:5px"></i><b>Modül :</b><span class="sayfa_isim"></span></p>
                              <p><i class="fa fa-eye" style="margin-right:5px"></i><b>Log kaydı :</b><span >Aktif</span></p>--%>
                            </div>
                            <div class="modal-footer">
                                <button runat="server" id="btnModalKapat" class="btn btn-danger pull-left" data-dismiss="modal" aria-hidden="true"><i class="fa fa-close" style="margin-right:5px"></i>Hayır</button>

                               <asp:LinkButton ID="btn_guncelle" CssClass="btn btn-info pull-right" runat="server" OnClick="btnClick_Click"><i class="fa fa-save" style="margin-right:5px"></i>Kaydı Sil</asp:LinkButton>
                            </div>
                        </div>
            </div>
        </div>