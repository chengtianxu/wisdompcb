unit Add176_Item;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, ConstVar, Pick_Item_Single;

type
  TfrmAdd176_Item = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    btnFindParam: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    procedure btnSaveClick(Sender: TObject);
    procedure btnFindParamClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAdd176_Item: TfrmAdd176_Item;

implementation

uses data_module;

{$R *.dfm}

procedure TfrmAdd176_Item.btnSaveClick(Sender: TObject);
begin
  dm.ADOConnection1.BeginTrans;
  try
    dm.at176.UpdateBatch();
    dm.ADOConnection1.CommitTrans;
    ModalResult:= mrok;
    ShowMessage('保存成功!');
  except
    dm.ADOConnection1.RollbackTrans;
    ShowMessage('保存失败!');
  end;
end;

procedure TfrmAdd176_Item.btnFindParamClick(Sender: TObject);
var
  InputVar: PDlgInput;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application);
  try
    InputVar.Fields := 'code/仓库代码/110,location/仓库名称/251,'+
                        'abbr_name/工厂简称/125,type/类型/125';
    InputVar.Sqlstr := dm.aq16_15.SQL.Text+' and data0016.location_type=0';
    inputvar.InPut_value:=DBEdit2.Text;
    inputvar.KeyField:='code';
    InputVar.AdoConn := dm.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
      dm.at176rkey_16.AsString:= trim(frmPick_Item_Single.adsPick.FieldValues['rkey']);
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free;
  end;
end;

procedure TfrmAdd176_Item.btnCancelClick(Sender: TObject);
begin
  dm.at176.Cancel;
  ModalResult:= mrCancel;
end;

end.
