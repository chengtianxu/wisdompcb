unit Frm_Shipping;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, Buttons;

type
  TF_Shipping = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBText1: TDBText;
    Label4: TLabel;
    DBText2: TDBText;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Edit2: TEdit;
    SpeedButton4: TSpeedButton;
    LBSale: TLabel;
    EdtSale: TEdit;
    Edit1: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Edit7: TEdit;
    Label12: TLabel;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure EdtSaleEnter(Sender: TObject);
    procedure EdtSaleExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    Fsale :string ;
    FinValid:boolean;
  public
    { Public declarations }
  end;

var
  F_Shipping: TF_Shipping;

implementation

uses DM, Form,common,Pick_Item_Single,ConstVar;

{$R *.dfm}

procedure TF_Shipping.FormShow(Sender: TObject);
begin
     //  装运方法 EdtSale.Text
     Edit2.Text := Trim(F_DM.ADS22REFERENCE_NUMBER.Value); //备注
     Edit1.Text := F_DM.ADS22INV_PART_NUMBER.Value;   //原材料代码
     Edit3.Text := F_DM.ADS22INV_PART_DESCRIPTION.Value;// 描述
     Edit4.Text := F_DM.ADS22WAREHOUSE_CODE.Value;       // 工厂代码

     Edit5.Text := F_DM.ADS22CODE.Value;                 //  供应商代码
     Label12.Caption := F_DM.ADS22TTYPE.AsString;
     Edit6.Text := F_DM.ADS22QUAN_REJD.AsString;       //退货数量
     Label8.Caption := F_DM.ADS22rkey96.AsString;
     Edit7.Text := F_DM.ADS22reject_description.AsString;  //退货原因

end;

procedure TF_Shipping.SpeedButton4Click(Sender: TObject);
 var InputVar: PDlgInput ;
begin
      frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);

  try
  case Tcomponent(Sender).Tag of
    0:
    begin
     InputVar.Fields := 'CODE/装运代码/200,DESCRIPTION/装运方法/250';
      InputVar.Sqlstr :='SELECT RKEY ,CODE,DESCRIPTION FROM DATA0370 order by CODE';
      inputvar.KeyField:='CODE';
      InputVar.InPut_value:=LBSale.Caption;
    end;

  end;
  InputVar.AdoConn := F_DM.ADOConnection1 ;
  frmPick_Item_Single.InitForm_New(InputVar);

  if frmPick_Item_Single.ShowModal=mrok then
  begin
    case Tcomponent(Sender).Tag of
     0:begin
         LBSale.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['CODE']);
         EdtSale.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['DESCRIPTION']);
         LBSale.Tag:=frmPick_Item_Single.adsPick.Fieldbyname('RKEY').AsInteger;
       end;
    end;
  end ;
 finally
   frmPick_Item_Single.Free ;
 end;
end;

procedure TF_Shipping.EdtSaleEnter(Sender: TObject);
begin
     Fsale := EdtSale.Text;
end;

procedure TF_Shipping.EdtSaleExit(Sender: TObject);
begin
    if (Fsale <> EdtSale.Text) and (EdtSale.Text <> '') then
     begin
       F_DM.AQTmp.Close;
       F_DM.AQTmp.SQL.Text := 'SELECT RKEY ,CODE,DESCRIPTION FROM DATA0370 where CODE='''+EdtSale.Text+'''';
       F_DM.AQTmp.Open;
       if F_DM.AQTmp.IsEmpty then
         begin
            { showmessage('装运方法代码不存在...');
             EdtSale.SetFocus;
             Fsale := '';
             FinValid := True;
             Abort; }
         end
       else
         begin
           LBSale.Caption := F_DM.AQTmp.FieldValues['CODE'];
           EdtSale.Text:= F_DM.AQTmp.FieldValues['DESCRIPTION'];
           EdtSale.Tag := F_DM.AQTmp.Fieldbyname('RKEY').AsInteger;
           FinValid := False;

         end;
     end;
end;

procedure TF_Shipping.BitBtn1Click(Sender: TObject);
var
 //   vDateTime:TDateTime;
    E_Ship,E_rkey96,E_QUANTITY,EB_REFERENCE_NUMBER:string;
    retn_quan:double;
begin
//    vDateTime:=common.getsystem_date(f_dm.ADOQuery1,0);
   
    E_Ship := Trim(EdtSale.Text);
    E_rkey96 := Label8.Caption;
    E_QUANTITY :=Trim(Edit6.Text);
    EB_REFERENCE_NUMBER := Trim(Edit2.Text);

   if E_Ship <> '' then
      try
        F_DM.ADOConnection1.BeginTrans;
        F_DM.ADS22.Edit;
//        F_DM.ADS22QUAN_RETURNED.Value := F_DM.ADS22QUAN_RETURNED.Value +
//                                         F_DM.ADS22QUAN_TO_BE_SHIPPED.Value;
//        retn_quan :=F_DM.ADS22QUAN_TO_BE_SHIPPED.Value;
//        F_DM.ADS22QUAN_TO_BE_SHIPPED.Value := 0;
        F_DM.ADS22QUAN_RETURNED.Value := F_DM.ADS22QUAN_RETURNED.Value +
                                          F_DM.ADS22QUAN_REJD.Value;
        retn_quan := F_DM.ADS22QUAN_REJD.Value;
        F_DM.ADS22QUAN_TO_BE_SHIPPED.Value := F_DM.ADS22QUAN_TO_BE_SHIPPED.Value -  F_DM.ADS22QUAN_REJD.Value;
        F_DM.ADS22.Post;

        F_DM.ADOQuery1.Close;
        F_DM.ADOQuery1.SQL.Text := 'update data0096 set USER_PTR= '+ user_ptr + ','+
                                   'status=1,TRAN_DATE=getdate()'+
                                      ',REFERENCE_NUMBER ='+QuotedStr(EB_REFERENCE_NUMBER)+
                                      ',SHIPPING_METHOD='+QuotedStr(E_Ship)+
                                      ' where rkey= '+E_rkey96+' ' ;
        F_DM.ADOQuery1.ExecSQL;

        if not (F_DM.ADS22SOURCE_PTR.IsNull) then
          begin
           with F_DM.ADOQuery1 do
            begin
              active:= false;
              sql.Clear;
              sql.Add('select quan_retn,conversion_factor from data0071');
              sql.Add('where rkey='+F_DM.ADS22SOURCE_PTR.AsString);
              active:= true;
              edit;
              if FieldValues['conversion_factor'] <> 0 then
               fieldvalues['quan_retn']:=fieldbyname('quan_retn').AsFloat+retn_quan/fieldvalues['conversion_factor']
              else
               fieldvalues['quan_retn']:=fieldbyname('quan_retn').AsFloat+retn_quan;
              post;                         //采购单位退货
            end;
          end;

        F_DM.ADOQuery1.Close;
        if not (F_DM.ADS22SOURCE_PTR.IsNull) then
          begin
            F_DM.ADOQuery1.SQL.Text :='insert into data0210(INVT_PTR,PO_LINK_PTR,D0022_PTR,QUANTITY,TDATE,empl_ptr,type) '+
                       ' values('+ F_DM.ADS22key17.AsString +','+F_DM.ADS22SOURCE_PTR.AsString+','+F_DM.ADS22RKEY.AsString+','+E_QUANTITY+','+
                       'getdate(),'+ user_ptr+',0)';
          end
        else
          begin
             F_DM.ADOQuery1.SQL.Text :='insert into data0210(INVT_PTR,PO_LINK_PTR,D0022_PTR,QUANTITY,TDATE,empl_ptr,type) '+
                       ' values('+ F_DM.ADS22key17.AsString +',NULL,'+F_DM.ADS22RKEY.AsString+','+E_QUANTITY+','+
                       'getdate(),'+ user_ptr+',0)';
          end;
        F_DM.ADOQuery1.ExecSQL;

        F_DM.ADOConnection1.CommitTrans;
        ModalResult:=mrOk;
      except
       on E: Exception do
        begin
         F_DM.ADOConnection1.RollbackTrans;
         messagedlg(E.Message,mterror,[mbcancel],0);
         F_DM.ADS22.Close;
         F_DM.ADS22.Open;
        end;
      end
   else
     begin
       ShowMessage('装运方法代码不能为空');
     end; 

end;

end.
