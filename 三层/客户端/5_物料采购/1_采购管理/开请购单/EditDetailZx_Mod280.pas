unit EditDetailZx_Mod280;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RzEdit, RzBtnEdt, uRKeyBtnEdit,uBaseFrm,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Buttons, Vcl.Mask, DBCtrlsEh, uBaseEditFrm,
  Vcl.ExtCtrls, Data.DB, Datasnap.DBClient;

type
  TfrmZxDetailEdit_Mod280 = class(TfrmBaseEdit)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lbl1: TLabel;
    BtSave: TBitBtn;
    BtCan: TBitBtn;
    RedtNeedQty: TRKeyRzBtnEdit;
    dbchkIF_urgency: TDBCheckBox;
    RedtMaterName: TRKeyRzBtnEdit;
    RedtMaterGuige: TRKeyRzBtnEdit;
    RedtQuantity: TRKeyRzBtnEdit;
    RedtRqReason: TRKeyRzBtnEdit;
    DtpkXqrq: TDBDateTimeEditEh;
    RedtUnitName: TRKeyRzBtnEdit;
    ds204: TDataSource;
    cds204: TClientDataSet;
    dbcbbDESCRIPTION_2: TDBComboBox;
    procedure BtSaveClick(Sender: TObject);
    procedure RedtQuantityKeyPress(Sender: TObject; var Key: Char);
    procedure RedtNeedQtyKeyPress(Sender: TObject; var Key: Char);
    procedure RedtQuantityExit(Sender: TObject);
    procedure RedtQuantityChange(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure RedtUnitNameButtonClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  procedure getdataZx(Rkey:string);
  procedure InitZx(Ftype:Integer;AReason:string);
  end;

var
  frmZxDetailEdit_Mod280: TfrmZxDetailEdit_Mod280;

implementation
uses
uCommFunc,uBaseSinglePickListFrm;
{$R *.dfm}
procedure TfrmZxDetailEdit_Mod280.btnCloseClick(Sender: TObject);
begin
  inherited;
 Close;
end;

procedure TfrmZxDetailEdit_Mod280.btnSaveClick(Sender: TObject);
begin
inherited;
  if (RedtMaterName.Text='') then
  begin
    showmessage('请输物料名称...');
    abort;
  end;
  if (RedtMaterGuige.Text='') then
  begin
    showmessage('请输物料规格...');
    abort;
  end;
  if (dbcbbDESCRIPTION_2.Text='') then
  begin
    showmessage('请输物品类别...');
    abort;
  end;
  if (RedtUnitName.Text='') then
  begin
    showmessage('请输物品单位...');
    abort;
  end;
  if (StrToFloat(RedtQuantity.Text)<=0) then
  begin
    showmessage('请输入数量');
    abort;
  end;
  if (RedtRqReason.Text='') then
  begin
    showmessage('请输入请购原因...');
    abort;
  end;
 ModalResult:=mrOk;

end;

procedure TfrmZxDetailEdit_Mod280.BtSaveClick(Sender: TObject);
begin
  inherited;
  if (RedtMaterName.Text='') then
  begin
    showmessage('请输物料名称...');
    abort;
  end;
  if (RedtMaterGuige.Text='') then
  begin
    showmessage('请输物料规格...');
    abort;
  end;
  if (dbcbbDESCRIPTION_2.Text='') then
  begin
    showmessage('请输物品类别...');
    abort;
  end;
  if (RedtUnitName.Text='') then
  begin
    showmessage('请输物品单位...');
    abort;
  end;
  if (StrToFloat(RedtQuantity.Text)<=0) then
  begin
    showmessage('请输入数量');
    abort;
  end;
  if (RedtRqReason.Text='') then
  begin
    showmessage('请输入请购原因...');
    abort;
  end;
 ModalResult:=mrOk;
end;

procedure TfrmZxDetailEdit_Mod280.getdataZx(Rkey: string);
var
  lSQL:string;
  Lcds75:TClientDataSet;
begin
  lSQL := ' select d204.*,d2.unit_code,d2.unit_name'
          +' from Data0204 d204 ' +
          ' inner join data0002 d2 on d204.G_L_PTR=d2.rkey'+
          ' where d204.rkey = '+ Rkey;
  gSvrIntf.IntfGetDataBySql(lSQL,cds204);
  Lcds75:=TClientDataSet.Create(nil);
  try
   gSvrIntf.IntfGetDataBySql('select * from data0075 order by DESCRIPTION',Lcds75);
    while not Lcds75.Eof do
    begin
      dbcbbDESCRIPTION_2.Items.Add(trim(Lcds75.FieldByName('DESCRIPTION').Value));
      Lcds75.Next;
    end;
  finally
   Lcds75.Free;
  end;
end;
procedure TfrmZxDetailEdit_Mod280.RedtNeedQtyKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
   if not CharInSet(Key,['0'..'9',#46,#8,#13]) then   Abort  //判断是否输入数字
   else if Key = Chr(46)  then
   if pos('.',RedtNeedQty.Text)>0 then Abort;    //判断是否重复输入小数点'.'
end;

procedure TfrmZxDetailEdit_Mod280.RedtQuantityChange(Sender: TObject);
begin
  inherited;
  if Trim(RedtQuantity.Text)='' then
  RedtQuantity.Text:='0';
end;

procedure TfrmZxDetailEdit_Mod280.RedtQuantityExit(Sender: TObject);
begin
  inherited;
  cds204.Edit;
  cds204.FieldByName('req_quantity').AsString:=RedtQuantity.Text;
  cds204.Post;
end;

procedure TfrmZxDetailEdit_Mod280.RedtQuantityKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
   if not CharInSet(Key,['0'..'9',#46,#8,#13]) then   Abort  //判断是否输入数字
   else if Key = Chr(46)  then
   if pos('.',RedtQuantity.Text)>0 then Abort;    //判断是否重复输入小数点'.'
end;

procedure TfrmZxDetailEdit_Mod280.RedtUnitNameButtonClick(Sender: TObject);
var
LFrm:TfrmSinglePickList;
begin
  LFrm:=TfrmSinglePickList.Create(Self);
  try
    if Trim(RedtUnitName.Text)<>'' then
    LFrm.InitWithPickID(29,6,' and d17.inv_part_number LIKE ''%'+Trim(RedtUnitName.Text)+'%''')
    else
    LFrm.InitWithPickID(29,6,'');
    if LFrm.cdsPick.IsEmpty then
    begin
     ShowMessage('系统还没有创建相关单位代码,请联系管理员!');
     Exit;
    end;
    if LFrm.ShowModal= mrOk then
    begin
      cds204.Edit;
      cds204.FieldByName('G_L_PTR').Value:= LFrm.cdsPick.FieldByName('RKEY').Value;
      cds204.Post;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmZxDetailEdit_Mod280.InitZx(Ftype: Integer;AReason:string);
begin
  if Ftype=0 then
  begin
  cds204.Append;
  cds204.FieldByName('IF_urgency').Value:=0;
  cds204.FieldByName('REQ_DATE').AsDateTime:=gFunc.GetSvrDateTime;
  cds204.FieldByName('QUANTITY_REQUIRED').Value:=0;
  cds204.FieldByName('reason').Value:= AReason;     // add by zsp 2017-03-20
  cds204.Post;
  end;
end;

end.
