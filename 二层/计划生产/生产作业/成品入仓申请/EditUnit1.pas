unit EditUnit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, Grids, DBGridEh, Mask, Menus;

type
  TEditForm1 = class(TForm)
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Edit2: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit3: TEdit;
    Edit6: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label7: TLabel;
    Edit1: TEdit;
    Edit7: TEdit;
    Label12: TLabel;
    Edit12: TEdit;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    Edit9: TEdit;
    Label8: TLabel;
    Edit10: TEdit;
    Label9: TLabel;
    Edit11: TEdit;
    DBGridEh1: TDBGridEh;
    Edit8: TEdit;
    Label2: TLabel;
    Label13: TLabel;
    Edit13: TEdit;
    GroupBox4: TGroupBox;
    Label14: TLabel;
    Edit15: TEdit;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label15: TLabel;
    Edit14: TEdit;
    SpeedButton1: TSpeedButton;
    Label26: TLabel;
    Edit16: TEdit;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Edit17: TEdit;
    Label35: TLabel;
    Label36: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Exit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Edit17DblClick(Sender: TObject);
  private
    { Private declarations }

  public

  end;

var
  EditForm1: TEditForm1;

implementation

uses
   DMUnit1,common,Pick_Item_Single,ConstVar;

{$R *.dfm}


procedure TEditForm1.BitBtn2Click(Sender: TObject);
begin
  modalresult:=mrCancel;
end;

procedure TEditForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#8,#13]) then
    abort;
end;

procedure TEditForm1.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9','-',#8]) then
    abort;
end;

procedure TEditForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  begin
      key:=#0;
      perform(wm_nextdlgctl,0,0);{移动到下一个控件}
  end;
end;

procedure TEditForm1.Edit1Exit(Sender: TObject);
begin
  if  strtointdef(edit1.Text,0) > strtointdef(edit4.Text,0)  then
  begin
    showmsg('提交数不能大于当前数量,请更改',1);
    edit1.SetFocus ;
    exit;
  end;
  if edit3.Text<>'0' then
    edit7.Text:=inttostr(strtointdef(edit3.Text,0)-round((strtointdef(edit4.Text,0)-strtointdef(edit1.Text,0))/strtointdef(edit12.Text,0)+0.49999));
end;

procedure TEditForm1.BitBtn3Click(Sender: TObject);
 var
   PRIOR_DAYS:Single;
begin
  if  strtointdef(edit1.Text,0) > strtointdef(edit4.Text,0)  then
   begin
     showmsg('提交PCS数不能大于当前PCS数量,请更改',1);
     edit1.SetFocus ;
     exit;
   end;
   
  if edit3.Text<>'0' then       //在线PNL
    edit7.Text:=inttostr(strtointdef(edit3.Text,0)-round((strtointdef(edit4.Text,0)-strtointdef(edit1.Text,0))/strtointdef(edit12.Text,0)+0.49999));

  if pos('后补',Edit14.Text)>0 then
   begin
     showmsg('后补客户订单号不允许出货,请与市场部联系!',1);
     edit17.SetFocus;
     exit;
   end;

  if (Edit17.Tag>0) and
     (strtointdef(edit1.Text,0)+strtoint(label33.Caption)>strtoint(label31.Caption) ) then
   begin
     showmsg('按订单提交,本次提交数量加上已提交数量不能大于订单加退货数量',1);
     edit1.SetFocus ;
     exit;
   end;

 if (Edit17.Tag>0) then
  begin
    with dm.TemADOQuery1 do
    begin
      Close;
      SQL.Text:='select PRIOR_DAYS from data0192';
      open;
      PRIOR_DAYS:=fieldbyname('PRIOR_DAYS').AsCurrency;
    end;
    with dm.TemADOQuery1 do
    begin
      Close;
      sql.Text:=
        'SELECT  dbo.Data0060.PARTS_ORDERED * dbo.Data0025.unit_sq AS ordered_sq '+
        'FROM    dbo.Data0060 INNER JOIN '+
        ' dbo.Data0025 ON dbo.Data0060.CUST_PART_PTR = dbo.Data0025.RKEY ' +
        'WHERE  (dbo.Data0025.ttype = 0) AND (dbo.Data0060.reg_tax_fixed_unused = 0) '+
        'and (data0060.so_tp=0) and (data0060.rkey='+inttostr(Edit17.Tag)+')';
      Open;
    end;
    if (not DM.TemADOQuery1.IsEmpty) and
       (DM.TemADOQuery1.FieldByName('ordered_sq').AsCurrency < PRIOR_DAYS) and
       (strtointdef(edit1.Text,0) < StrToIntDef(label32.Caption,0) )  then
     begin
      showmsg('自制量产小批量订单要求一次性提交入库,请与计划部联系!',1);
      edit1.SetFocus ;
      exit;
     end;
  end;

  modalresult:=mrok;
end;

procedure TEditForm1.Edit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if trim(edit1.Text)='' then  edit1.Text:=edit4.Text;

end;

procedure TEditForm1.SpeedButton1Click(Sender: TObject);
  var InputVar: PDlgInput ;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
    InputVar.Fields := 'SALES_ORDER/销售订单/100,MANU_PART_NUMBER/本厂编号/100,PO_NUMBER/客户订单/100,'+
       'CUST_CODE/客户代码/80,qty_ordered/订单加退货/100,REPUT_APPR_BY/已提交数/100';
    InputVar.Sqlstr :=
      'SELECT  Data0060.SALES_ORDER, dbo.Data0025.MANU_PART_NUMBER, dbo.Data0097.PO_NUMBER, Data0010.CUST_CODE,'+#13+
      '  Data0060.PARTS_ORDERED + Data0060.PARTS_RETURNED AS qty_ordered,'+#13+
      '  dbo.Data0060.PARTS_ORDERED - dbo.Data0060.PARTS_SHIPPED + dbo.Data0060.PARTS_RETURNED - dbo.Data0060.RETURNED_SHIP AS parts_margin,'+#13+
      '  ISNULL(dbo.Data0060.REPUT_APPR_BY, 0) AS REPUT_APPR_BY, dbo.Data0060.RKEY'+#13+
      'FROM         dbo.Data0060 INNER JOIN'+#13+
      '  dbo.Data0097 ON dbo.Data0060.PURCHASE_ORDER_PTR = dbo.Data0097.RKEY INNER JOIN'+#13+
      '  dbo.Data0025 ON dbo.Data0060.CUST_PART_PTR = dbo.Data0025.RKEY INNER JOIN'+#13+
      '  dbo.Data0010 ON dbo.Data0060.CUSTOMER_PTR = dbo.Data0010.RKEY'+#13+
      'WHERE (Data0060.STATUS = 1) and '+
      '(data0025.MANU_PART_NUMBER like '+
      quotedstr(Copy(DM.ADOQALL2MANU_PART_NUMBER.Value,1,length(DM.ADOQALL2MANU_PART_NUMBER.Value)-2)+'%')+')';


    inputvar.KeyField:='SALES_ORDER';

  InputVar.AdoConn := DM.ADOConnection1 ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
     Edit14.text:=frmPick_Item_Single.adsPick.Fieldbyname('PO_NUMBER').AsString;
     Edit17.Text:=frmPick_Item_Single.adsPick.Fieldbyname('SALES_ORDER').AsString;
     Edit17.Tag := frmPick_Item_Single.adsPick.Fieldbyname('RKEY').AsInteger;
     
     Label31.Caption:=frmPick_Item_Single.adsPick.Fieldbyname('qty_ordered').AsString;
     Label32.Caption:=frmPick_Item_Single.adsPick.Fieldbyname('parts_margin').AsString;
     Label33.Caption:=frmPick_Item_Single.adsPick.Fieldbyname('REPUT_APPR_BY').AsString;

     DM.TemADOQuery1.Close;
     DM.TemADOQuery1.SQL.Text:='select sum(QTY_ON_HAND) from data0053 where po_number='''+Edit14.text+'''';
     DM.TemADOQuery1.Open;
     if DM.TemADOQuery1.Fields[0].IsNull then
        Label34.Caption:='0'
     else
       Label34.Caption:=DM.TemADOQuery1.Fields[0].AsString;
  end ;
  finally
    frmPick_Item_Single.Free ;
  end;
end;

procedure TEditForm1.Edit17DblClick(Sender: TObject);
begin
 Edit17.Text:='';
 Edit14.Text:='';
 label31.Caption:='';
 Label32.Caption:='';
 label33.Caption:='';
 label34.Caption:='';
 Edit17.Tag:=0;
end;

end.

