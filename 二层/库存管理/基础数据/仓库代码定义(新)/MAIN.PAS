unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, DB, ADODB, Grids, DBGrids, Mask,
  DBCtrls, Menus;

type
  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    Bar1: TStatusBar;
    DBGrid1: TDBGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    BtBrush: TBitBtn;
    Label5: TLabel;
    Edit1: TEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BtQry: TBitBtn;
    BitBtn6: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure BtBrushClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BtQryClick(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
  private
    { Private declarations }
    PreColumn: TColumn;
    field_name:string;
    sSql :string;
  public
    { Public declarations }
    is_new:boolean;
  end;

var
  Form1: TForm1;

implementation

uses edit_lo,common, damo, QrySet;

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  application.Terminate;
end;

procedure TForm1.N2Click(Sender: TObject);
var
  rkey:integer;
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    ShowMsg('对不起!您没有该程序的可写权限',1);
    Exit;
  end;
  try
    rkey:=dm.AQ16rkey.Value;
    dm.AQ16.Edit;
    form2:=tform2.Create(application);
    if form2.ShowModal=mrok then
    else
      dm.AQ16.Locate('rkey',rkey,[]);
  finally
    form2.free;
  end;
end;

procedure TForm1.N1Click(Sender: TObject);
var
  rkey:integer;
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    ShowMsg('对不起!您没有该程序的可写权限',1);
    Exit;
  end;
  try
    is_new:=True;
    rkey:=dm.AQ16rkey.Value;
    dm.AQ16.Append;
    form2:=tform2.Create(application);
    if form2.ShowModal=mrok then
    else
      dm.AQ16.Locate('rkey',rkey,[]);
  finally
    form2.free;
  end;
end;

procedure TForm1.N3Click(Sender: TObject);
var
 v_recode:array[2..4] of variant;
 i:word;
 rkey:integer;
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    ShowMsg('对不起!您没有该程序的可写权限',1);
    Exit;
  end;
  is_new:=false;
  rkey:=dm.AQ16rkey.Value;
  for i:=2 to 4 do
    v_recode[i]:=dm.AQ16.Fields[i].Value;
  dm.AQ16.Append;
  for i:=2 to 4 do
    dm.AQ16.fieldvalues[dm.AQ16.Fields[i].FieldName]:=v_recode[i];
  try
    form2:=Tform2.Create(application);
    if form2.ShowModal=mrok then
    else
      dm.AQ16.Locate('rkey',rkey,[]);
  finally
    form2.Free;
  end;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    ShowMsg('对不起!您没有该程序的可写权限',1);
    Exit;
  end;
  if MessageBox(Handle,'确定删除这条记录吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
  DM.ADOConnection1.BeginTrans;
  try
    DM.temp.Close;
    DM.temp.SQL.Text:='delete from data0016  where rkey='+DM.AQ16rkey.AsString;
    DM.temp.ExecSQL;
    DM.ADOConnection1.CommitTrans;
    showmessage('数据被成功删除!');
    BtBrushClick(nil);
  except
    DM.ADOConnection1.RollbackTrans;
    showmessage('不能删除该仓库,已有库存!');
  end;
end;

procedure TForm1.DBGrid1TitleClick(Column: TColumn);
begin
  dm.AQ16.Sort:=Column.FieldName;
  if (column.ReadOnly) and (field_name<>column.FieldName) then
  begin
    label5.Caption:=column.Title.Caption;
    self.field_name:=column.FieldName;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
  end
  else
    edit1.SetFocus;
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
var
 searchoption:tlocateoptions;
begin
  searchoption:=[lopartialkey];
  if Key = Chr(vk_Back) then       //如果按下了backspace
  begin
    if length(bar1.SimpleText)>5 then
      bar1.SimpleText:=copy(bar1.SimpleText,1,length(bar1.SimpleText)-1);
    if length(bar1.SimpleText)>5 then
      dm.AQ16.Locate(dm.AQ16.IndexName,copy(bar1.SimpleText,6,length(bar1.SimpleText)),searchoption)
    else
   dm.AQ16.First
  end
  else
    if key=chr(vk_return) then    //如果按下了enter
      n2click(sender)           //调用编辑命令
    ELSE
    begin
      bar1.SimpleText := bar1.SimpleText+key;
      dm.AQ16.Locate(dm.AQ16.IndexName,copy(bar1.SimpleText,6,length(bar1.SimpleText)),searchoption);
    end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  if not app_init_2(dm.ADOConnection1) then
  begin
    showmsg('程序起动失败请联系管理员!',1);
    application.Terminate;
  end;
  self.Caption:=application.Title;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  if dm.Adoconnection1.Connected then
  begin
    dm.AQ16.Close;
    dm.AQ04.Close;
    field_name:=DBGrid1.Columns[0].FieldName;
    PreColumn:=DBGrid1.Columns[0];
    dm.aq04.Open;
    dm.AQ16.Open;
    sSql:=DM.AQ16.SQL.Text;
    if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    begin
      BitBtn2.Enabled:=False;
      BitBtn3.Enabled:=False;
      BitBtn4.Enabled:=False;
      BitBtn5.Enabled:=False;
    end
    else
    begin
      BitBtn2.Enabled:=True;
      BitBtn3.Enabled:=True;
      BitBtn4.Enabled:=True;
      BitBtn5.Enabled:=True;
    end;
  end;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
  if dm.AQ16.IsEmpty then
  begin
   n2.Enabled:=false;
   n3.Enabled:=false;
   n4.Enabled:=false;
  end
  else
  begin
   n2.Enabled:=true;
   n3.Enabled:=true;
   n4.Enabled:=true;
  end;
end;

procedure TForm1.BtBrushClick(Sender: TObject);
var
 i:integer;
begin
  if dm.AQ16.IsEmpty then exit;
  i:=dm.AQ16rkey.AsInteger;
  dm.AQ16.Close;
  dm.AQ16.Open;
  dm.AQ16.Locate('rkey',i,[]);
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
  if trim(Edit1.text)<>'' then
    dm.AQ16.Filter:=field_name+' like ''%'+trim(edit1.text)+'%'''
  else
    dm.AQ16.Filter:=''
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
var
 rkey:integer;
begin
  try
    is_new:=True;
    rkey:=dm.AQ16rkey.Value;
    dm.AQ16.Append;
    form2:=tform2.Create(application);
    if form2.ShowModal=mrok then  begin end
    else
    begin
      dm.AQ16.Locate('rkey',rkey,[]);
      dm.AQ16.Cancel;
    end;
  finally
   form2.free;
  end;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
var
  rkey:integer;
begin
  try
    rkey:=dm.AQ16rkey.Value;
    dm.AQ16.Edit;
    form2:=tform2.Create(application);
    if form2.ShowModal=mrok then
    else
      dm.AQ16.Locate('rkey',rkey,[]);
  finally
    form2.free;
  end;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
var
 v_recode:array[2..5] of variant;
 i:word;
 rkey:integer;
begin
  is_new:=false;
  rkey:=dm.AQ16rkey.Value;
  for i:=2 to 5 do
    v_recode[i]:=dm.AQ16.Fields[i].Value; //读到数组中
  dm.AQ16.Append;
  for i:=2 to 5 do
    dm.AQ16.fieldvalues[dm.AQ16.Fields[i].FieldName]:=v_recode[i];
  try
    form2:=Tform2.Create(application);
    if form2.ShowModal=mrok then
    else
      dm.AQ16.Locate('rkey',rkey,[]);
  finally
    form2.Free;
  end;
end;

procedure TForm1.BitBtn5Click(Sender: TObject);
begin
  if MessageBox(Handle,'确定删除这条记录吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
  DM.ADOConnection1.BeginTrans;
  try
    DM.temp.Close;
    DM.temp.SQL.Text:='delete from data0016  where rkey='+DM.AQ16rkey.AsString;
    DM.temp.ExecSQL;
    DM.ADOConnection1.CommitTrans;
    showmessage('数据被成功删除!');
    BtBrushClick(nil);
  except
    DM.ADOConnection1.RollbackTrans;
    showmessage('不能删除该仓库,已有库存!');
  end;
end;

procedure TForm1.BtQryClick(Sender: TObject);
var i:integer;
    Sqlstr:string;
begin
  if Qry=nil then  Qry:=Qry.Create(Application);
  if Qry.ShowModal=mrok then
  begin
    for i:=1 to Qry.sgrid1.RowCount-2 do
      if Qry.sgrid1.Cells[2,i]<> '' then Sqlstr:=sqlstr+Qry.SGrid1.Cells[2,i];
    DM.AQ16.SQL.Text:=sSql+' '+Sqlstr+' order by data0016.code';
    DM.AQ16.Close;
    DM.AQ16.Open;
  end;
end;

procedure TForm1.BitBtn6Click(Sender: TObject);
begin
  Export_dbGrid_to_Excel(dbgrid1,self.Caption)
end;

end.
