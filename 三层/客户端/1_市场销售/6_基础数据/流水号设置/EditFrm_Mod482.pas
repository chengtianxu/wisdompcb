unit EditFrm_Mod482;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseEditFrm, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls,Data.DB, Vcl.Mask, RzEdit, RzBtnEdt, uRKeyBtnEdit,uCommFunc,
  Datasnap.DBClient, Data.Win.ADODB;

type
  TAfterUpdate_Mod482 = procedure (ACds:TClientDataSet) of object;    //保存后刷新
  TfrmEdiFrm_Mod482 = class(TfrmBaseEdit)
    cds81: TClientDataSet;
    ds81: TDataSource;
    lbl1: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edt_layers: TRKeyRzBtnEdit;
    edt_sufchar: TRKeyRzBtnEdit;
    qrytemp: TADOQuery;
    qrytemprkey: TAutoIncField;
    qrytemplayers: TWordField;
    qrytempsufchar: TStringField;
    procedure btnSaveClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  FEditType : Integer;
  procedure GetData(ARkey : string);
  function  DataIsValid(Sender: TObject):Boolean;
  end;

var
  frmEdiFrm_Mod482: TfrmEdiFrm_Mod482;

implementation




procedure TfrmEdiFrm_Mod482.GetData(ARkey : string);
var
  Lsql23: string;
begin
  Lsql23 := ' select * from data0081 where rkey = ' + ARkey;

  if not gSvrIntf.IntfGetDataBySql(Lsql23, cds81) then   exit;
end;

{$R *.dfm}

procedure TfrmEdiFrm_Mod482.btnCloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmEdiFrm_Mod482.btnSaveClick(Sender: TObject);
begin
  inherited;
  if self.DataIsValid(Sender) then
  begin
     if Trim(edt_layers.Text)='' then
     begin
     ShowMessage('层数不能为空！');
     exit;
     end;

     cds81.Edit;
     cds81.FieldByName('layers').Value :=trim(edt_layers.text);
     cds81.FieldByName('sufchar').Value :=trim(edt_sufchar.text);
     cds81.Post;

     if  gSvrintf.IntfPostDataByTable('data0081', cds81.Delta) then
     begin
     cds81.MergeChangeLog;
     showmessage('保存成功');
     ModalResult:=mrok;
     end;

  end;
end;


function TfrmEdiFrm_Mod482.DataIsValid(Sender: TObject): Boolean;
var
  Surfchar:integer;
begin
  Result :=false;
  if edt_layers.Enabled then
    begin
    with qrytemp do
    begin
      Close;
      Parameters.ParamValues['Layer']:=edt_layers.Text;
      Open;
    end;


    if not qrytemp.IsEmpty then
      begin
        showmessage('输入层数已存在，请确认！');
        if edt_layers.Enabled then
          edt_layers.SetFocus
        else
          edt_sufchar.SetFocus;
        exit;
      end;
  end;
  try
    Surfchar :=strtoint(edt_sufchar.text);
    if (Surfchar < 0) then
      begin
        showmessage('流水号输入错误！');
        edt_sufchar.SetFocus;
        exit;
      end;
    edt_sufchar.Text:=StringofChar('0',4-Length(edt_sufchar.Text))+edt_sufchar.Text;
  except
    showmessage('流水号输入错误，请输入10位内数字字符！');
    edt_sufchar.SetFocus;
    exit;
  end;
  Result :=true;
end;

end.
