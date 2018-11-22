unit shipped_meth;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, Mask;

type
  TFrm_shipped = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBText2: TDBText;
    DBEdit5: TDBEdit;
    Edit1: TEdit;
    BitBtn4: TBitBtn;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    Memo1: TMemo;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
//   prite:byte;     //保存之前打印=1反之=
//   retn_quan:double;
  public
    { Public declarations }
  end;

var
  Frm_shipped: TFrm_shipped;
  edit_notex: tstringlist;
implementation
uses damo, main, common, shipmeth_search;
{$R *.dfm}

procedure TFrm_shipped.BitBtn3Click(Sender: TObject);
begin
 close;
end;

procedure TFrm_shipped.BitBtn4Click(Sender: TObject);
begin
 try
  form_shipmethod:=tform_shipmethod.Create(application);
  if form_shipmethod.ShowModal=mrok then
   begin
    edit1.Text :=form_shipmethod.ADOQuery1.fieldbyname('description').AsString;
    edit1.Font.Color := clwindowtext;
    Memo1.SetFocus;
   end
  else
   edit1.SetFocus;
 finally
  form_shipmethod.free;
 end;
end;

procedure TFrm_shipped.Edit1Enter(Sender: TObject);
begin
 edit1.Font.Color := clblue;
end;

procedure TFrm_shipped.Edit1Exit(Sender: TObject);
begin
 edit1.Font.Color := clwindowtext;
end;

procedure TFrm_shipped.BitBtn1Click(Sender: TObject);
var
  longtime:TDateTime;
  Rkey235 :string;
begin
// save_note();                     //更新11记事本
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  longtime := getsystem_date(DM.tmp,0);
  try

    with DM.tmp do
    begin
      Close;
      SQL.Text:='SELECT Data0235.goods_name, Data0235.goods_guige, Data0235.goods_type, Data0023.ABBR_NAME, Data0235.quan_to_ship,'+
      ' Data0209.QUANTITY, Data0002.UNIT_NAME, Data0209.TDATE, Data0005.EMPLOYEE_NAME AS Expr1,Data0005.EMPL_CODE, Data0209.remark,'+
      ' Data0209.tran_date,dbo.Data0209.status,case dbo.Data0209.status when ''1'' then ''已装运'' when ''0'' then ''未装运'' end  as ''v_state'' ,'+
      ' Data0209.shipping_method,Data0209.tran_by_userptr,tran_by.EMPLOYEE_NAME, Data0076.CODE, Data0076.REJECT_DESCRIPTION,'+
      ' data0209.Rkey,Data0235.quan_returned,Data0235.QUAN_RECD,Data0072.QUAN_RETN,data0235.rkey as rkey235 '+
      ' FROM Data0209 INNER JOIN Data0235 ON Data0209.SRCE_PTR = Data0235.RKEY INNER JOIN '+
      ' Data0005 ON dbo.Data0209.EMPL_PTR = dbo.Data0005.RKEY left JOIN '+
      ' Data0005 AS tran_by ON dbo.Data0209.tran_by_userptr = tran_by.RKEY INNER JOIN '+
      ' Data0076 ON dbo.Data0209.GL_HDR_PTR = dbo.Data0076.RKEY INNER JOIN '+
      ' Data0002 ON dbo.Data0235.unit_ptr = dbo.Data0002.RKEY INNER JOIN '+
      ' Data0456 ON dbo.Data0235.GRN_PTR = dbo.Data0456.RKEY INNER JOIN '+
      ' Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.RKEY INNER JOIN '+
      ' Data0072 on Data0072.RKEY = Data0235.D0072_PTR where data0209.Rkey='+dm.ADS209Rkey.AsString;
      Open;
      if DM.ADS209v_state.Value <> FieldByName('v_state').Value then
      begin
        ShowMessage('已有人进行了装运，状态发生改变，请刷新后再操作');
        Exit;
      end;
      if DM.ADS209quan_to_ship.Value=0 then
      begin
        ShowMessage('已有人进行了操作，状态发生改变，请刷新后再操作');
        Exit;
      end;
      if Edit1.Text = '' then
      begin
        ShowMessage('请选择装运方式');
        Exit;
      end;
      DM.ADOConnection1.BeginTrans;
      Edit;
      FieldByName('quan_returned').Value := DM.ADS209quan_returned.Value+DM.ADS209QUANTITY.Value;
      FieldByName('QUAN_RETN').Value := DM.ADS209QUAN_RETN.Value + DM.ADS209QUANTITY.Value;
      FieldByName('quan_to_ship').Value := DM.ADS209quan_to_ship.Value- DM.ADS209QUANTITY.Value;
      Rkey235 := FieldByName('rkey235').Value ;
      FieldByName('status').Value := '1';
      FieldByName('tran_by_userptr').Value := frm_main.empl_ptr;
      FieldByName('tran_date').Value := longtime;
      FieldByName('shipping_method').AsString := edit1.Text;
      FieldByName('remark').AsString := Memo1.Lines.Text;  //装运方法
      
  //    FieldByName('reference_number').AsString := edit3.Text;   //barcode
      Post;
    end;
    with DM.tmp do
    begin
      Close;
      SQL.Text := 'insert into data0210(D0235_PTR,po_link_ptr,quantity,tdate,empl_ptr,type) values('+
      Rkey235+','+dm.ADS209D0072_PTR.AsString+','+dm.ADS209QUANTITY.AsString+','+
      QuotedStr(FormatDateTime('yyyy-MM-dd H:mm:ss',longtime))+','+frm_main.empl_ptr+','+'1)';

      ExecSQL;
    end;
    DM.ADOConnection1.CommitTrans;
  except
    on E: Exception do
    begin
      dm.ADOConnection1.RollbackTrans;
      messagedlg(E.Message,mterror,[mbcancel],0);
    end;
  end;
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// dm.ADO210.Close;
// dm.ADO210.Open;
// with dm.ADO210 do  //更新210 //2002.10.31修改成210总是新增一条记录
//  begin
//   append;
//   dm.ADO210D0235_PTR.Value := DM.ADO235rkey.Value;
//   fieldvalues['po_link_ptr'] := dm.ado235d0072_ptr.Value; //72.rkey
//   fieldvalues['quantity'] := retn_quan;
//   fieldvalues['tdate'] := dm.ADO95.FieldValues['tran_date'];
//   dm.ADO210empl_ptr.Value := dm.ADO95.FieldValues['tran_by'];
//   dm.ADO210type.Value:=1;
//   post;
//  end;//060715修改增加记录准备做借项备忘
////^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// if messagedlg('是否打印装箱单?',mtconfirmation,[mbyes,mbno],0)=mryes then
//  form2.report_print();
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 ModalResult:=mrok;
end;



procedure TFrm_shipped.FormShow(Sender: TObject);
begin
  Memo1.Lines.Text := dm.ADS209remark.Value;
end;

end.
