unit AddTypeFrm_Mod664;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseEditFrm, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls;

type
  TfrmAddType_Mod664 = class(TfrmBaseEdit)
    Label1: TLabel;
    Label2: TLabel;
    edtType: TEdit;
    btnType: TBitBtn;
    cbbReport: TComboBox;
    procedure btnTypeClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure edtTypeExit(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    LList:TStringList;
    { Private declarations }
  public
    { Public declarations }
    procedure LoadData;
  end;

var
  frmAddType_Mod664: TfrmAddType_Mod664;

implementation

uses uBaseSinglePickListFrm,Datasnap.DBClient,uCommFunc;

{$R *.dfm}

procedure TfrmAddType_Mod664.btnSaveClick(Sender: TObject);
var
  LCds:TClientDataSet;
  LSql:string;
begin
  inherited;
  if trim(edtType.Text)='' then
  begin
    showmessage('材料类型不能为空');
    edtType.SetFocus;
    exit;
  end;
  if cbbReport.Text='' then
  begin
    showmessage('报表名不能为空');
    cbbReport.SetFocus;
    exit;
  end;

  LCds:= TClientDataSet.Create(self);
  try
    LSql:= 'SELECT * FROM DATA0395 WHERE 1=0';
    if not gSvrIntf.IntfGetDataBySql(LSql,LCds) then exit;
    LCds.Append;
    LCds.FieldByName('rkey496').Value:= edtType.Tag;
    LCds.FieldByName('reportname_e').Value:= LList[cbbReport.ItemIndex];
    LCds.FieldByName('reportname_c').Value:= Trim(cbbReport.Text);
    LCds.Post;

    if gSvrIntf.IntfPostDataByTable('data0395',LCds.Delta) then
    begin
      LCds.MergeChangeLog;
      ModalResult:= mrOk;
    end;
  finally
    LCds.Free;
  end;
end;

procedure TfrmAddType_Mod664.btnTypeClick(Sender: TObject);
var
  LFrm: TfrmSinglePickList;
begin
  inherited;
  LFrm:= TfrmSinglePickList.Create(nil);
  try
    LFrm.InitWithPickID(664,2,' where rkey not in(select rkey496 from data0395)');
    if LFrm.ShowModal= mrOk then
    begin
      edtType.Text:= LFrm.cdsPick.FieldByName('group_desc').AsString;
      edtType.Tag:= LFrm.cdsPick.FieldByName('rkey').AsInteger;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmAddType_Mod664.edtTypeExit(Sender: TObject);
var
  LSql:string;
  LCds: TClientDataSet;
begin
  inherited;
  if Trim(edtType.Text) = '' then Exit;
  
  LSql:= 'select rkey,group_name,group_desc from data0496 WHERE group_name=' +
        QuotedStr(Trim(edtType.Text)) + ' AND RKEY NOT IN (select rkey496 from data0395)' ;
  LCds:= TClientDataSet.Create(Self);
  try
    if not gSvrIntf.IntfGetDataBySql(LSql,LCds) then Exit;
    if not LCds.IsEmpty then
    begin
      edtType.Tag:= LCds.FieldByName('rkey').AsInteger;
    end
    else
    begin
      ShowMessage('材料类型有误或已经绑定报表');
      edtType.SetFocus;
      Exit;
    end;
  finally
    LCds.Free;
  end;
end;

procedure TfrmAddType_Mod664.FormDestroy(Sender: TObject);
begin
  inherited;
  LList.Free;
end;

procedure TfrmAddType_Mod664.LoadData;
begin

  LList:=TStringList.Create;
  //  List.add('物料检验通知单.fr3');
  LList.add('铜板来料检验报告.fr3');
  LList.add('钻咀锣刀检验测量报告.fr3');
  LList.add('来料检验测量报告.fr3');
  LList.add('高频板来料检验报告.fr3');

  cbbReport.style:=csDropDown;
  cbbReport.Items.Add('铜板来料检验报表');
  cbbReport.Items.Add('钻咀锣刀检验报表');
  cbbReport.Items.Add('来料检验测量报表');
  cbbReport.Items.Add('高频板来料检验报表');
  cbbReport.Style:=csDropDownList;
end;

end.
