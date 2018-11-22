unit PasSetLevel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls, Menus;

type
  TfrmSetLevel = class(TForm)
    Panel1: TPanel;
    BitBtn5: TBitBtn;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    labName: TLabel;
    edtName: TEdit;
    Edit1: TEdit;
    DBGridEh1: TDBGridEh;
    DataSource1: TDataSource;
    Label3: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    Label4: TLabel;
    Edit2: TEdit;
    Label5: TLabel;
    N2: TMenuItem;
    Label6: TLabel;
    Label7: TLabel;
    procedure BitBtn5Click(Sender: TObject);
    procedure edtNameExit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure edtNameKeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetLevel: TfrmSetLevel;

implementation

uses common,PasDM;

{$R *.dfm}

procedure TfrmSetLevel.BitBtn5Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmSetLevel.edtNameExit(Sender: TObject);
begin
  if  (Trim(edtName.Text)<>'') then
  begin
    if ((StrToInt(edtName.Text)>250) or (StrToInt(edtName.Text)<0))  then
    begin
      ShowMsg('编号范围(0-250)的数值',1);
      edtName.SetFocus;
      Exit;
    end;
  end;
end;

procedure TfrmSetLevel.BitBtn2Click(Sender: TObject);
begin
  if  (Trim(edtName.Text)='') then
  begin
    ShowMsg('程度编号不能为空',1);
    exit;
  end;
  if  (Trim(Edit1.Text)='') then
  begin
    ShowMsg('程度名称不能为空',1);
    exit;
  end;
  DM.tmp.Close;
  DM.tmp.SQL.Clear;
  DM.tmp.SQL.Text:='select * from data0283 where PRIORITY_CODE='+Trim(edtName.Text)+'';
  DM.tmp.open;
  if not dm.tmp.IsEmpty then
  begin
    if (MessageBox(Handle,'该程度编号已设置,'+#13+'确定重新设置吗?','重新设置提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO)	then exit;
    DM.tmp.Close;
    DM.tmp.SQL.Clear;
    DM.tmp.SQL.Text:='update data0283 set PRIORITY_name='''+Trim(edit1.Text)+''',iSort='+Trim(edit2.Text)+' where PRIORITY_CODE='+Trim(edtName.Text)+'';
    DM.tmp.ExecSQL;
  end else
  begin
    DM.tmp.Close;
    DM.tmp.SQL.Clear;
    DM.tmp.SQL.Text:='Insert into data0283 (PRIORITY_CODE,PRIORITY_name,iSort) Values (:PRIORITY_CODE,:PRIORITY_name,:iSort)';
    DM.tmp.Parameters.ParamByName('PRIORITY_CODE').Value:=StrToInt(Trim(edtName.Text));
    DM.tmp.Parameters.ParamByName('PRIORITY_name').Value:=Trim(Edit1.Text);
    DM.tmp.Parameters.ParamByName('iSort').Value:=StrToInt(Trim(Edit2.Text));
    DM.tmp.ExecSQL;
  end;
  edtName.Text:='';
  Edit1.Text:='';
  Edit2.Text:='';
  Edit1.Enabled:=False;
  edit2.Enabled:=False;
  DM.Ado283.Close;
  DM.Ado283.Open;
end;

procedure TfrmSetLevel.FormShow(Sender: TObject);
begin
  DM.Ado283.Close;
  DM.Ado283.Open;
end;

procedure TfrmSetLevel.N1Click(Sender: TObject);
begin
  if (strtoint(vprev)<>4)  then
  begin
    messagedlg('对不起,您的权限不够',mtinformation,[mbok],0);
    Exit;
  end;
  if (not dm.ado283.IsEmpty) then
  begin
    if messagedlg('删除后将无法还原，确定删除吗?',mtConfirmation,[mbyes,mbno],0)=mryes then
    begin
    try
      if (dm.ado283PRIORITY_CODE.AsInteger=0) then
      begin
        ShowMessage('不能删除该记录，请修改名称！');
        Exit;
      end;
      DM.tmp.Close;
      DM.tmp.SQL.Clear;
      DM.tmp.SQL.Text:='delete data0283 where PRIORITY_CODE='+dm.ado283PRIORITY_CODE.AsString;
      DM.tmp.ExecSQL;
      DM.ado283.Close;
      DM.ado283.Open;
    finally
    end;
    end;
  end;
end;

procedure TfrmSetLevel.Edit2Exit(Sender: TObject);
begin
  if  (Trim(Edit2.Text)<>'') then
  begin
    if ((StrToInt(Edit2.Text)>250) or (StrToInt(Edit2.Text)<0))  then
    begin
      ShowMsg('编号范围(0-250)的数值',1);
      Edit2.SetFocus;
      Exit;
    end;
  end;
end;

procedure TfrmSetLevel.edtNameKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'.. '9',#8,#13]) then Key:=#0;
end;

procedure TfrmSetLevel.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'.. '9',#8,#13]) then Key:=#0;
end;

procedure TfrmSetLevel.DBGridEh1DblClick(Sender: TObject);
begin
  edtName.Text:=DM.ado283.fieldbyName('PRIORITY_CODE').AsString;
  Edit1.Enabled:=True;
  edit2.Enabled:=True;
  Edit1.Text:=DM.ado283.fieldbyName('PRIORITY_name').AsString;
  Edit2.Text:=DM.ado283.fieldbyName('iSort').AsString;
end;

procedure TfrmSetLevel.N2Click(Sender: TObject);
begin
  DM.tmp.Close;
  DM.tmp.SQL.Clear;
  DM.tmp.SQL.Text:='select top 1 * from data0283 order by PRIORITY_CODE desc';
  DM.tmp.Open;
  if (dm.tmp.IsEmpty) then edtName.Text:='0'
  else
  edtName.Text:=IntToStr(DM.tmp.fieldBYName('PRIORITY_CODE').AsInteger+1);
  Edit1.Enabled:=True;
  edit2.Enabled:=True;
  Edit1.Text:='';
  Edit2.Text:='';
end;

end.
