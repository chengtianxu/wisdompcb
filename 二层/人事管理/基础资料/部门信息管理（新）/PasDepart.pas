unit PasDepart;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfrmDepart = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnSave: TBitBtn;
    btnCancle: TBitBtn;
    stDepartCode: TStaticText;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    edtCode: TEdit;
    edtName: TEdit;
    edtCount: TEdit;
    edtPercent: TEdit;
    chkState: TCheckBox;
    StaticText4: TStaticText;
    chkbox: TCheckBox;
    procedure btnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCountKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }

  public
    { Public declarations }
  ParKey:Integer;
  edState:Integer;
  end;

var
  frmDepart: TfrmDepart;

implementation

uses PasDM,common;

{$R *.dfm}

procedure TfrmDepart.btnSaveClick(Sender: TObject);
begin

    if Trim(edtCode.Text)='' then
    begin
      MessageDlg('请输入部门编号',mtWarning, [mbOK], 0);
      Exit;
    end
    else
    begin
      if edState <> 2 then
      begin
        DM.ADOAddorEdit.Close;
        DM.ADOAddorEdit.SQL.Clear;
        DM.ADOAddorEdit.SQL.Add('select rkey,departmentcode from datadepartment where departmentcode = ''' + Trim(edtCode.Text)+ '''');
       // ShowMessage(DM.ADOAddorEdit.SQL.Text);
        DM.ADOAddorEdit.Open;
        if not DM.ADOAddorEdit.IsEmpty then
        begin
          ShowMessage('部门编号已经存在，请重新输入');
          exit;
        end;
      end;
    end;
    
    if Trim(edtName.Text)='' then
    begin
      MessageDlg('请输入部门名称', mtWarning, [mbOK], 0);
      Exit;
    end;

    with DM.ADOAddorEdit do
    begin
      if edState=1 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('select rkey,departmentcode,departmentname,superior,invalid,departmentration,max_overproof_percent,NeedBox from datadepartment where rkey is null');
        Open;
        Append;
      end
      else
      begin
        Close;
        sql.Clear;
        SQL.Add('select rkey,departmentcode,departmentname,superior,invalid,departmentration,max_overproof_percent,NeedBox from datadepartment where rkey = ' + IntToStr(ParKey));
        Open;
        Edit;
      end;

      FieldByName('departmentcode').AsString:=Trim(edtCode.Text);
      FieldByName('departmentname').AsString:=Trim(edtName.Text);
      if edState=1 then 
      FieldByName('superior').AsInteger:= ParKey;
      FieldByName('invalid').AsBoolean:= chkState.Checked;
      if Trim(edtCount.Text)<>'' then
        FieldByName('departmentration').AsInteger:=StrToInt(Trim(edtCount.Text))
      else
        FieldByName('departmentration').AsInteger:=0;
      if Trim(edtPercent.Text)<>'' then
        FieldByName('max_overproof_percent').AsInteger:=StrToInt(Trim(edtPercent.Text))
      else
        FieldByName('max_overproof_percent').AsInteger:=0;
      FieldByName('NeedBox').AsBoolean:= chkbox.Checked;
      Post;
      ModalResult:=mrOk;
    end;

end;

procedure TfrmDepart.FormShow(Sender: TObject);
begin
  edtCount.Enabled:=false;
  edtPercent.Enabled := false;
  if  strtoint(vprev)=4 then edtCount.Enabled :=true;
  if  strtoint(vprev)=4 then edtPercent.Enabled :=true;
  if edState=2 then
  begin
    with DM.ADOAddorEdit do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select rkey,departmentcode,departmentname,superior,invalid,departmentration,max_overproof_percent,NeedBox from datadepartment where rkey = ' + IntToStr(ParKey));
      Open;

      edtCode.Text:= FieldByName('departmentcode').AsString;
      edtCode.Enabled:=false;
      edtName.text:= FieldByName('departmentname').AsString;
      edtCount.Text:= FieldByName('departmentration').AsString;
      edtPercent.Text:= FieldByName('max_overproof_percent').AsString;
      chkState.Checked:=FieldByName('invalid').AsBoolean;
      chkbox.Checked:= FieldByName('NeedBox').AsBoolean;
    end;
  end;
end;

procedure TfrmDepart.edtCountKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9',#8]) then
  Abort;
end;

end.
