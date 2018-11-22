unit Uedit176;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB, ADODB;

type
  TfrmEdit176 = class(TForm)
    pnl1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    btnFindParam: TBitBtn;
    lbl6: TLabel;
    edt_LCode: TEdit;
    qry_save176: TADOQuery;
    edt_LName: TEdit;
    edt_AbbrName: TEdit;
    edt_LType: TEdit;
    edt_Location: TEdit;
    edt_LQty: TEdit;
    qry_save176rkey: TAutoIncField;
    qry_save176location: TWideStringField;
    intgrfld_save176rkey_16: TIntegerField;
    qry_save176quantity: TBCDField;
    procedure btnFindParamClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure edt_LQtyKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    FEType:integer;
    Frkey:integer;
  end;

var
  frmEdit176: TfrmEdit176;

implementation
   uses UDM,Pick_Item_Single,ConstVar;
{$R *.dfm}

procedure TfrmEdit176.btnFindParamClick(Sender: TObject);
var
  InputVar: PDlgInput;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(self);
  try
    InputVar.Fields := 'code/仓库代码/110,Mlocation/仓库名称/120,'+
                        'abbr_name/工厂简称/125,type/类型/125';
    InputVar.Sqlstr :=' select d16.rkey, d16.code,d16.location as Mlocation,d15.abbr_name, '+
                     ' case d16.location_type when 0 then ''材料仓'' when 1 then ''成品仓'' end as type '+
                     '  from   data0016  d16  '+
                     ' inner join Data0015  d15  on d16.whouse_ptr=d15.rkey    '+
                     ' where d16.location_type=0   ';
    inputvar.InPut_value:=edt_LCode.Text;
    inputvar.KeyField:='code';
    InputVar.AdoConn := dm.con1;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
     edt_lcode.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').asinteger;
     edt_lcode.Text:= frmPick_Item_Single.adsPick.Fieldbyname('code').asstring;
     edt_LName.Text:= frmPick_Item_Single.adsPick.Fieldbyname('Mlocation').asstring;
     edt_LType.Text:= frmPick_Item_Single.adsPick.Fieldbyname('type').asstring;
     edt_AbbrName.Text:= frmPick_Item_Single.adsPick.Fieldbyname('abbr_name').asstring;
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free;
  end;
end;

procedure TfrmEdit176.btnCancelClick(Sender: TObject);
begin
close;
end;

procedure TfrmEdit176.btnSaveClick(Sender: TObject);
begin
  if Trim(edt_Location.Text)=''  then
  begin
  ShowMessage('详细位置不能为空!');
  edt_Location.SetFocus;
  Exit;
  end;
  if Trim(edt_LQty.Text)=''  then
  begin
  ShowMessage('仓存按量不能为空!');
  edt_LQty.SetFocus;
  Exit;
  end;
  if FEType=0 then
  qry_save176.Append
  else
  qry_save176.Edit;

  qry_save176.FieldByName('rkey_16').Value:=edt_LCode.Tag;
  qry_save176.FieldByName('location').Value:=Trim(edt_Location.Text);
  qry_save176.FieldByName('quantity').Value:=StrToFloat(Trim(edt_LQty.Text));

  qry_save176.UpdateBatch(arall);
   Frkey:=qry_save176.FieldByName('rkey_16').asinteger;
  self.ModalResult:=mrOk;
  

end;

procedure TfrmEdit176.edt_LQtyKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in [ '0'..'9',#8,chr(VK_delete)]) then key:=char(0);
end;

end.

